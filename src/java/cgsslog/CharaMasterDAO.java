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
public class CharaMasterDAO extends BaseDAO{
    
    public List readChara(){
        
        List<CharaMaster> list = new ArrayList<CharaMaster>();
        String sql = null;
        
        sql = "SELECT t3.id, t3.name_kanji, t3.name_kana, t3.name_romaji, t7.id,"
            + " t7.name, t3.height, t3.age, t3.weight, t3.birthday, t8.id,"
            + " t8.name, t9.id, t9.country, t9.province, t3.hobby, t3.cv, t3.note"
            + " FROM 03_charamaster t3"
            + " LEFT JOIN 07_type t7 ON t3.type_id = t7.id"
            + " LEFT JOIN 08_seiza t8 ON t3.seiza_id = t8.id"
            + " LEFT JOIN 09_hometown t9 ON t3.hometown_id = t9.id"; 
        
        ResultSet rs = this.execute(sql);
        
        try{
            while(rs.next())
            {
                int charaId = rs.getInt(1);
                String nameKanji = rs.getString(2);
                String nameKana = rs.getString(3);
                String nameRomaji = rs.getString(4);
                int typeId = rs.getInt(5);
                String typeName  = rs.getString(6);
                int height = rs.getInt(7);
                int age = rs.getInt(8);
                int weight = rs.getInt(9);
                Date birthday = rs.getDate(10);
                int seizaId = rs.getInt(11);
                String seizaName = rs.getString(12);
                int homeId = rs.getInt(13);
                String country = rs.getString(14);
                String province = rs.getString(15);
                String hobby = rs.getString(16);
                String cv = rs.getString(17);
                String note = rs.getString(18);
                
                Type type = new Type(typeId, typeName);
                Seiza seiza = new Seiza(seizaId, seizaName);
                Hometown hometown = new Hometown(homeId, country, province);
                
                CharaMaster charaMaster = new CharaMaster(charaId, nameKanji, 
                        nameKana, nameRomaji, type, height, age, weight, birthday,
                        seiza, hometown, hobby, cv, note);
                
                list.add(charaMaster);
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        }finally{}
        
        this.close();
        return list;
    }

}
