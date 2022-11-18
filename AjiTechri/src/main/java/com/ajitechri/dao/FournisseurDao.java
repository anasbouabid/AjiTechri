package com.ajitechri.dao;

import java.util.List;

import com.ajitechri.models.Fournisseur;


public interface FournisseurDao {

	
    boolean ajouter(String nom, String email, String tel, String adresse, String description);

    boolean modifier(int id, String nom, String email, String tel, String adresse, String description);
    
    boolean supprimer(int id);
    
    Fournisseur getFournisseur(int id);
    
    List<Fournisseur> getFournisseurs();
}
