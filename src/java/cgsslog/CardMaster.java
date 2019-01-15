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
public class CardMaster {
    
    private int id;
    private String cardName;
    public CharaMaster charaMaster;
    public Rarity rarity;
    public CardGetMethod cardGetMethod;
    public Skill skill;

    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getCardName() {
        return cardName;
    }
    
    public void setCardName(String cardName) {
        this.cardName = cardName;
    }
    
    public CharaMaster getCharaMaster() {
        return charaMaster;
    }
    
    public void setCharaMaster(CharaMaster charaMaster) {
        this.charaMaster = charaMaster;
    }
    
    public Rarity getRarity() {
        return rarity;
    }
    
    public void setRarity(Rarity rarity) {
        this.rarity = rarity;
    }
    
    public CardGetMethod getCardGetMethod() {
        return cardGetMethod;
    }
    
    public void setCardGetMethod(CardGetMethod cardGetMethod) {
        this.cardGetMethod = cardGetMethod;
    }
        
    public Skill getSkill() {
        return skill;
    }
    
    public void setSkill(Skill skill) {
        this.skill = skill;
    }
   

    public CardMaster(int id, String cardName, CharaMaster charaMaster, 
            Rarity rarity, CardGetMethod cardGetMethod, Skill skill) {
        super();
        this.id = id;
        this.cardName = cardName;
        this.charaMaster = charaMaster;
        this.rarity = rarity;
        this.cardGetMethod = cardGetMethod;
        this.skill = skill;
    }
    
}