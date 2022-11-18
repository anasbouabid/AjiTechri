package com.ajitechri.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ajitechri.models.Fournisseur;

public class FournisseurDaoImpl implements FournisseurDao {
    private DaoFactory daoFactory;

    FournisseurDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    
    @Override
    public boolean ajouter(String nom, String email, String tel, String adresse, String description) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO fournisseurs (nom, email, tel, adresse, description) VALUES(?, ?, ?, ?, ?);");
            preparedStatement.setString(1, nom);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, tel);
            preparedStatement.setString(4, adresse);
            preparedStatement.setString(5, description);

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
    public Fournisseur getFournisseur(int id) {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Fournisseur fournisseur = null;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM fournisseurs WHERE id_fournisseur = ?");
            preparedStatement.setInt(1, id);
            rs = preparedStatement.executeQuery();
            
            if(rs.next() != false) {
            	fournisseur = new Fournisseur(
        				rs.getInt("id_fournisseur"),
        				rs.getString("nom"),
        				rs.getString("email"),
        				rs.getString("tel"),
        				rs.getString("adresse"),
        				rs.getString("description")
        		);
            	
    			connexion.close();

            	return fournisseur;
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
        
        return fournisseur;
    }

    @Override
    public List<Fournisseur> getFournisseurs() {
        List<Fournisseur> fournisseurs= new ArrayList<Fournisseur>();
        Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM fournisseurs;");

            while (resultat.next()) {
                
                int id = resultat.getInt("id_fournisseur");
                String nom = resultat.getString("nom");
                String email = resultat.getString("email");
                String tel = resultat.getString("tel");
                String adresse = resultat.getString("adresse");
                String description = resultat.getString("description");

                Fournisseur f = new Fournisseur(id, nom, email, tel, adresse, description);
                

                fournisseurs.add(f);
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
        
        return fournisseurs;
    }

	@Override
	public boolean modifier(int id, String nom, String email, String tel, String adresse, String description) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("UPDATE fournisseurs set nom = ?, email = ?, tel = ?, adresse = ?, description = ? where id_fournisseur = ? ");
            preparedStatement.setString(1, nom);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, tel);
            preparedStatement.setString(4, adresse);
            preparedStatement.setString(5, description);
            preparedStatement.setInt(6, id);

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
            preparedStatement = connexion.prepareStatement("DELETE FROM fournisseurs where id_fournisseur = ?");
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

}