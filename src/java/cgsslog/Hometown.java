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
public class Hometown {

    private int id;
    private String country;
    private String province;
    
    public int getId(){
        return id;
    }
    
    public void setId(int id){
        this.id = id;
    }
    
    public String getCountry(){
        return country;
    }
    
    public void setCountry(String country){
        this.country = country;
    }
    
    public String getProvince(){
        return province;
    }
    
    public void setProvince(String province){
        this.province = province;
    }
    
    public Hometown(int id, String country, String province){
        super();
        this.id = id;
        this.country = country;
        this.province = province;
    }   
}
