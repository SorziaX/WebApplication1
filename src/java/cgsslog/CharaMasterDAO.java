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

    public CharaMaster selectChara(int id){
        
        Type type = new Type(0, null);
        Seiza seiza = new Seiza(0, null);
        Hometown hometown = new Hometown(0, null, null);
                
        CharaMaster cm = new CharaMaster(0, null, null, null, type, 0, 0, 0,
                            null, seiza, hometown, null, null, null);
            
        String sql = null;
        int charaId = id;
        
        sql = "SELECT t3.id, t3.name_kanji, t3.name_kana, t3.name_romaji, t7.id,"
            + " t7.name, t3.height, t3.age, t3.weight, t3.birthday, t8.id,"
            + " t8.name, t9.id, t9.country, t9.province, t3.hobby, t3.cv, t3.note"
            + " FROM 03_charamaster t3"
            + " LEFT JOIN 07_type t7 ON t3.type_id = t7.id"
            + " LEFT JOIN 08_seiza t8 ON t3.seiza_id = t8.id"
            + " LEFT JOIN 09_hometown t9 ON t3.hometown_id = t9.id"
            + " WHERE t3.id =" + charaId; 
        
        System.out.println(sql);
        
        ResultSet rs2 = this.execute(sql);
                
        try{
            rs2.next();
            int charaId2 = rs2.getInt(1);
            String nameKanji = rs2.getString(2);
            String nameKana = rs2.getString(3);
            String nameRomaji = rs2.getString(4);
            int typeId = rs2.getInt(5);
            String typeName  = rs2.getString(6);
            int height = rs2.getInt(7);
            int age = rs2.getInt(8);
            int weight = rs2.getInt(9);
            Date birthday = rs2.getDate(10);
            int seizaId = rs2.getInt(11);
            String seizaName = rs2.getString(12);
            int homeId = rs2.getInt(13);
            String country = rs2.getString(14);
            String province = rs2.getString(15);
            String hobby = rs2.getString(16);
            String cv = rs2.getString(17);
            String note = rs2.getString(18);
                
            type = new Type(typeId, typeName);
            seiza = new Seiza(seizaId, seizaName);
            hometown = new Hometown(homeId, country, province);
                
            cm = new CharaMaster(charaId2, nameKanji, 
                     nameKana, nameRomaji, type, height, age, weight, birthday,
                     seiza, hometown, hobby, cv, note);

        } catch (SQLException e)
        {
            e.printStackTrace();
        }finally{}
        
        this.close();
        return cm;
        
    }
    
    public void editChara(CharaMaster cm){
        
        String sql = null;
        System.out.println("Starting edit Character");
        
        sql = "UPDATE 03_charamaster t3"
            + " SET"
            + " t3.name_kanji='"+ cm.getNameKanji()+"',"
            + " t3.name_kana='"+cm.getNameKana()+"',"
            + " t3.name_romaji='"+cm.getNameRomaji()+"',"
            + " t3.type_id="+cm.type.getId()+","
            + " t3.height="+cm.getHeight()+","
            + " t3.age="+cm.getAge()+","
            + " t3.weight="+cm.getWeight()+","
            /*
            + " t3.birthday="+cm.getBirthday()+","
            */
            + " t3.seiza_id="+cm.seiza.getId()+","
            + " t3.home_id="+cm.hometown.getId()+","
            + " t3.hobby='"+cm.getHobby()+"',"
            + " t3.cv='"+cm.getCv()+"',"
            + " t3.note='"+cm.getNote()+"'"
            + " WHERE t3.id ="+cm.getId();
        
        System.out.println(sql);
        
        executeUpdate(sql);
        System.out.println("Data is successfully updated!");
        
        this.close();
        
    }
}
