package com.ajitechri.dao;


import java.sql.*;
import java.util.ArrayList;

import com.ajitechri.models.Utilisateur;
import com.ajitechri.util.PasswordUtils;

public class UtilisateurDaoImpl implements UtilisateurDao {
    private DaoFactory daoFactory;

    UtilisateurDaoImpl(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    
    @Override
    public Utilisateur getUtilisateur(int id) {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Utilisateur utilisateur = null;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM utilisateurs WHERE id_utilisateur = ?");
            preparedStatement.setInt(1, id);
            rs = preparedStatement.executeQuery();
            
            if(rs.next() != false) {
            	utilisateur = new Utilisateur(
        				rs.getInt("id_utilisateur"),
        				rs.getString("nom"),
        				rs.getString("prenom"),
        				rs.getString("email"),
        				rs.getString("mdp"),
        				rs.getString("tel"),
        				rs.getDate("dateNaissance"),
        				rs.getString("sexe"),
        				rs.getString("adresse"),
        				rs.getString("ville"),
        				rs.getInt("codePostal"),
        				rs.getString("pays"),
        				rs.getString("numIdentite"),
        				rs.getString("photo"),
        				rs.getString("privilege")
        		);
            	
            	connexion.close();
            	return utilisateur;
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
        
        return utilisateur;
    }
    
    @Override
    public Utilisateur getUtilisateur(String email) {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Utilisateur utilisateur = null;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM utilisateurs WHERE email = ?");
            preparedStatement.setString(1, email);
            rs = preparedStatement.executeQuery();
            
            if(rs.next() != false) {
            	utilisateur = new Utilisateur(
        				rs.getInt("id_utilisateur"),
        				rs.getString("nom"),
        				rs.getString("prenom"),
        				rs.getString("email"),
        				rs.getString("mdp"),
        				rs.getString("tel"),
        				rs.getDate("dateNaissance"),
        				rs.getString("sexe"),
        				rs.getString("adresse"),
        				rs.getString("ville"),
        				rs.getInt("codePostal"),
        				rs.getString("pays"),
        				rs.getString("numIdentite"),
        				rs.getString("photo"),
        				rs.getString("privilege")
        		);
            	
            	connexion.close();
            	return utilisateur;
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
        
        return utilisateur;
    }
    
    
    @Override
	public Utilisateur register(String nom, String prenom, String email, String mdp) {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        Utilisateur utilisateur = null;
        
        if(getUtilisateur(email) != null) {
    		return utilisateur;
    	}
        
        String salt = PasswordUtils.getSalt(30);
        String securePass = PasswordUtils.generateSecurePassword(mdp, salt);
        String hashedPass = salt + securePass;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO utilisateurs (nom, prenom, email, mdp, privilege) VALUES (?, ?, ?, ?, ?)");
            preparedStatement.setString(1, nom);
            preparedStatement.setString(2, prenom);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, hashedPass);
            preparedStatement.setString(5, "utilisateur");
            int success = preparedStatement.executeUpdate();
            
            if(success > 0) {
            	utilisateur = getUtilisateur(email);
            }
            
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
        
        return utilisateur;
	}

    
    @Override
    public Utilisateur login(String email, String mdp) {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Utilisateur utilisateur = null;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM utilisateurs WHERE email = ?");
            preparedStatement.setString(1, email);
            rs = preparedStatement.executeQuery();
            
            if(rs.next() != false) {
            	String hashedPass = rs.getString("mdp");
            	String salt = hashedPass.substring(0,30);
            	String securePass = hashedPass.substring(30, hashedPass.length());
            	
                
            	if(PasswordUtils.verifyUserPassword(mdp, securePass, salt)) {

            		utilisateur = new Utilisateur(
            				
            				rs.getInt("id_utilisateur"),
            				rs.getString("nom"),
            				rs.getString("prenom"),
            				rs.getString("email"),
            				rs.getString("mdp"),
            				rs.getString("tel"),
            				rs.getDate("dateNaissance"),
            				rs.getString("sexe"),
            				rs.getString("adresse"),
            				rs.getString("ville"),
            				rs.getInt("codePostal"),
            				rs.getString("pays"),
            				rs.getString("numIdentite"),
            				rs.getString("photo"),
            				rs.getString("privilege")
            		);
            		
            		connexion.close();
            		return utilisateur;
            	}else {
            		connexion.close();
            		return utilisateur;
            	}
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
        
        return utilisateur;
    }
    
    
    @Override
    public boolean modifierMdp(int id, String mdp, String mdpNew) {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        int res = 0;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM utilisateurs WHERE id_utilisateur = ?");
            preparedStatement.setInt(1, id);
            rs = preparedStatement.executeQuery();
            
            if(rs.next() != false) {
            	String hashedPass = rs.getString("mdp");
            	String salt = hashedPass.substring(0,30);
            	String securePass = hashedPass.substring(30, hashedPass.length());

                
            	if(PasswordUtils.verifyUserPassword(mdp, securePass, salt)) {

            		String saltNew = PasswordUtils.getSalt(30);
                    String securePassNew = PasswordUtils.generateSecurePassword(mdpNew, saltNew);
                    String hashedPassNew = saltNew + securePassNew;
      
                	
                    PreparedStatement preparedStatement2 = connexion.prepareStatement("UPDATE utilisateurs SET `mdp` = ? WHERE id_utilisateur = ?");
                    preparedStatement2.setString(1, hashedPassNew);
                    preparedStatement2.setInt(2, id);

                    
                    res = preparedStatement2.executeUpdate();
            		
            		connexion.close();
            		return res != 0;
            	}else {
            		connexion.close();
            		return res != 0;
            	}
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
        
        return res != 0;
    }
    
    
    @Override
    public boolean ajouter(String nom, String prenom, String email, String mdp, String tel, String dateNaissance,
			String sexe, String adresse, String ville, String codePostal, String pays, String numeroIdentite, String photo,
			String privilege) {
    	
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;
        
        if(getUtilisateur(email) != null) {
    		return false;
    	}
        
        String salt = PasswordUtils.getSalt(30);
        String securePass = PasswordUtils.generateSecurePassword(mdp, salt);
        String hashedPass = salt + securePass;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO utilisateurs (`nom`, `prenom`, `email`, `mdp`, `tel`, `dateNaissance`, `sexe`, `adresse`, `ville`, `codePostal`, `pays`, `numIdentite`, `photo`, `privilege`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            preparedStatement.setString(1, nom);
            preparedStatement.setString(2, prenom);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, hashedPass);
            preparedStatement.setString(5, tel);
            preparedStatement.setString(6, dateNaissance);
            preparedStatement.setString(7, sexe);
            preparedStatement.setString(8, adresse);
            preparedStatement.setString(9, ville);
            preparedStatement.setString(10, codePostal);
            preparedStatement.setString(11, pays);
            preparedStatement.setString(12, numeroIdentite);
            preparedStatement.setString(13, photo);
            preparedStatement.setString(14, privilege);

            
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
    public boolean modifier(int id, String nom, String prenom, String email, String tel, String dateNaissance,
			String sexe, String adresse, String ville, String codePostal, String pays, String numeroIdentite, String photo,
			String privilege) {
    	
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        int res = 0;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("UPDATE utilisateurs SET `nom` = ?, `prenom` = ?, `email` = ?, `tel` = ?, `dateNaissance` = ?, `sexe` = ?, `adresse` = ?, `ville` = ?, `codePostal` = ?, `pays` = ?, `numIdentite` = ?, `photo` = ?, `privilege` = ? WHERE id_utilisateur = ?");
            preparedStatement.setString(1, nom);
            preparedStatement.setString(2, prenom);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, tel);
            preparedStatement.setString(5, dateNaissance);
            preparedStatement.setString(6, sexe);
            preparedStatement.setString(7, adresse);
            preparedStatement.setString(8, ville);
            preparedStatement.setString(9, codePostal);
            preparedStatement.setString(10, pays);
            preparedStatement.setString(11, numeroIdentite);
            preparedStatement.setString(12, photo);
            preparedStatement.setString(13, privilege);
            preparedStatement.setInt(14, id);

            
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
            preparedStatement = connexion.prepareStatement("DELETE FROM utilisateurs where id_utilisateur = ?");
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
    public ArrayList<Utilisateur> getUtilisateurs() {
    	Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        ArrayList<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM utilisateurs");
            rs = preparedStatement.executeQuery();
            
            while(rs.next()) {
            	Utilisateur utilisateur = new Utilisateur(
        				rs.getInt("id_utilisateur"),
        				rs.getString("nom"),
        				rs.getString("prenom"),
        				rs.getString("email"),
        				rs.getString("mdp"),
        				rs.getString("tel"),
        				rs.getDate("dateNaissance"),
        				rs.getString("sexe"),
        				rs.getString("adresse"),
        				rs.getString("ville"),
        				rs.getInt("codePostal"),
        				rs.getString("pays"),
        				rs.getString("numIdentite"),
        				rs.getString("photo"),
        				rs.getString("privilege")
        		);
            	utilisateurs.add(utilisateur);
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
        
        return utilisateurs;
    }

}