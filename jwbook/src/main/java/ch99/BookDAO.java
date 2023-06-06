package ch99;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDAO {
	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb";
	
	public Connection open() {
		Connection conn = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL,"jwbook","1234");
		} catch (Exception e) { e.printStackTrace(); }
		return conn;
	}
	
	//글작성할때 시간을 가져옴
	public String getDate() {
		Connection conn = open();
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) { e.printStackTrace(); }
		return "";
	}
	
	//게시글 번호 자동 증가
	public int getNext() {
		Connection conn = open();
		String SQL = "SELECT ID FROM BOOK ORDER BY ID DESC()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) { e.printStackTrace(); }
		return -1;
	}
	
	//글 작성하기
	public int bookWrite(String title, String username, String content) {
		Connection conn = open();
		String SQL = "INSERT INTO BOOK VALUES (?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, title);
			pstmt.setString(3, username);
			pstmt.setString(4, getDate());
			pstmt.setString(5, content);
			pstmt.setInt(6, 1);
			ResultSet rs = pstmt.executeQuery();
			return pstmt.executeUpdate();
		} catch (Exception e) { e.printStackTrace(); }
		return -1;
	}
	
	//글 수정하기
	public int update(int ID, String title, String content) {
		Connection conn = open();
		String SQL = "UPDATE BOOK SET title = ? , content = ? WHERE ID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, ID);
			return pstmt.executeUpdate();
		} catch (Exception e) { e.printStackTrace(); }
		return -1;
	}
	
	//게시글 목록 보기
	public ArrayList<Book> getList(int pageNumber) {
		Connection conn = open();
		String SQL = "SELECT * FROM BOOK WHERE ID < ?";
		ArrayList<Book> list = new ArrayList<Book>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext() - (pageNumber - 1) * 10);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Book book = new Book();
				book.setID(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setUsername(rs.getString(3));
				book.setDate(rs.getString(4));
				book.setContent(rs.getString(5));
				list.add(book);
			}
		} catch (Exception e) { e.printStackTrace(); }
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		Connection conn = open();
		String SQL = "SELECT * FROM BOOK WHERE ID < ?";
		ArrayList<Book> list = new ArrayList<Book>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext() - (pageNumber - 1) * 10);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) { e.printStackTrace(); }
		return false;
	}

}
