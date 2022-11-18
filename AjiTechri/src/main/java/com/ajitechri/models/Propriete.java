package com.ajitechri.models;

public class Propriete {
	private int idPropriete;
	private String nom;
	private String valeur;
	
	
	public Propriete(int idPropriete, String nom, String valeur) {
		this.idPropriete = idPropriete;
		this.nom = nom;
		this.valeur = valeur;
	}

	public int getIdPropriete() {
		return idPropriete;
	}
	
	public void setId_propriete(int idPropriete) {
		this.idPropriete = idPropriete;
	}
	
	public String getNom() {
		return nom;
	}
	
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public String getValeur() {
		return valeur;
	}
	
	public void setValeur(String valeur) {
		this.valeur = valeur;
	}
	
	@Override
	public String toString() {
		return nom;
	}
	
}
