/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cgsslog.DAO;

import cgsslog.CardInStock;
import cgsslog.CardGetMethod;
import cgsslog.CardMaster;
import cgsslog.CharaMaster;
import cgsslog.Hometown;
import cgsslog.Rarity;
import cgsslog.Seiza;
import cgsslog.Skill;
import cgsslog.Type;
import java.sql.Date;
import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author shenhanfei
 */
public class CardInStockDAO extends BaseDAO{
  
    public List readCardInStock() {

        List list = new ArrayList();
        String sql = null;
        
        sql = "SELECT t1.id, t2.id, t2.card_name, t3.id, t3.name_Kanji, "
            + " t6.name, t1.starrank, t1.skill_level,"
            + " t1.tokkun_flag, t1.maxlevel_flag, t1.maxshinmitsu_flag"
            + " FROM 01_cardinstock t1"
            + " LEFT JOIN 02_cardmaster t2 ON t1.card_id = t2.id"
            + " LEFT JOIN 03_charamaster t3 ON t2.chara_id = t3.id"
            + " LEFT JOIN 06_rarity t6 ON t2.rarity_id = t6.id"
            + " ORDER BY t1.id"; 
        
        ResultSet rs = this.execute(sql);
        
        try {
            while(rs.next()) {
                int cisId = rs.getInt(1);
                int cardId = rs.getInt(2);
                String cardName = rs.getString(3);
                int charaId = rs.getInt(4);
                String nameKanji  = rs.getString(5);
                String rarityName = rs.getString(6);
                int starRank = rs.getInt(7);
                int skillLevel = rs.getInt(8);
                boolean tokkunFlag = rs.getBoolean(9);
                boolean maxLevelFlag = rs.getBoolean(10);
                boolean maxShinmitsuFlag = rs.getBoolean(11);
                
                Type type = new Type(0, null);
                Seiza seiza = new Seiza(0, null);
                Hometown hometown = new Hometown(0, null, null);
                Rarity rarity = new Rarity(0, rarityName);
                CardGetMethod cardGetMethod = new CardGetMethod(0, null);
                Skill skill = new Skill(0, null);
                CharaMaster charaMaster = new CharaMaster(charaId, nameKanji, 
                        null, null, type, 0, 0, 0,
                        null, seiza, hometown, null, null, null);
                
                CardMaster cardMaster = new CardMaster(cardId, cardName,
                        charaMaster, rarity, cardGetMethod, skill);
                
                CardInStock cardInStock = new CardInStock(cisId, cardMaster, 
                        starRank, skillLevel,tokkunFlag, maxLevelFlag, maxShinmitsuFlag);
                list.add(cardInStock);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {}
        
        this.close();
        return list;
    }

    public CardInStock readCIS(int id){
        
        String sql = null;
        int cisId = id;
        
        Type type = new Type(0, null);
        Seiza seiza = new Seiza(0, null);
        Hometown hometown = new Hometown(0, null, null);
        Rarity rarity = new Rarity(0, null);
        CardGetMethod cardGetMethod = new CardGetMethod(0, null);
        Skill skill = new Skill(0, null);
        CharaMaster charaMaster = new CharaMaster(0, null, 
                    null, null, type, 0, 0, 0, null, seiza, hometown, 
                    null, null, null);
                
        CardMaster cdm = new CardMaster(cisId, null, 
                    charaMaster, rarity, cardGetMethod, skill);

        CardInStock cis = new CardInStock(0, cdm, 0, 0,false, false, false);
        
        sql = "SELECT t1.id, t2.id, t2.card_name, t3.id, t3.name_Kanji, t6.id,"
            + " t6.name, t1.starrank, t1.skill_level,"
            + " t1.tokkun_flag, t1.maxlevel_flag, t1.maxshinmitsu_flag"
            + " FROM 01_cardinstock t1"
            + " LEFT JOIN 02_cardmaster t2 ON t1.card_id = t2.id"
            + " LEFT JOIN 03_charamaster t3 ON t2.chara_id = t3.id"
            + " LEFT JOIN 06_rarity t6 ON t2.rarity_id = t6.id"
            + " WHERE t1.id=" + cisId; 
        
        System.out.println(sql);
        
        ResultSet rs = this.execute(sql);
        
        try{
            rs.next();
            int cardId = rs.getInt(2);
            String cardName = rs.getString(3);
            int charaId = rs.getInt(4);
            String nameKanji = rs.getString(5);
            int rarityId = rs.getInt(6);
            String rarityName = rs.getString(7);
            int starRank = rs.getInt(8);
            int skillLevel = rs.getInt(9);
            boolean tokkunFlag = rs.getBoolean(10);
            boolean maxLevelFlag = rs.getBoolean(11);
            boolean maxShinmitsuFlag = rs.getBoolean(12);
            
            rarity = new Rarity(rarityId, rarityName);
            charaMaster = new CharaMaster(charaId, nameKanji, 
                        null, null, type, 0, 0, 0, null, seiza, hometown, 
                        null, null, null);
                
            cdm = new CardMaster(cardId, cardName, 
                        charaMaster, rarity, cardGetMethod, skill);
                
            cis = new CardInStock(cisId, cdm, 
                        starRank, skillLevel,tokkunFlag, maxLevelFlag, maxShinmitsuFlag);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {}
        
        this.close();
        return cis;
    }
    
    public int countCard(int id) {
        
        String sql = null;
        int cardId = id;
        int cardAmount = 0;
        
        sql = "SELECT count(*)"
            + " FROM 01_cardinstock t1"
            + " WHERE t1.card_id=" + cardId; 
        
        System.out.println(sql);
        
        ResultSet rs = this.execute(sql);
                
        try{
            rs.next();
            cardAmount = rs.getInt(1);
                            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {}
        
        this.close();
        return cardAmount;
    }
    
    public void addCardInStock(CardInStock card) {
        
        String sql = null;
        
        sql = "INSERT INTO 01_cardinstock"
            + " (  card_id,"
            + "    starrank,"
            + "    skill_level,"
            + "    tokkun_flag,"
            + "    maxlevel_flag,"
            + "    maxshinmitsu_flag)"
            + " VALUES"
            + " ('"+card.cardMaster.getId() + "',"
            + " "+card.getStarRank() + ","
            + " "+card.getSkillLevel() + ","
            + " "+card.getTokkunFlag() + ","
            + " "+card.getMaxLevelFlag() + ","
            + " "+card.getMaxShinmitsuFlag() + ")";

        System.out.println(sql);
        
        executeUpdate(sql);
        System.out.println("Data is successfully inserted!");
        
        this.close();
    }
    
    public void editCardInStock(CardInStock card){
        
        String sql = null;
        System.out.println("Starting edit CardInStock");
        
        sql = "UPDATE 01_chardinstock t1"
            + " SET"
            + " t1.card_id='"+ card.cardMaster.getId()+"',"
            + " t1.starrank='"+card.getStarRank()+"',"
            + " t1.skill_level='"+card.getSkillLevel()+"',"
            + " t1.tokkun_flag="+card.getTokkunFlag()+","
            + " t1.maxlevel_flag="+card.getMaxLevelFlag()+","
            + " t1.maxshinmitsu_flag="+card.getMaxShinmitsuFlag()+" "
            + " WHERE t1.id ="+card.getId();
        
        System.out.println(sql);
        
        executeUpdate(sql);
        System.out.println("Data is successfully updated!");
        
        this.close();
        
    }
}
