package com.ajitechri.models;

public class ProduitOption {
	private int idProduitOption;
	private String nom;
	private double prix;
	private int stock;
	private int idProduit;
	
	
	public ProduitOption(int idProduitOption, String nom, double prix, int stock, int idProduit) {
		this.idProduitOption = idProduitOption;
		this.nom = nom;
		this.prix = prix;
		this.stock = stock;
		this.idProduit = idProduit;
	}
	public int getIdProduitOption() {
		return idProduitOption;
	}
	public void setIdProduitOption(int idProduitOption) {
		this.idProduitOption = idProduitOption;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getIdProduit() {
		return idProduit;
	}
	public void setIdProduit(int idProduit) {
		this.idProduit = idProduit;
	}
	@Override
	public String toString() {
		return nom;
	}
	
	
}
