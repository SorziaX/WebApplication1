/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cgsslog;
import com.mysql.jdbc.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
    
    public void connectDB(){
        try{
            //数据库信息
            String userName="root"; 
            //密码 
            String userPasswd="mysql_shen_pass"; 
            //数据库名 
            String dbName="mycgss_log"; 

            String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd;

            this.con = DriverManager.getConnection(url);
            
        } catch (SQLException e) {
            e.printStackTrace();
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