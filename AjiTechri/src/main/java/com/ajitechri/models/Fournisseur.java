package com.ajitechri.models;

public class Fournisseur {
	
	private int idFournisseur;
	private String nom;
	private String email;
	private String tel;
	private String adresse;
	private String description;
	
	
	public Fournisseur(int idFournisseur, String nom, String email, String tel, String adresse, String description) {
		super();
		this.idFournisseur = idFournisseur;
		this.nom = nom;
		this.email = email;
		this.tel = tel;
		this.adresse = adresse;
		this.description = description;
	}
	
	public int getIdFournisseur() {
		return idFournisseur;
	}
	
	public void setIdFournisseur(int idFournisseur) {
		this.idFournisseur = idFournisseur;
	}
	
	public String getNom() {
		return nom;
	}
	
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getTel() {
		return tel;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getAdresse() {
		return adresse;
	}
	
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public String toString() {
		return nom;
	}
	
}
