package com.ajitechri.dao;

import java.util.List;

import com.ajitechri.models.ProduitOption;


public interface PanierDao {

	
    boolean ajouterAuPanier(int idProduitOption, int idUtilisateur);
    
    boolean supprimerDuPanier(int idProduitOption, int idUtilisateur);
    
    List<ProduitOption> getProduitOptions(int idUtilisateur);
}
