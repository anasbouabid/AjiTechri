package com.ajitechri.dao;


import java.sql.*;
import java.util.ArrayList;

import com.ajitechri.models.Propriete;

public class ProprieteDaoImpl implements ProprieteDao {
    private DaoFactory daoFactory;

    ProprieteDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    
    
    @Override
    public Propriete getPropriete(int id) {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Propriete p = null;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM proprietes WHERE id_propriete = ?");
            preparedStatement.setInt(1, id);
            rs = preparedStatement.executeQuery();
            
            if(rs.next() != false) {
            	p = new Propriete(
        				rs.getInt("id_propriete"),
        				rs.getString("nom"),
        				rs.getString("valeur")
        		);
            	
    			connexion.close();

            	return p;
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
        
        return p;
    }
    
    
    @Override
    public boolean ajouter(String nom, String valeur, int idProduit) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO proprietes (nom, valeur, id_produit) VALUES(?, ?, ?);");
            preparedStatement.setString(1, nom);
            preparedStatement.setString(2, valeur);
            preparedStatement.setInt(3, idProduit);
            
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
	public boolean modifier(int id, String nom, String valeur) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("UPDATE proprietes set nom = ?, valeur = ? where id_propriete = ?");
            preparedStatement.setString(1, nom);
            preparedStatement.setString(2, valeur);
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
            preparedStatement = connexion.prepareStatement("DELETE FROM proprietes where id_proprietes = ?");
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
    public ArrayList<Integer> getIdProprietes(int idProduit) {
		ArrayList<Integer> ids= new ArrayList<Integer>();
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT id_propriete FROM proprietes WHERE id_produit = ?;");
            preparedStatement.setInt(1, idProduit);

            resultat = preparedStatement.executeQuery();
            
            while (resultat.next()) {
                int idPropriete = resultat.getInt("id_propriete");
                
                ids.add(idPropriete);
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
        
        return ids;
    }
	
	
	 @Override
    public ArrayList<Propriete> getProprietes(int idProduit) {
	 ArrayList<Propriete> proprietes= new ArrayList<Propriete>();
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM proprietes WHERE id_produit = ?;");
            preparedStatement.setInt(1, idProduit);

            resultat = preparedStatement.executeQuery();
            
            while (resultat.next()) {
                int idPropriete = resultat.getInt("id_propriete");
                String nom = resultat.getString("nom");
                String valeur = resultat.getString("valeur");
                
                Propriete p = new Propriete(idPropriete, nom, valeur);
                

                proprietes.add(p);
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
        
        return proprietes;
    }

}