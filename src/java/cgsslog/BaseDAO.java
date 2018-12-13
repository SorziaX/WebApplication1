/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cgsslog;
import com.mysql.jdbc.Driver;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author shenhanfei
 */
public class BaseDAO {
    
    private Connection con;
    private PreparedStatement psmt;
    private ResultSet rs;
    
    public BaseDAO(){
        this.connectDB();
    }
    
    public void finalize(){
        this.closeDB();
    }
    
    public void connectDB() {
        try{
            System.out.println("DEBUG:connectDB Start");
            Properties prop = new Properties();
            InputStream in = null;
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            in = classLoader.getResourceAsStream("mysql.properties");
            System.out.println("DEBUG:4");
            prop.load(in);
            System.out.println("DEBUG:5");
            
            //数据库信息
            String mysqlServer=prop.getProperty("mysqlServer");
            //用户名
            String userName=prop.getProperty("userName"); 
            //密码 
            String userPasswd=prop.getProperty("userPasswd"); 
            //数据库名 
            String dbName=prop.getProperty("dbName"); 

            String url="jdbc:mysql://"+mysqlServer+"/"+dbName+"?user="+userName
                      +"&password="+userPasswd+"&useUnicode=true&characterEncoding=UTF-8";
            System.out.println(url);

            this.con = DriverManager.getConnection(url);
            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
    
    public ResultSet execute(String sql){
   
        try{
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        
        try{
            this.psmt = this.con.prepareStatement(sql); 
            this.rs = this.psmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
     }
    
    public void executeUpdate(String sql){
   
        try{
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        
        try{
            this.psmt = this.con.prepareStatement(sql); 
            this.psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
     }

    public void close(){
        try {
            if(this.rs!=null)
            {
                this.rs.close();
            }
            if(this.psmt!=null)
            {
                this.psmt.close();
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
    
    
    public void closeDB(){        
        try {
            if(con!=null)
            {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}