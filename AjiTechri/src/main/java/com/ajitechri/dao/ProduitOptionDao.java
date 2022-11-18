package com.ajitechri.dao;

import java.util.ArrayList;

import com.ajitechri.models.ProduitOption;


public interface ProduitOptionDao {

    boolean ajouter(String nom, double prix, int stock, int idProduit);

    boolean modifier(int id, String nom, double prix, int stock);
    
    boolean modifierStock(int id, int stock);
    
    boolean supprimer(int id);
    
    ProduitOption getProduitOption(int id);
    
    ArrayList<Integer> getIdProduitOptions(int idProduit);
    
    ArrayList<ProduitOption> getProduitOptions(int idProduit);
}
