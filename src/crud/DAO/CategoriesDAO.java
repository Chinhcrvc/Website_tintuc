package crud.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import crud.entities.Categories;
import crud.until.JDBCHelper;

public class CategoriesDAO {
	String INSERT_SQL = "INSERT INTO CATEGORIES(Id, Name) VALUES (?, ?)";
	String UPDATE_SQL = "UPDATE CATEGORIES SET Name = ? WHERE Id = ?";
	String DELETE_SQL = "DELETE  FROM CATEGORIES WHERE Id = ?";
	String SELECT_ALL_SQL = "SELECT * FROM CATEGORIES";

	public void insert(Categories entity) {
		JDBCHelper.update(INSERT_SQL, entity.getId(), entity.getName());
	}
	
	public void update(Categories entity) {
		JDBCHelper.update(UPDATE_SQL, entity.getName(), entity.getId());
	}
	
	public void delete(String id) {
		JDBCHelper.update(DELETE_SQL, id);
	}
	
	public List<Categories> selectAll() {
		return selectBysql(SELECT_ALL_SQL);
	}
	
	public Categories selectById(String id) {
		String sql = "SELECT * FROM CATEGORIES WHERE Id = ?";
		List<Categories> list = selectBysql(sql, id);
		return list.isEmpty() ? null : list.get(0);
	}
	
	private List<Categories> selectBysql(String sql, Object... agrs){
		List<Categories> list = new ArrayList<>();
		try {
			ResultSet rs = JDBCHelper.query(sql, agrs);
			while(rs.next()) {
				Categories entity = new Categories();
				entity.setId(rs.getString("Id"));
	            entity.setName(rs.getString("Name"));
				list.add(entity);
			}
			rs.getStatement().getConnection().close();
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return list;
	}
}
