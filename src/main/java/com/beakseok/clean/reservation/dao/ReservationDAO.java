package com.beakseok.clean.reservation.dao;

import com.beakseok.clean.reservation.Reservation;
import com.beakseok.clean.user.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReservationDAO {

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://goxodn.cafe24.com:3306/goxodn";

    String dbID = "goxodn";
    String dbPW = "rlaxodn1";

    //예약 확인 가능한지 여부 확인
    public int reservationInquiry(String reservationMachineNum, String reservationTime, String reservationDate, int studentLevelNum) {

        int parseReservationMachineNum = Integer.parseInt(reservationMachineNum);
        int parseReservationTime = Integer.parseInt(reservationTime);

        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(dbURL, dbID, dbPW);
            String SQL = "SELECT * FROM RESERVATIONMACHINE WHERE RESERVATIONMACHINENUM = ? AND RESERVATIONTIME = ? AND RESERVATIONDATE = ? AND STUDENTLEVELNUM = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setInt(1, parseReservationMachineNum);
            pstmt.setInt(2, parseReservationTime);
            pstmt.setString(3, reservationDate);
            pstmt.setInt(4, studentLevelNum);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                //예약이 불가능 한 경우
                return 0;
            } else {
                //예약이 가능한 경우
                return 1;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try{
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }



    //예약 하기
    public void reservation(String id, String phone, int studentRoomNum, String reservationDate, String reservationTime,
                            String reservationMachineNum, int studentLevelNum) {

        int parseReservationTime = Integer.parseInt(reservationTime);
        int parseReservationMachineNum = Integer.parseInt(reservationMachineNum);
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(dbURL, dbID, dbPW);
            String SQL = "INSERT INTO RESERVATIONMACHINE VALUES(?,?,?,?,?,?,?,NOW())";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, id);
            pstmt.setString(2, phone);
            pstmt.setInt(3, studentRoomNum);
            pstmt.setString(4, reservationDate);
            pstmt.setInt(5, parseReservationTime);
            pstmt.setInt(6, parseReservationMachineNum);
            pstmt.setInt(7, studentLevelNum);

            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    //날짜 , 버튼 -> 예약 가능 시간, 불가능한 시간을 List로 가져옴
    public Map<String, Reservation> reservationMainInquery(String reservationDate, int studentLevelNum) {
        // 예약 불가 , 10 11 13 15
        Map<String, Reservation> reservationMap = new HashMap<String, Reservation>();

        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(dbURL, dbID, dbPW);
            // 2022-12-19 3
            String SQL = "SELECT * FROM RESERVATIONMACHINE WHERE RESERVATIONDATE = ? AND STUDENTLEVELNUM = ?;";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, reservationDate);
            pstmt.setInt(2, studentLevelNum);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Reservation reservation = new Reservation();

                reservation.setId(rs.getString("id"));
                reservation.setPhone(rs.getString("phone"));
                reservation.setStudentRoomNum(rs.getInt("studentRoomNum"));
                reservation.setReservationDate(rs.getString("reservationDate"));
                reservation.setReservationTime(rs.getInt("reservationTime"));
                reservation.setReservationMachineNum(rs.getInt("reservationMachineNum"));
                reservation.setStudentLevelNum(rs.getInt("studentLevelNum"));
                String strChange = rs.getInt("reservationTime") + "-" + rs.getInt("reservationMachineNum");

                reservationMap.put(strChange, reservation);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return reservationMap;
    }



    //예약 가능 , 불가능 텍스트 불러오기
    public String searchTime(int time, int reservationMachineNum, ArrayList<Reservation> firstMachine
            , ArrayList<Reservation> secondMachine, ArrayList<Reservation> thirdMachine) {
        String text = null;
        ArrayList<Reservation> reservationList;
        if (reservationMachineNum == 1) {
            reservationList = firstMachine;
        } else if (reservationMachineNum == 2) {
            reservationList = secondMachine;
        } else {
            reservationList = thirdMachine;
        }

        for (int i = 0; i < reservationList.size(); i++) {
            if (reservationList.get(i).getReservationTime() == time) {
                text = "예약 완료";
            }
        }
        if (text == null) {
            int time_sec = time + 1;
            text = time + "~" + time_sec;
        }

        return text;
    }

    public void reservationUserMinusToken(String userId) {

        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(dbURL, dbID, dbPW);
            String SQL = "UPDATE bureUser SET STUDENTTOKEN = STUDENTTOKEN -1 WHERE ID = ? ";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, userId);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


}
