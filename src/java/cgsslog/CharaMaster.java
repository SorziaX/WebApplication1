/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cgsslog;
import java.sql.Date;

/**
 *
 * @author shenhanfei
 */
public class CharaMaster {
    
    private int id;
    private String nameKanji;
    private String nameKana;
    private String nameRomaji;
    public Type type;
    private int height;
    private int age;
    private int weight;
    private Date birthday;
    public Seiza seiza;
    public Hometown hometown;
    private String hobby;
    private String cv;
    private String note;

    public int getId(){
        return id;
    }
    
    public void setId(int id){
        this.id = id;
    }

    public String getNameKanji(){
        return nameKanji;
    }
    
    public void setNameKanji(String nameKanji){
        this.nameKanji = nameKanji;
    }
    
    public String getNameKana(){
        return nameKana;
    }
    
    public void setNameKana(String nameKana){
        this.nameKana = nameKana;
    }
    
    public String getNameRomaji(){
        return nameRomaji;
    }
    
    public void setNameRomaji(String nameRomaji){
        this.nameRomaji = nameRomaji;
    }
    
    public Type getType(){
        return type;
    }
    
    public void setType(Type type){
        this.type = type;
    }
    
    public int getHeight(){
        return height;
    }
    
    public void setHeight(int height){
        this.height = height;
    }
    
    public int getAge(){
        return age;
    }
    
    public void setAge(int age){
        this.age = age;
    }
    
    public int getWeight(){
        return weight;
    }
    
    public void setWeight(int weight){
        this.weight = weight;
    }
    
    public Date getBirthday(){
        return birthday;
    }
    
    public void setBirthday(Date birthday){
        this.birthday = birthday;
    }
    
    public Seiza getSeiza(){
        return seiza;
    }
    
    public void setSeiza(Seiza seiza){
        this.seiza = seiza;
    }
    
    public Hometown getHometown(){
        return hometown;
    }
    
    public void setHometown(Hometown hometown){
        this.hometown = hometown;
    }
    
    public String getHobby(){
        return hobby;
    }
    
    public void setHobby(String hobby){
        this.hobby = hobby;
    }
    
    public String getCv(){
        return cv;
    }
    
    public void setCv(String cv){
        this.cv = cv;
    }
    
    public String getNote(){
        return note;
    }
    
    public void setNote(String note){
        this.note = note;
    }

    public CharaMaster(int id, String nameKanji, String nameKana, 
            String nameRomaji, Type type, int height, int age, int weight,
            Date birthday, Seiza seiza, Hometown hometown, String hobby,
            String cv, String note){
        super();
        this.id = id;
        this.nameKanji = nameKanji;
        this.nameKana = nameKana;
        this.nameRomaji = nameRomaji;
        this.type = type;
        this.height = height;
        this.age = age;
        this.weight = weight;
        this.birthday = birthday;
        this.seiza = seiza;
        this.hometown = hometown;
        this.hobby = hobby;
        this.cv = cv;
        this.note = note;
    }
}
