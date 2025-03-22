package crud.DAO;


import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import crud.until.JDBCHelper;
import crud.entities.Newsletters;




public class NewseletterDAO {
	
	String INSERT_SQL = "INSERT INTO Newsletters(Email, Enabled) values(?,?)";
    String UPDATE_SQL = "UPDATE Newsletters set Enabled= ? WHERE Email =?";
    String DELETE_SQL = "delete from Newsletters where Email = ? ";
    String SELECT_ALL_SQL = "SELECT * FROM Newsletters ";
    
    public void insert(Newsletters entity) {
		JDBCHelper.update(INSERT_SQL, entity.getEmail(), entity.isEnabled()
				);
	}

	public void update(Newsletters entity) {
		JDBCHelper.update(UPDATE_SQL, entity.isEnabled(), entity.getEmail()
				);
	}
	
	public void delete(String id) {
		JDBCHelper.update(DELETE_SQL, id);
	}
	
	public List<Newsletters> selectAll() {
		return selectBysql(SELECT_ALL_SQL);
	}
	
	public Newsletters selectById(String id) {
		String sql = "SELECT * FROM Newsletters WHERE Email = ?";
		List<Newsletters> list = selectBysql(sql, id);
		return list.isEmpty() ? null : list.get(0);
	}
	
	public List<String> getEnabledEmails() {
	    List<String> emails = new ArrayList<>();
	    String query = "SELECT Email FROM Newsletters WHERE Enabled = 1";

	    try {
	        ResultSet rs = JDBCHelper.query(query);
	        while (rs.next()) {
	            emails.add(rs.getString("Email"));  // Lấy email từ ResultSet và thêm vào danh sách
	        }
	        rs.getStatement().getConnection().close();
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new RuntimeException("Error while fetching emails with enabled status.");
	    }
	    return emails;
	}

	
	
	
	
	private List<Newsletters> selectBysql(String sql, Object... agrs){
		List<Newsletters> list = new ArrayList<Newsletters>();
		try {
			ResultSet rs = JDBCHelper.query(sql, agrs);
			while(rs.next()) {
				Newsletters entity = new Newsletters();
				entity.setEmail(rs.getString("Email"));
				entity.setEnabled(rs.getBoolean("Enabled"));
				
				list.add(entity);
			}
			rs.getStatement().getConnection().close();
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return list;
	}


}