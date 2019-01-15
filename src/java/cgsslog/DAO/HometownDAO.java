/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cgsslog.DAO;

import cgsslog.Hometown;
import java.sql.*;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author shenhanfei
 */
public class HometownDAO extends BaseDAO{
    
    public List readHome() {
        
        List<Hometown> list = new ArrayList<Hometown>();
        String sql = null;
        
        sql = "SELECT *"
            + " FROM 09_hometown t9";
        
        ResultSet rs = this.execute(sql);
        
        try{
            while(rs.next()) {
                Integer id = rs.getInt(1);
                String country = rs.getString(2);
                String province = rs.getString(3);
                
                Hometown home = new Hometown(id, country, province);
                list.add(home);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {}
        
        this.close();
        
        return list;
    }
    
}
