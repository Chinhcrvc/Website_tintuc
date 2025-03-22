package crud.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import crud.entities.Users;
import crud.until.JDBCHelper;

public class UsersDAO {
	String INSERT_SQL = "INSERT INTO USERS(Id, Password, Fullname, Birthday, Gender, Moble, Email, Role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	String UPDATE_SQL = "UPDATE USERS SET Password = ?, Fullname = ?, Birthday = ?, Gender = ?, Moble = ?, Email = ?, Role = ? WHERE Id = ?";
	String DELETE_SQL = "DELETE  FROM USERS WHERE Id = ?";
	String SELECT_ALL_SQL = "SELECT * FROM USERS";

	public void insert(Users entity) {
		JDBCHelper.update(INSERT_SQL, entity.getId(), entity.getPassword(), entity.getFullName(), entity.getBirthDay(),
				entity.isGender(), entity.getMoble(), entity.getEmail(), entity.isRole());
	}

	public void update(Users entity) {
		JDBCHelper.update(UPDATE_SQL, entity.getPassword(), entity.getFullName(), entity.getBirthDay(),
				entity.isGender(), entity.getMoble(), entity.getEmail(), entity.isRole(), entity.getId());
	}
	
	public void delete(String id) {
		JDBCHelper.update(DELETE_SQL, id);
	}
	
	public List<Users> selectAll() {
		return selectBysql(SELECT_ALL_SQL);
	}
	
	public Users selectById(String id) {
		String sql = "SELECT * FROM USERS WHERE Id = ?";
		List<Users> list = selectBysql(sql, id);
		return list.isEmpty() ? null : list.get(0);
	}
	
	public Users selectByFullName(String fullName) {
	    String sql = "SELECT * FROM USERS WHERE Fullname = ?";
	    List<Users> list = selectBysql(sql, fullName);
	    return list.isEmpty() ? null : list.get(0);
	}
	
	private List<Users> selectBysql(String sql, Object... agrs){
		List<Users> list = new ArrayList<Users>();
		try {
			ResultSet rs = JDBCHelper.query(sql, agrs);
			while(rs.next()) {
				Users entity = new Users();
				entity.setId(rs.getString(1));
				entity.setPassword(rs.getString(2));
				entity.setFullName(rs.getString(3));
				entity.setBirthDay(rs.getDate(4));
				entity.setGender(rs.getBoolean(5));
				entity.setMoble(rs.getString(6));
				entity.setEmail(rs.getString(7));
				entity.setRole(rs.getBoolean(8));
				list.add(entity);
			}
			rs.getStatement().getConnection().close();
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return list;
	}
}
