
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

 
 

public class ConnectionDB {

    public  static final String url = "jdbc:mysql://localhost:3306/MUniversity";
    public static final String user = "root";
    public static final String password = "root";
    Statement stmt = null;
    Connection con = null ;
    public static void main(String[] args) {
        
    }
    public int connect1(){
         System.out.println("asdjflk;a;lskdfjlaksjfd");
    try {
            Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection(url, user, password);
            out.print("successful");
        } catch (Exception e) {
            System.out.println("Faild Connection!");
           e.printStackTrace();
        }
        return 0 ;
    }
}