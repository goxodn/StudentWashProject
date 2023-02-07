package com.beakseok.clean.user.dao;

import com.beakseok.clean.user.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://goxodn.cafe24.com:3306/goxodn";

    String dbID = "goxodn";
    String dbPW = "rlaxodn1";

    public int create_user_id_check(User user) {

        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(dbURL, dbID, dbPW);
            String SQL = "SELECT * FROM bureUser WHERE ID = ? ";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, user.getId());
            rs = pstmt.executeQuery();
            //1 : 아이디 존재 , 0 : 아이디 존재 X

            //이거 한번씩  한번 쓰면서 외워주세요

            if (rs.next()) {
                return 0;
            } else {
                return 1;
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

    public void create_user(User user) {

        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(dbURL, dbID, dbPW);
            String SQL = "INSERT INTO bureUser VALUES(?,?,?,?,?,?,?,0,NOW())";

            pstmt = con.prepareStatement(SQL);

            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getAddress());
            pstmt.setString(4, user.getPhone());
            pstmt.setString(5, user.getName());
            pstmt.setInt(6, user.getStudentRoomLevel());
            pstmt.setInt(7, user.getStudentRoomNum());
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

    public User loginUser(User user) {
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(dbURL, dbID, dbPW);
            String SQL = "SELECT * FROM bureUser WHERE ID = ? AND PASSWORD = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPassword());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                User userVO = new User();

                userVO.setId(rs.getString("id"));
                userVO.setPassword(rs.getString("password"));
                userVO.setAddress(rs.getString("address"));
                userVO.setName(rs.getString("name"));
                userVO.setPhone(rs.getString("phone"));
                userVO.setStudentRoomLevel(rs.getInt("studentRoomLevel"));
                userVO.setStudentRoomNum(rs.getInt("studentRoomNum"));
                userVO.setCreateUserDate(rs.getDate("createUserDate"));
                userVO.setStudentToken(rs.getInt("studentToken"));

                return userVO;
            } else {
                return null;
            }

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
        return null;
    }
}
