package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO() {
        try {

            String dbURL = "jdbc:mysql://localhost:3306/WEATHER_CLOTHING";
            String dbID = "root";
            String dbPassword = "0830";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int login(String userID, String userPassword) {
        String SQL = "SELECT userPassword FROM USER WHERE userID = ?"; //?로 userID를 받음
        try {

            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();//결과대입
            if (rs.next()) {

                if(rs.getString(1).equals(userPassword)) {
                    return 1; // 로그인 성공
                } else {
                    return 0; // 비밀번호 불일치
                }
            }
            return -1; // 아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // 데이터베이스 오류
    }

    //회원가입
    public int join(User user) {
        String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?)"; // user 정보로 들어갈 4가지
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID()); //물음표에 들어갈내용이 무엇인지, SQL순서를 지키며 넣기
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserEmail());
            return pstmt.executeUpdate(); // 해당 스테이트먼트를 실행한 결과를 넣을 수 있도록
            } catch(Exception e) {
                e.printStackTrace();
            }
            return -1; // 데이터베이스오류
        }
    }