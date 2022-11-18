package com.ajitechri.models;

import java.util.Vector;

public class Panier {
	private Utilisateur utilisateur;
	private Vector<ProduitOption> Produits;
	
	public Panier(Utilisateur utilisateur, Vector<ProduitOption> produits) {
		super();
		this.utilisateur = utilisateur;
		Produits = produits;
	}
	public Utilisateur getUtilisateur() {
		return utilisateur;
	}
	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}
	public Vector<ProduitOption> getProduits() {
		return Produits;
	}
	public void setProduits(Vector<ProduitOption> produits) {
		Produits = produits;
	}
	
}
