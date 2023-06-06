package connectdb;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import javax.annotation.Resource;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
    private static final long seriaVersionUID = 1L;
    @Resource(name = "jdbc/databaseky4")
    private DataSource dataSource;



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "jdbc:mysql://localhost:3306/databaseky4";
        String username = "root";
        String password = "";

        PrintWriter out = response.getWriter();
        response.setContentType("text/plain");

        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;

        try{
            Class.forName("com.mysql.jdbc.Driver");
            myConn = DriverManager.getConnection(url,username,password);
            String sql = "Select * from student";
            myStmt = myConn.createStatement();

            myRs = myStmt.executeQuery(sql);
            while (myRs.next()){
                String email = myRs.getString("email");
                out.println(email);
            }

        }catch (Exception exc) {
            exc.printStackTrace();
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
