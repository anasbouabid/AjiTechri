package com.ajitechri.dao;
import java.util.ArrayList;

import com.ajitechri.models.Produit;

public interface ProduitDao {
	
	Produit getProduit (int id);
		
	boolean ajouter(String designation, String image, String description, double tauxTva,
			double tauxReduction, int id_categorie, int id_fournisseur, int id_marque);
	
	boolean modifier(int id, String designation, String image, String description, double tauxTva,
			double tauxReduction, int id_categorie, int id_fournisseur, int id_marque);
	
	boolean supprimer(int id);
	
	int getIdRecent();
	    
    ArrayList<Produit> getProduits();
    
    ArrayList<Produit> getProduitsSolde();
    
    ArrayList<Produit> getProduitsNouveau();
    
    ArrayList<Produit> getProduitsFilter(int categorie, int marque, String nom);
    
    ArrayList<Produit> getProduitsByNom(String nom);
}