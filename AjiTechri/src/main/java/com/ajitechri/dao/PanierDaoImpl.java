package com.ajitechri.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ajitechri.models.ProduitOption;

public class PanierDaoImpl implements PanierDao {
    private DaoFactory daoFactory;

    PanierDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    
    @Override
    public boolean ajouterAuPanier(int idProduitOption, int idUtilisateur) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO paniers (id_produit_option, id_utilisateur) VALUES(?, ?)");
            preparedStatement.setInt(1, idProduitOption);
            preparedStatement.setInt(2, idUtilisateur);

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
    public List<ProduitOption> getProduitOptions(int idUtilisateur) {
        List<ProduitOption> options = new ArrayList<ProduitOption>();
        Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;
        ProduitOptionDao produitOptionDao = daoFactory.getProduitOptionDao();

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM paniers WHERE id_utilisateur = " + idUtilisateur);

            while (resultat.next()) {
                
                int id = resultat.getInt("id_produit_option");
               
                ProduitOption option = produitOptionDao.getProduitOption(id);
                

                options.add(option);
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
        
        return options;
    }


	@Override
	public boolean supprimerDuPanier(int idProduitOption, int idUtilisateur) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("DELETE FROM paniers where id_produit_option = ? AND id_utilisateur = ?");
            preparedStatement.setInt(1, idProduitOption);
            preparedStatement.setInt(2, idUtilisateur);


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