package com.atguigu.crud.JsonTest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class Tester {

    @Test
    public void rt(){
        List<Userr> userrList=new ArrayList<>();
        Userr userr1=new Userr();
        userr1.setName("王八蛋");
        userr1.setAge(18);
        userr1.setGender("M");
        userrList.add(userr1);
        Userr userr2=new Userr();
        userr2.setName("李斯");
        userr2.setGender("W");
        userr2.setAge(20);
        userrList.add(userr2);
        JSONArray jsonArray=new JSONArray(userrList);
        System.out.println(jsonArray);
    }

}
