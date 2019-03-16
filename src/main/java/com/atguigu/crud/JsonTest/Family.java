package com.atguigu.crud.JsonTest;

import java.util.HashMap;
import java.util.Map;

public class Family {
    private String id;
    private String adress;
    private Userr userr;
    private Map<String, Object> extend = new HashMap<>();
    public Family add(String key,Object value){
        this.extend.put(key,value);
        return this;
    }
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public Userr getUserr() {
        return new Userr();
    }

    public void setUserr(Userr userr) {
        this.userr = userr;
    }
    public Family getMess(){
        Family family=new Family();
        family.setId("101");
        family.setAdress("DaBa");
        return family;
    }
}
