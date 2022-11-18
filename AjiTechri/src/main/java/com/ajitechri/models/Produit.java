package com.ajitechri.models;

import java.util.ArrayList;
import java.util.Date;

public class Produit {
	
	private int idProduit;
	private String designation;
	private String image;
	private String description;
	private double tauxTva;
	private double tauxReduction;
	private Categorie categorie;
	private Fournisseur fournisseur;
	private Marque marque;
	private Date dateAjout;
	
	private ArrayList<Propriete> proprietes;
	private ArrayList<ProduitOption> produitOptions;
	
	
	public Produit() {
	}

	public Produit(int idProduit, String designation, String image, String description, double tauxTva,
			double tauxReduction, Categorie categorie, Fournisseur fournisseur, Marque marque, Date dateAjout,
			ArrayList<Propriete> proprietes, ArrayList<ProduitOption> produitOptions) {
		
		this.idProduit = idProduit;
		this.designation = designation;
		this.image = image;
		this.description = description;
		this.tauxTva = tauxTva;
		this.tauxReduction = tauxReduction;
		this.categorie = categorie;
		this.fournisseur = fournisseur;
		this.marque = marque;
		this.dateAjout = dateAjout;
		
		this.proprietes = proprietes;
		this.produitOptions = produitOptions;
	}

	

	public int getIdProduit() {
		return idProduit;
	}

	public void setIdProduit(int idProduit) {
		this.idProduit = idProduit;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getTauxTva() {
		return tauxTva;
	}

	public void setTauxTva(double tauxTva) {
		this.tauxTva = tauxTva;
	}

	public double getTauxReduction() {
		return tauxReduction;
	}

	public void setTauxReduction(double tauxReduction) {
		this.tauxReduction = tauxReduction;
	}

	public Categorie getCategorie() {
		return categorie;
	}

	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}

	public Fournisseur getFournisseur() {
		return fournisseur;
	}

	public void setFournisseur(Fournisseur fournisseur) {
		this.fournisseur = fournisseur;
	}

	public Marque getMarque() {
		return marque;
	}

	public void setMarque(Marque marque) {
		this.marque = marque;
	}

	public Date getDateAjout() {
		return dateAjout;
	}

	public void setDateAjout(Date dateAjout) {
		this.dateAjout = dateAjout;
	}

	public ArrayList<Propriete> getProprietes() {
		return proprietes;
	}

	public void setProprietes(ArrayList<Propriete> proprietes) {
		this.proprietes = proprietes;
	}

	public ArrayList<ProduitOption> getProduitOptions() {
		return produitOptions;
	}

	public void setProduitOptions(ArrayList<ProduitOption> produitOptions) {
		this.produitOptions = produitOptions;
	}

	@Override
	public String toString() {
		return designation;
	}
}
