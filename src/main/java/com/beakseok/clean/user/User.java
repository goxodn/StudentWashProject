package com.beakseok.clean.user;

import java.sql.Date;

public class User {
    private String id;
    private String password;
    private String address;
    private String phone;
    private String name;

    private Date createUserDate;

    public Date getCreateUserDate() {
        return createUserDate;
    }

    public void setCreateUserDate(Date createUserDate) {
        this.createUserDate = createUserDate;
    }

    private int studentRoomLevel;
    private int studentRoomNum;
    private int studentToken;

    public int getStudentRoomLevel() {
        return studentRoomLevel;
    }

    public void setStudentRoomLevel(int studentRoomLevel) {
        this.studentRoomLevel = studentRoomLevel;
    }

    public int getStudentRoomNum() {
        return studentRoomNum;
    }

    public void setStudentRoomNum(int studentRoomNum) {
        this.studentRoomNum = studentRoomNum;
    }

    public int getStudentToken() {
        return studentToken;
    }

    public void setStudentToken(int studentToken) {
        this.studentToken = studentToken;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", password='" + password + '\'' +
                ", address='" + address + '\'' +
                ", studentRoomLevel=" + studentRoomLevel +
                ", studentRoomNum=" + studentRoomNum +
                ", studentToken=" + studentToken +
                ", phone='" + phone + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
