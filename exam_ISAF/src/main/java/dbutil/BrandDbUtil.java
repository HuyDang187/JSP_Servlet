package dbutil;

import entity.Brand;
import entity.Phone;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BrandDbUtil {
    private DataSource dataSource;

    public BrandDbUtil(DataSource theDataSource) {
        dataSource = theDataSource;
    }

    public List<Brand> getBrands() throws Exception {

        List<Brand> brands = new ArrayList<>();

        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;
        try {
            String url = "jdbc:mysql://127.0.0.1/examisaf";
            String username = "root";
            String password = "";
            Class.forName("com.mysql.jdbc.Driver");

            myConn = DriverManager.getConnection(url, username, password);

            String sql = "select*from brand order by name";
            myStmt = myConn.createStatement();
            myRs = myStmt.executeQuery(sql);
            while (myRs.next()) {

                int brandId = myRs.getInt("brandId");
                String name = myRs.getString("name");

                Brand tempBrand = new Brand(brandId, name);

                brands.add(tempBrand);
            }
            return brands;
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
    public void addBrand(Brand theBrand) throws Exception {
        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            String url = "jdbc:mysql://127.0.0.1/examisaf";
            String username = "root";
            String password = "";
            Class.forName("com.mysql.jdbc.Driver");

            myConn = DriverManager.getConnection(url, username, password);

            String sql = "insert into brand "
                    + "(brandId, name)"
                    + "values (?,?)";
            myStmt = myConn.prepareStatement(sql);


            myStmt.setInt(1, theBrand.getBrandId());
            myStmt.setString(2, theBrand.getName());

            myStmt.execute();
        } finally {
            close(myConn, myStmt, null);
        }
    }
    public Brand getBrand(String theBrandId) throws Exception {
        Brand theBrand = null;

        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        int brandId;
        try {

            brandId = Integer.parseInt(theBrandId);
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/examisaf";
            String username = "root";
            String password = "";


            myConn = DriverManager.getConnection(url, username, password);

            String sql = "select * from brand where brandId=?";
            myStmt = myConn.prepareStatement(sql);

            myStmt.setInt(1,brandId);
            myRs= myStmt.executeQuery();

            if(myRs.next()){
                String name = myRs.getString("name");

                theBrand = new Brand(name);
            }
            else {
                throw new Exception("Could not find brand id: "+brandId);
            }
            return theBrand;

        }
        finally {
            close(myConn, myStmt, myRs);
        }
    }
    public  void updateBrand(Brand theBrand) throws Exception {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/examisaf";
            String username="root";
            String password = "";

            myConn = DriverManager.getConnection(url,username,password);

            String sql = "update brand "
                    + "set name=? "
                    + "where brandId=?";
            myStmt = myConn.prepareStatement(sql);

            myStmt.setString(1, theBrand.getName());

            myStmt.setInt(2, theBrand.getBrandId());

            myStmt.execute();
        }
        finally {
            close(myConn, myStmt, null);
        }
    }
    public void deleteBrand(String theBrandId) throws Exception{
        Connection myConn = null;
        PreparedStatement myStmt = null;
        try {
            int brandId = Integer.parseInt(theBrandId);
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/examisaf";
            String username = "root";
            String password = "";


            myConn = DriverManager.getConnection(url,username,password);

            String sql = "delete from brand where brandId=?";

            myStmt = myConn.prepareStatement(sql);

            myStmt.setInt(1, brandId);

            myStmt.execute();
        }
        finally {
            close(myConn,myStmt,null);
        }
    }
}
