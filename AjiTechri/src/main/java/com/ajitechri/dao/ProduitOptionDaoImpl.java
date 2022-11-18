package com.ajitechri.dao;


import java.sql.*;
import java.util.ArrayList;

import com.ajitechri.models.ProduitOption;

public class ProduitOptionDaoImpl implements ProduitOptionDao {
    private DaoFactory daoFactory;

    ProduitOptionDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    
    
    @Override
    public ProduitOption getProduitOption(int id) {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        ProduitOption p = null;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM produit_options WHERE id_produit_option = ?");
            preparedStatement.setInt(1, id);
            rs = preparedStatement.executeQuery();
                        
            if(rs.next() != false) {
            	p = new ProduitOption(
        				rs.getInt("id_produit_option"),
        				rs.getString("nom"),
        				rs.getDouble("prix"),
        				rs.getInt("stock"),
        				rs.getInt("id_produit")
        		);
            	
    			connexion.close();

            	return p;
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
        
        return p;
    }
    
    
    @Override
    public boolean ajouter(String nom, double prix, int stock, int idProduit) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO produit_options (nom, prix, stock, id_produit) VALUES(?, ?, ?, ?);");
            preparedStatement.setString(1, nom);
            preparedStatement.setDouble(2, prix);
            preparedStatement.setInt(3, stock);
            preparedStatement.setInt(4, idProduit);
            
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
	public boolean modifier(int id,String nom, double prix, int stock) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("UPDATE produit_options set nom = ?, prix = ?, stock = ? where id_produit_option = ?");
            preparedStatement.setString(1, nom);
            preparedStatement.setDouble(2, prix);
            preparedStatement.setInt(3, stock);
            preparedStatement.setInt(4, id);
            
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
	public boolean modifierStock(int id, int stock) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("UPDATE produit_options set stock = ? where id_produit_option = ?");
            preparedStatement.setInt(1, stock);
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
            preparedStatement = connexion.prepareStatement("DELETE FROM produit_options where id_produit_option = ?");
            preparedStatement.setInt(1, id);

            res = preparedStatement.executeUpdate();
            
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
    public ArrayList<Integer>  getIdProduitOptions(int idProduit) {
		ArrayList<Integer> ids= new ArrayList<Integer>();
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT id_produit_option FROM produit_options WHERE id_produit = ?;");
            preparedStatement.setInt(1, idProduit);

            resultat = preparedStatement.executeQuery();
            
            while (resultat.next()) {
                int idOption = resultat.getInt("id_produit_option");
                
                ids.add(idOption);
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
	    public ArrayList<ProduitOption> getProduitOptions(int idProduit) {
		 ArrayList<ProduitOption> proprietes= new ArrayList<ProduitOption>();
	        Connection connexion = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultat = null;

	        try {
	            connexion = daoFactory.getConnection();
	            preparedStatement = connexion.prepareStatement("SELECT * FROM produit_options WHERE id_produit = ? ORDER BY prix");
	            preparedStatement.setInt(1, idProduit);

	            resultat = preparedStatement.executeQuery();
	            	            
	            while (resultat.next()) {
	                ProduitOption p = new ProduitOption(
	        				resultat.getInt("id_produit_option"),
	        				resultat.getString("nom"),
	        				resultat.getDouble("prix"),
	        				resultat.getInt("stock"),
	        				idProduit
	        		);
	                

	                proprietes.add(p);
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
	        
	        return proprietes;
	    }

}