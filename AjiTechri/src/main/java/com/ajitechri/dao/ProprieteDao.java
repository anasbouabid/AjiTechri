package com.ajitechri.dao;

import java.util.ArrayList;

import com.ajitechri.models.Propriete;


public interface ProprieteDao {

    boolean ajouter(String nom, String valeur, int idProduit);

    boolean modifier(int id, String nom, String valeur);
    
    boolean supprimer(int id);
    
    Propriete getPropriete (int id);
    
    ArrayList<Integer> getIdProprietes(int idProduit);
    
    ArrayList<Propriete> getProprietes(int idProduit);
}
