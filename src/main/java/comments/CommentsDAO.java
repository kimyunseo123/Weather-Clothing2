package comments;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentsDAO {

    // 메서드 내에서 연결을 열고 닫도록 수정
    private Connection getConnection() throws SQLException {
        String dbURL = "jdbc:mysql://localhost:3306/WEATHER_CLOTHING";
        String dbID = "root";
        String dbPassword = "0830";
        return DriverManager.getConnection(dbURL, dbID, dbPassword);
    }

    // Add a new comment
    public void addComment(Comments comment) throws SQLException {
        String sql = "INSERT INTO comments (postID, userID, commentContent, commentDate) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, comment.getPostID());
            stmt.setString(2, comment.getUserID());
            stmt.setString(3, comment.getCommentContent());
            stmt.setString(4, comment.getCommentDate());
            stmt.executeUpdate();
        }
    }

    // Retrieve comments for a specific post
    public List<Comments> getComments(int postID) throws SQLException {
        List<Comments> commentList = new ArrayList<>();
        String sql = "SELECT * FROM comments WHERE postID = ? ORDER BY commentDate DESC";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, postID);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Comments comment = new Comments();
                    comment.setCommentID(rs.getInt("commentID"));
                    comment.setPostID(rs.getInt("postID"));
                    comment.setUserID(rs.getString("userID"));
                    comment.setCommentContent(rs.getString("commentContent"));
                    comment.setCommentDate(rs.getString("commentDate"));
                    commentList.add(comment);
                }
            }
        }
        return commentList;
    }
    
    public void deleteComment(int commentID) {
        String sql = "DELETE FROM comments WHERE commentID = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, commentID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}