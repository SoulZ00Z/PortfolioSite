/* Guest DAO */
package com.portfolio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.stereotype.Component;

/**
 * Spring Boot DAO for Guest
 * 
 * Converts GuestDAO to Spring Boot DAO.
 */

@Component // Spring Boot injects GuestDAO dependency.
public class GuestDAO {
    
    private Connection conn;
    
    public GuestDAO() { // Connects to DB.
        try {
            this.conn = dbConnection.getConnection();
            if (conn == null) {
                throw new RuntimeException("Failed to connect to DB!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Connection error: " + e.getMessage(), e);
        }
    }
    
    public GuestBO verifyGuest(String guestID, String pwString) {
        GuestBO guest = null;
        String sql = "SELECT GuestID, PhoneNumber FROM GuestInfo WHERE GuestID = ? AND PW = ?";
        
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, guestID.trim());
            statement.setString(2, pwString);
            
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    guest = new GuestBO();
                    guest.setGuestID(rs.getString("GuestID"));
                    guest.setPhoneNumber(rs.getString("PhoneNumber"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return guest;
    }
    
    // Select guest.
    public GuestBO selectGuest(String guestID) {
        GuestBO guest = null;
        String sql = "SELECT * FROM GuestInfo WHERE GuestID = ?";
        
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, guestID);
            
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    guest = new GuestBO();
                    guest.setGuestID(rs.getString("GuestID"));
                    guest.setPhoneNumber(rs.getString("PhoneNumber"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return guest;
    }
    
    // Insert guest.
    public void insertGuest(String guestID, String pwString, String phoneNumber) throws SQLException {
        String sql = "INSERT INTO GuestInfo (GuestID, PW, PhoneNumber) VALUES(?,?,?)";
        
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, guestID);
            statement.setString(2, pwString);
            if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
                statement.setNull(3, java.sql.Types.VARCHAR);
            } else {
                statement.setString(3, phoneNumber);
            }
            
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Insert successful!");
            } else {
                System.out.println("Insert failed! No rows edited.");
                throw new SQLException("Insert failed! No rows edited");
            }
        } catch (SQLException e) {
            System.out.println("Insert failed: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }
    
    // Edit guest.
    public boolean editGuest(GuestBO guest, String pwString) {
        boolean successfullyEdited = false;
        String sql = "UPDATE GuestInfo SET PW = ?, PhoneNumber = ? WHERE GuestID = ?";
        
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, pwString);
            statement.setString(2, guest.getPhoneNumber());
            statement.setString(3, guest.getGuestID());
            
            int editedRows = statement.executeUpdate();
            successfullyEdited = editedRows > 0;
            
            if (successfullyEdited) {
                System.out.println("Edit success!");
            } else {
                System.out.println("Edit fail!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return successfullyEdited;
    }
    
    // Delete guest.
    public boolean deleteGuest(String guestID) {
        boolean successfullyDeleted = false;
        String sql = "DELETE FROM GuestInfo WHERE GuestID = ?";
        
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, guestID);
            
            int deletedRows = statement.executeUpdate();
            successfullyDeleted = deletedRows > 0;
            
            if (successfullyDeleted) {
                System.out.println("Delete success!");
            } else {
                System.out.println("Delete fail!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return successfullyDeleted;
    }
    
    // Check if guest ID exists.
    public boolean guestIDExists(String guestID) {
        boolean guestIDExists = false;
        String sql = "SELECT COUNT(*) FROM GuestInfo WHERE GuestID = ?";
        
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, guestID);
            
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    guestIDExists = rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return guestIDExists;
    }
}
