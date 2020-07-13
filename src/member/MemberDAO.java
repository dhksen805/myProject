package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}

	public void insertMember(MemberBean mb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			// 1단계 드라이버로더 // 2단계 디비연결
			con = getConnection();

			// 3단계 sql문 만들고 실행할 객체생성 insert
			String sql = "insert into member(id,pass,name,reg_date,email,sample4_postcode,sample4_roadAddress,sample4_jibunAddress) values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPass());
			pstmt.setString(3, mb.getName());
			pstmt.setTimestamp(4, mb.getReg_date());
			pstmt.setString(5, mb.getEmail());
			pstmt.setString(6, mb.getSample4_postcode());
			pstmt.setString(7, mb.getSample4_roadAddress());
			pstmt.setString(8, mb.getSample4_jibunAddress());
			// 4단계 sql문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			// 예외가 발생하면 처리하는 구문
			e.printStackTrace();
		} finally {
			// 예외상관없이 마무리 작업 구문 => 기억장소 해제
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
	}

	public int userCheck(String id, String pass) {
		int check = -1;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			// 3단계 sql문 만들고 실행할 객체생성 insert
			String sql = "select * from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4단계 sql문 실행
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (pass.equals(rs.getString("pass"))) {
					check = 1;
				} else {
					check = 0;
					System.out.println("비밀번호 틀림");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
		}
		return check;
	}


	public MemberBean getMember(String id) {
		MemberBean mb = new MemberBean();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 1단계 드라이버로더
			Class.forName("com.mysql.jdbc.Driver");
			// 2단계 디비연결
			String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
			String dbUser = "root";
			String dbPass = "1234";
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			// 3단계 sql 만들고 실행할수 있는 객체 만들기 select
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4단계 결과<=실행 결과 저장
			rs = pstmt.executeQuery();
			if (rs.next()) {

				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setReg_date(rs.getTimestamp("reg_date"));

			}

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
		}
		return mb;
	}

	public void updateMember(MemberBean mb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			// 1단계 드라이버로더
			Class.forName("com.mysql.jdbc.Driver");
			// 2단계 디비연결
			String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
			String dbUser = "root";
			String dbPass = "1234";
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
//		 3단계 수정
			String sql = "update member set name=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getName());
			pstmt.setString(2, mb.getId());
			// 4단계 객체 실행 (sql구문이 실행) - insert, update, delete
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
	}

	public void deleteMember(MemberBean mb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			// 1단계 드라이버로더
			Class.forName("com.mysql.jdbc.Driver");
			// 2단계 디비연결
			String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
			String dbUser = "root";
			String dbPass = "1234";
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
//		 3단계 수정
			String sql = "delete from member  where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			// 4단계 객체 실행 (sql구문이 실행) - insert, update, delete
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
	}
	public int idCheck(String id) {
		int check=-1;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			// 1단계 드라이버로더			 // 2단계 디비연결
			con=getConnection();
			 // 3단계 sql member테이블안에 아이디 일치 한 회원 내용 가져오기, 폼아이디 디비 아이디 일치
			 String sql="select * from member where id=?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, id);
			 // 4단계 실행 => 결과 저장
			 rs=pstmt.executeQuery();
			 // 5단계  rs 첫행 이동 결과 있으면 아이디 일치  
			 //                    없으면  "아이디 없음"
			 if(rs.next()){
			 	//아이디 중복
			 	check=1;
			 }else{
				 // 아이디 없음 사용가능
				 check=0;
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외상관없이 마무리작업 구문=> 기억장소 해제
			if(rs!=null) try{rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
		return check;
	}
}
