/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cgsslog;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author shenhanfei
 */
public class CardMasterDAO extends BaseDAO{
    
    public List readCard(){
        
        List<CardMaster> list = new ArrayList<CardMaster>();
        String sql = null;
        
        sql = "SELECT t2.id, t2.card_name, t3.id, t3.name_Kanji, t3.name_kana,"
            + " t3.name_romaji, t7.id, t7.name, t3.height, t3.age, t3.weight,"
            + " t3.birthday, t8.id, t8.name, t9.id, t9.country, t9.province,"
            + " t3.hobby, t3.cv, t3.note, t6.id, t6.name, t4.id, t4.name, t5.id,"
            + " t5.name"
            + " FROM 02_cardmaster t2"
            + " LEFT JOIN 03_charamaster t3 ON t2.chara_id = t3.id"
            + " LEFT JOIN 04_cardgetmethod t4 ON t2.get_id = t4.id"
            + " LEFT JOIN 05_skill t5 ON t2.skill_id = t5.id"
            + " LEFT JOIN 06_rarity t6 ON t2.rarity_id = t6.id"
            + " LEFT JOIN 07_type t7 ON t3.type_id = t7.id"
            + " LEFT JOIN 08_seiza t8 ON t3.seiza_id = t8.id"
            + " LEFT JOIN 09_hometown t9 ON t3.hometown_id = t9.id"; 
        
        ResultSet rs = this.execute(sql);
        
        try{
            while(rs.next())
            {
                int cardId = rs.getInt(1);
                String cardName = rs.getString(2);
                int charaId = rs.getInt(3);
                String nameKanji  = rs.getString(4);
                String nameKana = rs.getString(5);
                String nameRomaji = rs.getString(6);
                int typeId = rs.getInt(7);
                String typeName = rs.getString(8);
                int height = rs.getInt(9);
                int age = rs.getInt(10);
                int weight = rs.getInt(11);
                Date birthday = rs.getDate(12);
                int seizaId = rs.getInt(13);
                String seizaName = rs.getString(14);
                int homeId = rs.getInt(15);
                String country = rs.getString(16);
                String province = rs.getString(17);
                String hobby = rs.getString(18);
                String cv = rs.getString(19);
                String note = rs.getString(20);
                int rarityId = rs.getInt(21);
                String rarityName = rs.getString(22);
                int cardGetId = rs.getInt(23);
                String cardGetName = rs.getString(24);
                int skillId = rs.getInt(25);
                String skillName = rs.getString(26);
                
                Type type = new Type(typeId, typeName);
                Seiza seiza = new Seiza(seizaId, seizaName);
                Hometown hometown = new Hometown(homeId, country, province);
                Rarity rarity = new Rarity(rarityId, rarityName);
                CardGetMethod cardGetMethod = new CardGetMethod(cardGetId, cardGetName);
                Skill skill = new Skill(skillId, skillName);
                CharaMaster charaMaster = new CharaMaster(charaId, nameKanji, 
                        nameKana, nameRomaji, type, height, age, weight,
                        birthday, seiza, hometown, hobby, cv, note);
                
                CardMaster cardMaster = new CardMaster(cardId, cardName,
                        charaMaster, rarity, cardGetMethod, skill);
                
                list.add(cardMaster);
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        } finally {}
        
        this.close();
        return list;
    }

    
    public void addCard(CardMaster card){
        
        String sql = null;
        
        
        sql = "INSERT INTO 02_cardmaster"
            + " (  card_name,"
            + "    chara_id,"
            + "    rarity_id)"
            + " VALUES"
            + " ('"+card.getCardName() + "',"
            + " "+card.charaMaster.getId() + ","
            + " "+card.rarity.getId() + ")";
        
        System.out.println(sql);
        
        executeUpdate(sql);
        System.out.println("Data is successfully inserted!");
        
        this.close();
    }
    
}

