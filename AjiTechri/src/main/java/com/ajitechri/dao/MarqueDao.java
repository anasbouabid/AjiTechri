package com.ajitechri.dao;

import java.util.List;

import com.ajitechri.models.Marque;


public interface MarqueDao {

    boolean ajouter(String nom, String image);

    boolean modifier( int id, String nom, String image);
    
    boolean supprimer( int id);
    
	Marque getMarque (int id);
    
    List<Marque> getMarques();
}
