/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cgsslog;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author shenhanfei
 */
public class TypeDAO extends BaseDAO{
    
    public List readType(){
        List<Type> list = new ArrayList<Type>();
        String sql = null;
        
        sql = "SELECT *"
            + " FROM 07_type t7";
                
        System.out.println(sql);
        
        ResultSet rs = this.execute(sql);
        
        try{
            while(rs.next())
            {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                Type type = new Type(id, name);
                list.add(type);
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        } finally {}
        
        this.close();
        return list;

    }
    
}
