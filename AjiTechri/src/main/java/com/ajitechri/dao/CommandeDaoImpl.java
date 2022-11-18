package com.ajitechri.dao;


import java.sql.*;
import java.util.ArrayList;

import com.ajitechri.models.Commande;

public class CommandeDaoImpl implements CommandeDao {
    private DaoFactory daoFactory;

    CommandeDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    
    
    @Override
    public Commande getCommande(int id) {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Commande c = null;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM commandes WHERE id_commande = ?");
            preparedStatement.setInt(1, id);
            rs = preparedStatement.executeQuery();
            
            UtilisateurDao utilisateurDao = daoFactory.getUtilisateurDao();
            
            if(rs.next() != false) {
            	c = new Commande(
        				rs.getInt("id_commande"),
        				rs.getDate("dateCommande"),
        				rs.getDouble("total"),
        				rs.getString("description"),
        				rs.getString("etat"),
        				utilisateurDao.getUtilisateur(rs.getInt("id_utilisateur"))
        		);
            	
    			connexion.close();

            	return c;
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
        
        return c;
    }
    
    
    @Override
    public boolean ajouter(double total, String description, int idUtilisateur) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO commandes (dateCommande, total, description, etat, id_utilisateur) VALUES(CURDATE(), ?, ?,'En Cours De Traitement', ?);");
            preparedStatement.setDouble(1, total);
            preparedStatement.setString(2, description);
            preparedStatement.setInt(3, idUtilisateur);
            
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
	public boolean modifier(int id, String etat) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("UPDATE commandes set etat = ? where id_commande = ?");
            preparedStatement.setString(1, etat);
            preparedStatement.setInt(2, id);
            
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
	public ArrayList<Commande> getCommandes() {
	 	ArrayList<Commande> commandes = new ArrayList<Commande>();
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM commandes ORDER BY dateCommande");

            resultat = preparedStatement.executeQuery();
            
            UtilisateurDao utilisateurDao = daoFactory.getUtilisateurDao();
            
            while (resultat.next()) {
                Commande c =  new Commande(
        				resultat.getInt("id_commande"),
        				resultat.getDate("dateCommande"),
        				resultat.getDouble("total"),
        				resultat.getString("description"),
        				resultat.getString("etat"),
        				utilisateurDao.getUtilisateur(resultat.getInt("id_utilisateur"))
        		);
                

                commandes.add(c);
            }

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
        
        return commandes;
    }
	
	
	@Override
	public ArrayList<Commande> getCommandesUtilisateur(int idUtilisateur) {
	 	ArrayList<Commande> commandes = new ArrayList<Commande>();
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM commandes WHERE id_utilisateur = ? ORDER BY dateCommande");
            preparedStatement.setInt(1, idUtilisateur);

            resultat = preparedStatement.executeQuery();
            
            UtilisateurDao utilisateurDao = daoFactory.getUtilisateurDao();
            
            while (resultat.next()) {
                Commande c =  new Commande(
        				resultat.getInt("id_commande"),
        				resultat.getDate("dateCommande"),
        				resultat.getDouble("total"),
        				resultat.getString("description"),
        				resultat.getString("etat"),
        				utilisateurDao.getUtilisateur(resultat.getInt("id_utilisateur"))
        		);
                

                commandes.add(c);
            }

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
        
        return commandes;
    }

}