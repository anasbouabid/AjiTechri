package com.ajitechri.models;

import java.util.Date;

public class Commande {
	
	private int idCommande;
	private Date dateCommande;
	private double total;
	private String description;
	private String etat;
	Utilisateur utilisateur;
	
	public int getIdCommande() {
		return idCommande;
	}
	public void setIdCommande(int idCommande) {
		this.idCommande = idCommande;
	}
	public Date getDateCommande() {
		return dateCommande;
	}
	public void setDateCommande(Date dateCommande) {
		this.dateCommande = dateCommande;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}
	public Utilisateur getUtilisateur() {
		return utilisateur;
	}
	public void setUtilisateur(Utilisateur util) {
		utilisateur = util;
	}
	public Commande(int idCommande, Date dateCommande, double total, String description, String etat,
			Utilisateur util) {
		super();
		this.idCommande = idCommande;
		this.dateCommande = dateCommande;
		this.total = total;
		this.description = description;
		this.etat = etat;
		utilisateur = util;
	}
	public Commande() {
	}
	
}
