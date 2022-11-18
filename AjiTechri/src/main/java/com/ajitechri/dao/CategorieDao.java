package com.ajitechri.dao;

import java.util.List;

import com.ajitechri.models.Categorie;


public interface CategorieDao {

	
    boolean ajouter(String nom);

    boolean modifier(int id, String nom);
    
    boolean supprimer(int id);
    
    Categorie getCategorie(int id);
    
    List<Categorie> getCategories();
}
