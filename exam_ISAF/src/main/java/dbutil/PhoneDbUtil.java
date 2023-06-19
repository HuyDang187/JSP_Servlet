package dbutil;

import entity.Phone;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PhoneDbUtil {
    private DataSource dataSource;

    public PhoneDbUtil(DataSource theDataSource) {
        dataSource = theDataSource;
    }

    public List<Phone> getPhones() throws Exception {

        List<Phone> phones = new ArrayList<>();

        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;
        try {
            String url = "jdbc:mysql://127.0.0.1/examisaf";
            String username = "root";
            String password = "";
            Class.forName("com.mysql.jdbc.Driver");

            myConn = DriverManager.getConnection(url, username, password);

            String sql = "select*from phone order by name";
            myStmt = myConn.createStatement();
            myRs = myStmt.executeQuery(sql);
            while (myRs.next()) {

                int phoneId = myRs.getInt("phoneId");
                String name = myRs.getString("name");
                String description = myRs.getString("description");
                Double price = myRs.getDouble("price");
                int brandId = myRs.getInt("brandId");

                Phone tempPhone = new Phone(phoneId, name, price, description,brandId);

                phones.add(tempPhone);
            }
            return phones;
        } finally {
            close(myConn, myStmt, myRs);
        }
    }

    private void close(Connection myConn, Statement myStmt, ResultSet myRs) {
        try {
            if (myRs != null) {
                myRs.close();
            }
            if (myStmt != null) {
                myStmt.close();
            }
            if (myConn != null) {
                myConn.close();
            }
        } catch (Exception exc) {
            exc.printStackTrace();
        }
    }
    public void addPhone(Phone thePhone) throws Exception {
        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            String url = "jdbc:mysql://127.0.0.1/examisaf";
            String username = "root";
            String password = "";
            Class.forName("com.mysql.jdbc.Driver");

            myConn = DriverManager.getConnection(url, username, password);

            String sql = "insert into phone "
                    + "(phoneId, name, price, description,brandId)"
                    + "values (?,?,?,?,?)";
            myStmt = myConn.prepareStatement(sql);


            myStmt.setInt(1, thePhone.getPhoneId());
            myStmt.setString(2, thePhone.getName());
            myStmt.setDouble(3, thePhone.getPrice());
            myStmt.setString(4,thePhone.getDescription());
            myStmt.setInt(5,thePhone.getBrandId());
            myStmt.execute();
        } finally {
            close(myConn, myStmt, null);
        }
    }
    public Phone getPhone(String thePhoneId) throws Exception {
        Phone thePhone = null;

        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        int phoneId;
        try {

            phoneId = Integer.parseInt(thePhoneId);
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/examisaf";
            String username = "root";
            String password = "";


            myConn = DriverManager.getConnection(url, username, password);

            String sql = "select * from phone where phoneId=?";
            myStmt = myConn.prepareStatement(sql);

            myStmt.setInt(1,phoneId);
            myRs= myStmt.executeQuery();

            if(myRs.next()){
                String name = myRs.getString("name");
                String description = myRs.getString("description");
                Double price = myRs.getDouble("price");
                int brandId = myRs.getInt("brandId");
                thePhone = new Phone(phoneId,name,price,description,brandId);
            }
            else {
                throw new Exception("Could not find phone id: "+phoneId);
            }
            return thePhone;

        }
        finally {
            close(myConn, myStmt, myRs);
        }
    }
    public  void updatePhone(Phone thePhone) throws Exception {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/examisaf";
            String username="root";
            String password = "";

            myConn = DriverManager.getConnection(url,username,password);

            String sql = "update phone "
                    + "set name=?, price=?, description=? ,brandId=? "
                    + "where phoneId=?";
            myStmt = myConn.prepareStatement(sql);

            myStmt.setString(1, thePhone.getName());
            myStmt.setDouble(2, thePhone.getPrice());
            myStmt.setString(3, thePhone.getDescription());
            myStmt.setInt(4, thePhone.getBrandId());

            myStmt.execute();
        }
        finally {
            close(myConn, myStmt, null);
        }
    }
    public void deletePhone(String thePhoneId) throws Exception{
        Connection myConn = null;
        PreparedStatement myStmt = null;
        try {
            int phoneId = Integer.parseInt(thePhoneId);
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/examisaf";
            String username = "root";
            String password = "";


            myConn = DriverManager.getConnection(url,username,password);

            String sql = "delete from phone where phoneId=?";

            myStmt = myConn.prepareStatement(sql);

            myStmt.setInt(1, phoneId);

            myStmt.execute();
        }
        finally {
            close(myConn,myStmt,null);
        }
    }
}
