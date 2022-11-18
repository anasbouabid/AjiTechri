package com.ajitechri.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ajitechri.models.Marque;

public class MarqueDaoImpl implements MarqueDao {
    private DaoFactory daoFactory;

    MarqueDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    
    
    @Override
    public Marque getMarque(int id) {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Marque m = null;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM marques WHERE id_marque = ?");
            preparedStatement.setInt(1, id);
            rs = preparedStatement.executeQuery();
            
            if(rs.next() != false) {
            	m = new Marque(
        				rs.getInt("id_marque"),
        				rs.getString("nom"),
        				rs.getString("image")
        		);
            	
    			connexion.close();

            	return m;
            }
            
            connexion.close();
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
        
        return m;
    }
    
    
    @Override
    public boolean ajouter(String nom, String image) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO marques (nom, image) VALUES(?, ?);");
            preparedStatement.setString(1, nom);
            preparedStatement.setString(2, image);
            
            res = preparedStatement.executeUpdate();
            
			connexion.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
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
        
        return res != 0;
    }

	@Override
	public boolean modifier(int id, String nom, String image) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("UPDATE marques set nom = ?, image = ? where id_marque = ? ");
            preparedStatement.setString(1, nom);
            preparedStatement.setString(2, image);
            preparedStatement.setInt(3, id);

            res = preparedStatement.executeUpdate();
            
			connexion.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
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
        
        return res != 0;
		
	}

	@Override
	public boolean supprimer(int id) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("DELETE FROM marques where id_marque = ?");
            preparedStatement.setInt(1, id);

            res = preparedStatement.executeUpdate();
            
			connexion.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
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
        
        return res != 0;
		
	}
	
	 @Override
	    public List<Marque> getMarques() {
	        List<Marque> marques= new ArrayList<Marque>();
	        Connection connexion = null;
	        Statement statement = null;
	        ResultSet resultat = null;

	        try {
	            connexion = daoFactory.getConnection();
	            statement = connexion.createStatement();
	            resultat = statement.executeQuery("SELECT * FROM marques;");

	            while (resultat.next()) {
	                int idMarque = resultat.getInt("id_marque");
	                String nom = resultat.getString("nom");
	                String image = resultat.getString("image");
	                
	                Marque m= new Marque(idMarque, nom, image);
	                

	                marques.add(m);
	            }
	            
				connexion.close();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally {
	            if (resultat != null) {
	                try {
	                    resultat.close();
	                } catch (SQLException e) { /* Rien */}
	            }
	            if (statement != null) {
	                try {
	                	statement.close();
	                } catch (SQLException e) { /* Rien */}
	            }
	            if (connexion != null) {
	                try {
	                    connexion.close();
	                } catch (SQLException e) { /* Rien */}
	            }
	        }
	        
	        return marques;
	    }

}