package com.ajitechri.models;

public class Marque {
	private int idMarque;
	private String nom;
	private String image;
	public Marque(int id_marque, String nom, String image) {
		super();
		this.idMarque = id_marque;
		this.nom = nom;
		this.image = image;
	}
	public int getIdMarque() {
		return idMarque;
	}
	public void setIdMarque(int id_marque) {
		this.idMarque = id_marque;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return nom;
	}
	
}
