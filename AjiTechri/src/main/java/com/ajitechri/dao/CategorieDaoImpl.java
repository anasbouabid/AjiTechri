package com.ajitechri.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ajitechri.models.Categorie;

public class CategorieDaoImpl implements CategorieDao {
    private DaoFactory daoFactory;

    CategorieDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    
    @Override
    public boolean ajouter(String nom) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO categories (nom) VALUES(?);");
            preparedStatement.setString(1, nom);

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
    public Categorie getCategorie(int id) {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Categorie categorie = null;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM categories WHERE id_categorie = ?");
            preparedStatement.setInt(1, id);
            rs = preparedStatement.executeQuery();
            
            if(rs.next() != false) {
            	categorie = new Categorie(
        				rs.getInt("id_categorie"),
        				rs.getString("nom")
        		);
            	
    			connexion.close();
    			
            	return categorie;
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
        
        return categorie;
    }

    @Override
    public List<Categorie> getCategories() {
        List<Categorie> categories= new ArrayList<Categorie>();
        Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM categories;");

            while (resultat.next()) {
                int idCategorie= resultat.getInt("id_categorie");
                String nom = resultat.getString("nom");

                Categorie Cat= new Categorie();
                Cat.setNom(nom);
                Cat.setIdCategorie(idCategorie);

                categories.add(Cat);
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
       
        return categories;
    }

	@Override
	public boolean modifier(int id, String nom) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("UPDATE categories set nom = ? where id_categorie = ? ");
            preparedStatement.setString(1, nom);
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
	public boolean supprimer(int id) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("DELETE FROM categories where id_categorie = ?");
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