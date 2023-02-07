package com.beakseok.clean.payment.dao;

import com.beakseok.clean.payment.Payment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PaymentDAO {
/*
* CREATE TABLE PAYMENT(ID VARCHAR(100) NOT NULL,STUDENTTOKEN INT NOT NULL,PRICE INT NOT NULL, PAYMENTDATE DATE NOT NULL);
* */

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://goxodn.cafe24.com:3306/goxodn";

    String dbID = "goxodn";
    String dbPW = "rlaxodn1";

    
    //영수증 넣기
    public void paymentCoin(Payment payment){

        payment.getCoin();
        payment.getId();
        payment.getPrice();

        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(dbURL, dbID, dbPW);
            String SQL = "INSERT INTO PAYMENT VALUES (?,?,?,NOW())";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, payment.getId());
            pstmt.setInt(2, payment.getCoin());
            pstmt.setInt(3, payment.getPrice());
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

    //영수증 넣기
    public void paymentUserCoin(Payment payment){

        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(dbURL, dbID, dbPW);
            String SQL = "UPDATE bureUser SET STUDENTTOKEN = STUDENTTOKEN + ? WHERE ID = ? ";
            pstmt = con.prepareStatement(SQL);
            pstmt.setInt(1, payment.getCoin());
            pstmt.setString(2, payment.getId());
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

    public int searchUserCoin(Payment payment){

        int token = 0 ;
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(dbURL, dbID, dbPW);
            String SQL = "SELECT * FROM bureUser WHERE id = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, payment.getId());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                token = rs.getInt("studentToken");
                // update -1 , select token 개수
                return token;
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
        return 0;
    }

}
