/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cgsslog;

/**
 *
 * @author shenhanfei
 */
public class CardInStock {
   
    private int id;
    private CardMaster cardMaster;
    private int starRank;
    private int skillLevel;
    private boolean tokkunFlag;
    private boolean maxLevelFlag;
    private boolean maxShinmitsuFlag;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public CardMaster getCardMaster() {
        return cardMaster;
    }
    
    public void setCardMaster(CardMaster cardMaster) {
        this.cardMaster = cardMaster;
    }
    
    public int getStarRank() {
        return starRank;
    }
    
    public void setStarRank(int starRank) {
        this.starRank = starRank;
    }
 
    public int getSkillLevel() {
        return skillLevel;
    }
    
    public void setSkillLevel(int skillLevel) {
        this.skillLevel = skillLevel;
    }
    
    public boolean getTokkunFlag() {
        return tokkunFlag;
    }
    
    public void setTokkunFlag(boolean tokkunFlag) {
        this.tokkunFlag = tokkunFlag;
    }
    
    public boolean getMaxLevelFlag() {
        return maxLevelFlag;
    }
    
    public void setMaxLevelFlag(boolean maxLevelFlag) {
        this.maxLevelFlag = maxLevelFlag;
    }
    
    public boolean getMaxShinmitsuFlag() {
        return maxShinmitsuFlag;
    }
    
    public void setMaxShinmitsuFlag(boolean maxShinmitsuFlag) {
        this.maxShinmitsuFlag = maxShinmitsuFlag;
    }
    
    public CardInStock(int id, CardMaster cardMaster, int starRank, 
            int skillLevel, boolean tokkunFlag, boolean maxLevelFlag, 
            boolean maxShinmitsuFlag) {
        super();
        this.id = id;
        this.cardMaster = cardMaster;
        this.starRank = starRank;
        this.skillLevel = skillLevel;
        this.tokkunFlag = tokkunFlag;
        this.maxLevelFlag = maxLevelFlag;
        this.maxShinmitsuFlag = maxShinmitsuFlag;
    }
    
}