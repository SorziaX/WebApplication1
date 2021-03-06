/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cgsslog.DAO;
import cgsslog.CardGetMethod;
import cgsslog.CardMaster;
import cgsslog.CharaMaster;
import cgsslog.Hometown;
import cgsslog.Rarity;
import cgsslog.Seiza;
import cgsslog.Skill;
import cgsslog.Type;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author shenhanfei
 */
public class CardMasterDAO extends BaseDAO {
    
    public List readCard() {
        
        List list = new ArrayList();
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
        
        try {
            while(rs.next()) {
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
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {}
        
        this.close();
        return list;
    }

    public List readCharaCard(int charaId){
        
        List list = new ArrayList();
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
            + " LEFT JOIN 09_hometown t9 ON t3.hometown_id = t9.id"
            + " WHERE t3.id =" + charaId
            + " ORDER BY t2.rarity_id";
        
        System.out.println(sql);
        
        ResultSet rs = this.execute(sql);
        
        try {
            while(rs.next()) {
                int cardId = rs.getInt(1);
                String cardName = rs.getString(2);
                charaId = rs.getInt(3);
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
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {}
        
        this.close();
        return list;
    }
    
    public void addCard(CardMaster card) {
        
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
    
    public CardMaster selectCard(int id) {
        
        Type type = new Type(0, null);
        Seiza seiza = new Seiza(0, null);
        Hometown hometown = new Hometown(0, null, null);
        CharaMaster cm = new CharaMaster(0, null, null, null, type, 0, 0, 0,
                            null, seiza, hometown, null, null, null);
        Rarity rarity = new Rarity(0,null);
        CardGetMethod cgm = new CardGetMethod(0,null);
        Skill skill = new Skill(0,null);
        
        CardMaster cdm = new CardMaster(0, null, cm, rarity, cgm, skill);
        
        String sql = null;
        int cardId = id;
        
        sql = "SELECT t2.id, t2.card_name, t3.id, t3.name_kanji,"
            + " t6.id, t6.name, t4.id, t4.name, t5.id, t5.name"
            + " FROM 02_cardmaster t2"    
            + " LEFT JOIN 03_charamaster t3 on t2.chara_id = t3.id"
            + " LEFT JOIN 04_cardgetmethod t4 ON t2.get_id = t4.id"
            + " LEFT JOIN 05_skill t5 ON t2.skill_id = t5.id"
            + " LEFT JOIN 06_rarity t6 ON t2.rarity_id = t6.id"
            + " WHERE t2.id =" + cardId; 
        
        System.out.println(sql);
        
        ResultSet rs4 = this.execute(sql);
                
        try{
            rs4.next();
            String cardName = rs4.getString(2);
            int charaId = rs4.getInt(3);
            String nameKanji = rs4.getString(4);
            int rarityId = rs4.getInt(5);
            String rarityName = rs4.getString(6);
            int cgmId = rs4.getInt(7);
            String cgmName = rs4.getString(8);
            int skillId  = rs4.getInt(9);
            String skillName = rs4.getString(10);
                
            cm.setId(charaId);
            cm.setNameKanji(nameKanji);
            rarity = new Rarity(rarityId, rarityName);
            cgm = new CardGetMethod(cgmId, cgmName);
            skill = new Skill(skillId, skillName);
            
            cdm = new CardMaster(cardId, cardName, cm, rarity, cgm, skill);
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {}
        
        this.close();
        return cdm;
    }

    public int countCard(){
        
        String sql = null;
        int cardAmount = 0;
        
        sql = "SELECT count(*)"
            + " FROM 02_cardmaster t2";
        
        System.out.println(sql);
        
        ResultSet rs = this.execute(sql);
        
        try {
            rs.next();
            cardAmount = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {}
        
        this.close();
        return cardAmount;

    }
}

