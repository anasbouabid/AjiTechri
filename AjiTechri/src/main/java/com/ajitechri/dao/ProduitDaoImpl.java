package com.ajitechri.dao;


import java.sql.*;
import java.util.ArrayList;

import com.ajitechri.models.Produit;

public class ProduitDaoImpl implements ProduitDao {
    private DaoFactory daoFactory;

    ProduitDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    
    @Override
    public Produit getProduit(int id) {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Produit produit = null;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM produits WHERE id_produit = ?");
            preparedStatement.setInt(1, id);
            rs = preparedStatement.executeQuery();
            
            CategorieDao categorieDao = daoFactory.getCategorieDao();
            FournisseurDao fournisseurDao = daoFactory.getFournisseurDao();
            MarqueDao marqueDao = daoFactory.getMarqueDao();
            ProprieteDao proprieteDao = daoFactory.getProprieteDao();
            ProduitOptionDao produitOptionDao = daoFactory.getProduitOptionDao();
            
            if(rs.next() != false) {
            	produit = new Produit(
            			rs.getInt("id_produit"),
        				rs.getString("designation"),
        				rs.getString("image"),
        				rs.getString("description"),
        				rs.getDouble("tauxTva"),
        				rs.getDouble("tauxReduction"),
        				categorieDao.getCategorie(rs.getInt("id_categorie")),
        				fournisseurDao.getFournisseur(rs.getInt("id_fournisseur")),
        				marqueDao.getMarque(rs.getInt("id_marque")),
        				rs.getDate("dateAjout"),
        				proprieteDao.getProprietes(rs.getInt("id_produit")),
        				produitOptionDao.getProduitOptions(rs.getInt("id_produit"))
        		);
            	
            	return produit;
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
        
        return produit;
    }
    
    
    @Override
    public boolean ajouter(String designation, String image, String description, double tauxTva,
			double tauxReduction, int id_categorie, int id_fournisseur, int id_marque) {
    	
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO produits (`designation`, `image`, `description`, `tauxTva`, `tauxReduction`, `id_categorie`, `id_fournisseur`, `id_marque`, `dateAjout`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, CURDATE())");
            preparedStatement.setString(1, designation);
            preparedStatement.setString(2, image);
            preparedStatement.setString(3, description);
            preparedStatement.setDouble(4, tauxTva);
            preparedStatement.setDouble(5, tauxReduction);
            preparedStatement.setInt(6, id_categorie);
            preparedStatement.setInt(7, id_fournisseur);
            preparedStatement.setInt(8, id_marque);

            
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
    public boolean modifier(int id, String designation, String image, String description, double tauxTva,
			double tauxReduction, int id_categorie, int id_fournisseur, int id_marque) {
    	
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("UPDATE produits SET `designation` = ?, `image` = ?, `description` = ?, `tauxTva` = ?, `tauxReduction` = ?, `id_categorie` = ?, `id_fournisseur` = ?, `id_marque` = ? WHERE id_produit = ?");
            preparedStatement.setString(1, designation);
            preparedStatement.setString(2, image);
            preparedStatement.setString(3, description);
            preparedStatement.setDouble(4, tauxTva);
            preparedStatement.setDouble(5, tauxReduction);
            preparedStatement.setInt(6, id_categorie);
            preparedStatement.setInt(7, id_fournisseur);
            preparedStatement.setInt(8, id_marque);
            preparedStatement.setInt(9, id);

            
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
	public boolean supprimer(int id) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("DELETE FROM produits where id_produit = ?");
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
    public int getIdRecent() {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        int idProduit = -1;

        try {
        	connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT id_produit FROM produits ORDER BY id_produit DESC LIMIT 1;");
            rs = preparedStatement.executeQuery();
            
            if(rs.next()) {
            	idProduit = rs.getInt("id_produit");
            }
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
        
        return idProduit;
    }
    

    @Override
    public ArrayList<Produit> getProduits() {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        ArrayList<Produit> produits = new ArrayList<Produit>();
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM produits ORDER BY id_produit DESC");
            rs = preparedStatement.executeQuery();
            
            CategorieDao categorieDao = daoFactory.getCategorieDao();
            FournisseurDao fournisseurDao = daoFactory.getFournisseurDao();
            MarqueDao marqueDao = daoFactory.getMarqueDao();
            ProprieteDao proprieteDao = daoFactory.getProprieteDao();
            ProduitOptionDao produitOptionDao = daoFactory.getProduitOptionDao();
            
            while(rs.next()) {
            	Produit produit = new Produit(
            			rs.getInt("id_produit"),
        				rs.getString("designation"),
        				rs.getString("image"),
        				rs.getString("description"),
        				rs.getDouble("tauxTva"),
        				rs.getDouble("tauxReduction"),
        				categorieDao.getCategorie(rs.getInt("id_categorie")),
        				fournisseurDao.getFournisseur(rs.getInt("id_fournisseur")),
        				marqueDao.getMarque(rs.getInt("id_marque")),
        				rs.getDate("dateAjout"),
        				proprieteDao.getProprietes(rs.getInt("id_produit")),
        				produitOptionDao.getProduitOptions(rs.getInt("id_produit"))
        		);
            	produits.add(produit);
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
        
        return produits;
    }
    
    
    @Override
    public ArrayList<Produit> getProduitsSolde() {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        ArrayList<Produit> produits = new ArrayList<Produit>();

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM produits WHERE tauxReduction != 0.00 ORDER BY id_produit DESC LIMIT 5");

            rs = preparedStatement.executeQuery();
            
            CategorieDao categorieDao = daoFactory.getCategorieDao();
            FournisseurDao fournisseurDao = daoFactory.getFournisseurDao();
            MarqueDao marqueDao = daoFactory.getMarqueDao();
            ProprieteDao proprieteDao = daoFactory.getProprieteDao();
            ProduitOptionDao produitOptionDao = daoFactory.getProduitOptionDao();
                        
            while(rs.next()) {
            	Produit produit = new Produit(
            			rs.getInt("id_produit"),
        				rs.getString("designation"),
        				rs.getString("image"),
        				rs.getString("description"),
        				rs.getDouble("tauxTva"),
        				rs.getDouble("tauxReduction"),
        				categorieDao.getCategorie(rs.getInt("id_categorie")),
        				fournisseurDao.getFournisseur(rs.getInt("id_fournisseur")),
        				marqueDao.getMarque(rs.getInt("id_marque")),
        				rs.getDate("dateAjout"),
        				proprieteDao.getProprietes(rs.getInt("id_produit")),
        				produitOptionDao.getProduitOptions(rs.getInt("id_produit"))
        		);
            	
            	produits.add(produit);
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
        
        return produits;
    }
    
    
    
    @Override
    public ArrayList<Produit> getProduitsNouveau() {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        ArrayList<Produit> produits = new ArrayList<Produit>();

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM produits ORDER BY dateAjout DESC LIMIT 5");

            rs = preparedStatement.executeQuery();
            
            CategorieDao categorieDao = daoFactory.getCategorieDao();
            FournisseurDao fournisseurDao = daoFactory.getFournisseurDao();
            MarqueDao marqueDao = daoFactory.getMarqueDao();
            ProprieteDao proprieteDao = daoFactory.getProprieteDao();
            ProduitOptionDao produitOptionDao = daoFactory.getProduitOptionDao();
                        
            while(rs.next()) {
            	Produit produit = new Produit(
            			rs.getInt("id_produit"),
        				rs.getString("designation"),
        				rs.getString("image"),
        				rs.getString("description"),
        				rs.getDouble("tauxTva"),
        				rs.getDouble("tauxReduction"),
        				categorieDao.getCategorie(rs.getInt("id_categorie")),
        				fournisseurDao.getFournisseur(rs.getInt("id_fournisseur")),
        				marqueDao.getMarque(rs.getInt("id_marque")),
        				rs.getDate("dateAjout"),
        				proprieteDao.getProprietes(rs.getInt("id_produit")),
        				produitOptionDao.getProduitOptions(rs.getInt("id_produit"))
        		);
            	
            	produits.add(produit);
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
        
        return produits;
    }
    
    
    @Override
    public ArrayList<Produit> getProduitsFilter(int categorie, int marque, String nom) {
    	Connection connexion = null;
        Statement preparedStatement = null;
        ResultSet rs = null;
        ArrayList<Produit> produits = new ArrayList<Produit>();

        try {
            connexion = daoFactory.getConnection();
        	preparedStatement = connexion.createStatement();

            if(categorie != 0 && marque != 0) {
            	rs = preparedStatement.executeQuery("SELECT * FROM produits WHERE id_categorie = "+ categorie +" AND id_marque = "+ marque +" AND designation LIKE '%"+ nom +"%' ORDER BY dateAjout DESC");
            }else if(categorie != 0) {
            	rs = preparedStatement.executeQuery("SELECT * FROM produits WHERE id_categorie = "+ categorie +" AND designation LIKE '%"+ nom +"%' ORDER BY dateAjout DESC");
            }else if(marque != 0) {
            	rs = preparedStatement.executeQuery("SELECT * FROM produits WHERE id_marque = "+ marque +" AND designation LIKE '%"+ nom +"%' ORDER BY dateAjout DESC");
            }
            
            CategorieDao categorieDao = daoFactory.getCategorieDao();
            FournisseurDao fournisseurDao = daoFactory.getFournisseurDao();
            MarqueDao marqueDao = daoFactory.getMarqueDao();
            ProprieteDao proprieteDao = daoFactory.getProprieteDao();
            ProduitOptionDao produitOptionDao = daoFactory.getProduitOptionDao();
                        
            while(rs.next()) {
            	Produit produit = new Produit(
            			rs.getInt("id_produit"),
        				rs.getString("designation"),
        				rs.getString("image"),
        				rs.getString("description"),
        				rs.getDouble("tauxTva"),
        				rs.getDouble("tauxReduction"),
        				categorieDao.getCategorie(rs.getInt("id_categorie")),
        				fournisseurDao.getFournisseur(rs.getInt("id_fournisseur")),
        				marqueDao.getMarque(rs.getInt("id_marque")),
        				rs.getDate("dateAjout"),
        				proprieteDao.getProprietes(rs.getInt("id_produit")),
        				produitOptionDao.getProduitOptions(rs.getInt("id_produit"))
        		);
            	
            	produits.add(produit);
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
        
        return produits;
    }
    
    @Override
    public ArrayList<Produit> getProduitsByNom(String nom) {
    	Connection connexion = null;
        Statement statement = null;
        ResultSet rs = null;
        ArrayList<Produit> produits = new ArrayList<Produit>();

        try {
            connexion = daoFactory.getConnection();
            
            statement = connexion.createStatement();
            
            rs = statement.executeQuery("SELECT * FROM produits WHERE designation LIKE '%" + nom + "%' ORDER BY dateAjout DESC");

            
            CategorieDao categorieDao = daoFactory.getCategorieDao();
            FournisseurDao fournisseurDao = daoFactory.getFournisseurDao();
            MarqueDao marqueDao = daoFactory.getMarqueDao();
            ProprieteDao proprieteDao = daoFactory.getProprieteDao();
            ProduitOptionDao produitOptionDao = daoFactory.getProduitOptionDao();
                        
            while(rs.next()) {
            	Produit produit = new Produit(
            			rs.getInt("id_produit"),
        				rs.getString("designation"),
        				rs.getString("image"),
        				rs.getString("description"),
        				rs.getDouble("tauxTva"),
        				rs.getDouble("tauxReduction"),
        				categorieDao.getCategorie(rs.getInt("id_categorie")),
        				fournisseurDao.getFournisseur(rs.getInt("id_fournisseur")),
        				marqueDao.getMarque(rs.getInt("id_marque")),
        				rs.getDate("dateAjout"),
        				proprieteDao.getProprietes(rs.getInt("id_produit")),
        				produitOptionDao.getProduitOptions(rs.getInt("id_produit"))
        		);
            	
            	produits.add(produit);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (rs != null) {
                try {
                    rs.close();
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
        
        return produits;
    }

}