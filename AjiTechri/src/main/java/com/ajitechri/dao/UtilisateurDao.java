package com.ajitechri.dao;
import java.util.ArrayList;
import com.ajitechri.models.Utilisateur;

public interface UtilisateurDao {
	
	Utilisateur getUtilisateur (int id);
	
	Utilisateur getUtilisateur (String email);
	
	Utilisateur login (String email, String mdp);
	
	Utilisateur register (String nom, String prenom, String email, String mdp);
	
	boolean ajouter(String nom, String prenom, String email, String mdp, String tel, String dateNaissance,
			String sexe, String adresse, String ville, String codePostal, String pays, String numeroIdentite, String photo,
			String privilege);
	
	boolean modifier(int id, String nom, String prenom, String email, String tel, String dateNaissance,
			String sexe, String adresse, String ville, String codePostal, String pays, String numeroIdentite, String photo,
			String privilege);
	
	boolean modifierMdp(int id, String mdp, String mdpNew);
	
	boolean supprimer( int id);
	    
    ArrayList<Utilisateur> getUtilisateurs();
}