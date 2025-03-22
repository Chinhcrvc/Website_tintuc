package crud.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import crud.entities.Categories;
import crud.entities.News;
import crud.until.JDBCHelper;

public class NewsDAO {
	String INSERT_SQL = "INSERT INTO NEWS(Id, Title, Content, Image, PostedDate, Author, ViewCount, CategoryId, Home) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	String UPDATE_SQL = "UPDATE NEWS SET Title = ?, Content = ?, Image = ?, PostedDate = ?, Author = ?, ViewCount = ?, CategoryId = ?, Home = ? WHERE Id = ?";
	String DELETE_SQL = "DELETE FROM NEWS WHERE Id = ?";
	String SELECT_ALL_SQL = "SELECT n.*, c.Name AS CategoryName FROM NEWS n JOIN CATEGORIES c ON n.CategoryId = c.Id ORDER BY n.PostedDate DESC";
	String SELECT_TOP_5_MOST_VIEWED_SQL = "SELECT TOP 5 n.*, c.Name AS CategoryName FROM NEWS n JOIN CATEGORIES c ON n.CategoryId = c.Id ORDER BY n.ViewCount DESC";
	String SELECT_TOP5_MOST_RECENT_SQL = "SELECT TOP 5 n.*, c.Name AS CategoryName FROM NEWS n JOIN CATEGORIES c ON n.CategoryId = c.Id ORDER BY n.PostedDate DESC";
	String SELECT_TOP5_VIEWED_SQL = "SELECT TOP 5 n.*, c.Name AS CategoryName FROM NEWS n JOIN CATEGORIES c ON n.CategoryId = c.Id WHERE n.ViewCount > 0";

	public void insert(News entity) {
		JDBCHelper.update(INSERT_SQL, entity.getId(), entity.getTitle(), entity.getContent(), entity.getImage(),
				entity.getPostedDate(), entity.getAuthor(), entity.getViewCount(), entity.getCategoryId(),
				entity.isHome());
	}

	public void update(News entity) {
		JDBCHelper.update(UPDATE_SQL, entity.getTitle(), entity.getContent(), entity.getImage(), entity.getPostedDate(),
				entity.getAuthor(), entity.getViewCount(), entity.getCategoryId(), entity.isHome(), entity.getId());
	}

	public void delete(String id) {
		JDBCHelper.update(DELETE_SQL, id);
	}

	public List<News> selectAll() {
		return selectBysql(SELECT_ALL_SQL);
	}

	public News selectById(String id) {
		String sql = "SELECT n.*, c.Name AS CategoryName FROM NEWS n JOIN CATEGORIES c ON n.CategoryId = c.Id WHERE n.Id = ?";
		List<News> list = selectBysql(sql, id);
		return list.isEmpty() ? null : list.get(0);
	}

	public List<News> selectByCategory(String categoryId) {
		String sql = "SELECT n.*, c.Name AS CategoryName " + "FROM NEWS n "
				+ "JOIN CATEGORIES c ON n.CategoryId = c.Id " + "WHERE n.CategoryId = ? "
				+ "ORDER BY n.PostedDate DESC";
		return selectBysql(sql, categoryId);
	}

	public List<News> selectTop5MostViewed() {
		return selectBysql(SELECT_TOP_5_MOST_VIEWED_SQL);
	}

	public List<News> selectTop5MostRecent() {
		return selectBysql(SELECT_TOP5_MOST_RECENT_SQL);
	}

	public List<News> selectTop5Viewed() {
		return selectBysql(SELECT_TOP5_VIEWED_SQL);
	}

	public List<News> selectRelatedNews(String categoryId, String currentNewsId) {
		String sql = "SELECT TOP 5 n.*, c.Name AS CategoryName FROM NEWS n JOIN CATEGORIES c ON n.CategoryId = c.Id WHERE n.CategoryId = ? AND n.Id != ?";
		return selectBysql(sql, categoryId, currentNewsId);
	}

	// Câu lệnh tìm kiếm tin tức dựa trên từ khóa
	String SEARCH_BY_KEYWORD_SQL = "SELECT n.*, c.Name AS CategoryName " + "FROM NEWS n "
			+ "JOIN CATEGORIES c ON n.CategoryId = c.Id " + "WHERE n.Title LIKE ? OR n.Content LIKE ? "
			+ "ORDER BY n.PostedDate DESC";

	// Phương thức tìm kiếm tin tức theo từ khóa
	public List<News> searchByKeyword(String keyword) {
		String searchKeyword = "%" + keyword + "%"; // Thêm ký tự % để tìm kiếm giống
		return selectBysql(SEARCH_BY_KEYWORD_SQL, searchKeyword, searchKeyword);
	}

	private List<News> selectBysql(String sql, Object... args) {
		List<News> list = new ArrayList<News>();
		try {
			ResultSet rs = JDBCHelper.query(sql, args);
			while (rs.next()) {
				News entity = new News();
				entity.setId(rs.getString("Id"));
				entity.setTitle(rs.getString("Title"));
				entity.setContent(rs.getString("Content"));
				entity.setImage(rs.getString("Image"));
				entity.setPostedDate(rs.getTimestamp("PostedDate"));
				entity.setAuthor(rs.getString("Author"));
				entity.setViewCount(rs.getInt("ViewCount"));
				entity.setCategoryId(rs.getString("CategoryId"));

				Categories category = new Categories();
				category.setId(rs.getString("CategoryId"));
				;
				category.setName(rs.getString("CategoryName"));
				entity.setCategoryName(category);

				entity.setHome(rs.getBoolean("Home"));
				list.add(entity);

			}
			rs.getStatement().getConnection().close();
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return list;
	}
}
