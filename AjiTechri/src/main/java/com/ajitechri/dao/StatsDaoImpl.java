package com.ajitechri.dao;


import java.sql.*;

import java.util.Vector;


public class StatsDaoImpl implements StatsDao {
    private DaoFactory daoFactory;

    StatsDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    
    
    @Override
    public Vector<String> getStats() {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        
        PreparedStatement preparedStatement2 = null;
        ResultSet rs2 = null;
        
        PreparedStatement preparedStatement3 = null;
        ResultSet rs3 = null;
        
        PreparedStatement preparedStatement4 = null;
        ResultSet rs4 = null;
        
        Vector<String> stats = new Vector<>();
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT COUNT(*) FROM utilisateurs WHERE sexe = ?");
            preparedStatement.setString(1, "Homme");
            rs = preparedStatement.executeQuery();
            
            if(rs.next() != false) {
            	
            	stats.add(String.valueOf(rs.getInt(1)));
            }
            
            
            preparedStatement2 = connexion.prepareStatement("SELECT COUNT(*) FROM utilisateurs WHERE sexe = ?");
            preparedStatement2.setString(1, "Femme");
            rs2 = preparedStatement2.executeQuery();
            
            if(rs2.next() != false) {
            	
            	stats.add(String.valueOf(rs2.getInt(1)));
            }
            
            preparedStatement3 = connexion.prepareStatement("SELECT SUM(total) FROM commandes");
            rs3 = preparedStatement3.executeQuery();
            
            if(rs3.next() != false) {
            	
            	stats.add(String.valueOf(rs3.getDouble(1)));
            }
            
            
            preparedStatement4 = connexion.prepareStatement("SELECT SUM(total) FROM commandes WHERE YEAR(dateCommande) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH) AND MONTH(dateCommande) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)");
            rs4 = preparedStatement4.executeQuery();
            
            if(rs4.next() != false) {
            	
            	stats.add(String.valueOf(rs4.getDouble(1)));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) { /* Rien */}
            }
            if (preparedStatement != null) {
                try {
                	preparedStatement.close();
                } catch (SQLException e) { /* Rien */}
            }
            if (connexion != null) {
                try {
                    connexion.close();
                } catch (SQLException e) { /* Rien */}
            }
        }
        
        return stats;
    }

    

}