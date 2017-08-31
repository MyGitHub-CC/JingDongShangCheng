package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TestJd {
	public static void main(String[] args) {
		TestJd.test();
	}

	public static void test() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jd?characterEncoding=utf-8",
					"root", "root");
			String sql = "insert into image (big_img,small_img,pro_id) values (?,?,?)";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			for (int i = 10; i < 11; i++) {
				String big = i + "-01.jpg";
				String small = i + "-02.jpg";
				preparedStatement.setString(1, big);
				preparedStatement.setString(2, small);
				preparedStatement.setInt(3, i);
				preparedStatement.executeUpdate();
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
