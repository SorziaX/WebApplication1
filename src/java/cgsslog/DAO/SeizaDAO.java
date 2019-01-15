/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cgsslog.DAO;

import cgsslog.Seiza;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author shenhanfei
 */
public class SeizaDAO extends BaseDAO{
    
    public List readSeiza() {
        List<Seiza> list = new ArrayList<Seiza>();
        String sql = null;
        
        sql = "SELECT *"
            + " FROM 08_seiza t8";
        
        System.out.println(sql);
        
        ResultSet rs = this.execute(sql);
        
        try{
            while(rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                Seiza seiza = new Seiza(id, name);
                list.add(seiza);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {}
        
        this.close();
        return list;
    }
    
}
