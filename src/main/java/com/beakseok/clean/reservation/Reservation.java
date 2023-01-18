package com.beakseok.clean.reservation;

public class Reservation {

    String id;
    String phone;
    int StudentRoomNum;
    String reservationDate;
    int reservationTime;
    int reservationMachineNum;
    String reservationSucessTime;

    int studentLevelNum;

    public int getStudentLevelNum() {
        return studentLevelNum;
    }

    public void setStudentLevelNum(int studentLevelNum) {
        this.studentLevelNum = studentLevelNum;
    }

    @Override
    public String toString() {
        return "Reservation{" +
                "id='" + id + '\'' +
                ", phone='" + phone + '\'' +
                ", StudentRoomNum=" + StudentRoomNum +
                ", reservationDate='" + reservationDate + '\'' +
                ", reservationTime=" + reservationTime +
                ", reservationMachineNum=" + reservationMachineNum +
                ", reservationSucessTime='" + reservationSucessTime + '\'' +
                ", studentLevelNum=" + studentLevelNum +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStudentRoomNum() {
        return StudentRoomNum;
    }

    public void setStudentRoomNum(int studentRoomNum) {
        StudentRoomNum = studentRoomNum;
    }

    public String getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(String reservationDate) {
        this.reservationDate = reservationDate;
    }

    public int getReservationTime() {
        return reservationTime;
    }

    public void setReservationTime(int reservationTime) {
        this.reservationTime = reservationTime;
    }

    public int getReservationMachineNum() {
        return reservationMachineNum;
    }

    public void setReservationMachineNum(int reservationMachineNum) {
        this.reservationMachineNum = reservationMachineNum;
    }

    public String getReservationSucessTime() {
        return reservationSucessTime;
    }

    public void setReservationSucessTime(String reservationSucessTime) {
        this.reservationSucessTime = reservationSucessTime;
    }
}
