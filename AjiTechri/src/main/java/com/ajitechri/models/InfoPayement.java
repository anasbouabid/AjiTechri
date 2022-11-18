package com.ajitechri.models;



public class InfoPayement {
	private int id_infoPayement;
	private String valeur;
	private	Utilisateur Util;
	private ModePayement mode;

	public InfoPayement(int id_infoPayement, String valeur, Utilisateur util, ModePayement mode) {
		this.id_infoPayement = id_infoPayement;
		this.valeur = valeur;
		Util = util;
		this.mode = mode;
	}
	public int getId_infoPayement() {
		return id_infoPayement;
	}
	public void setId_infoPayement(int id_infoPayement) {
		this.id_infoPayement = id_infoPayement;
	}
	public String getValeur() {
		return valeur;
	}
	public void setValeur(String valeur) {
		this.valeur = valeur;
	}
	public Utilisateur getUtil() {
		return Util;
	}
	public void setUtil(Utilisateur util) {
		Util = util;
	}
	public ModePayement	getMode() {
		return mode;
	}
	public void setMode(ModePayement mode) {
		this.mode = mode;
	}
	
}
