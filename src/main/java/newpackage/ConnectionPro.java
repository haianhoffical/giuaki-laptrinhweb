package newpackage;
import java.sql.*;

public class ConnectionPro {
    private static Connection con;
    
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Tên database là school_management, root không có mật khẩu (mặc định XAMPP)
            // Sửa dòng này:
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_management?useUnicode=true&characterEncoding=UTF-8", "root", "");
        } catch(Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}