package com.ajitechri.models;

import java.util.Vector;

public class ProduitOpt_Commande {
	private Commande commande;
	private Vector<ProduitOption> Produits;
	public ProduitOpt_Commande(Commande commande, Vector<ProduitOption> produits) {
		super();
		this.commande = commande;
		Produits = produits;
	}
	public Commande getCommande() {
		return commande;
	}
	public void setCommande(Commande commande) {
		this.commande = commande;
	}
	public Vector<ProduitOption> getProduits() {
		return Produits;
	}
	public void setProduits(Vector<ProduitOption> produits) {
		Produits = produits;
	}
	
}
