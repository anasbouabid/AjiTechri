package com.ajitechri.models;

import java.util.Date;

public class Facture {
	private int IdFacture;
	private Date dateFacture;
	private double remise;
	private double totalHT;
	private double totalTTC;
	private Commande commande;
	public int getIdFacture() {
		return IdFacture;
	}
	public void setIdFacture(int IdFacture) {
		this.IdFacture = IdFacture;
	}
	public Date getDateFacture() {
		return dateFacture;
	}
	public void setDateFacture(Date dateFacture) {
		this.dateFacture = dateFacture;
	}
	public double getRemise() {
		return remise;
	}
	public void setRemise(double remise) {
		this.remise = remise;
	}
	public double getTotalHT() {
		return totalHT;
	}
	public void setTotalHT(double totalHT) {
		this.totalHT = totalHT;
	}
	public double getTotalTTC() {
		return totalTTC;
	}
	public void setTotalTTC(double totalTTC) {
		this.totalTTC = totalTTC;
	}
	public Commande getCommande() {
		return commande;
	}
	public void setCommande(Commande commande) {
		this.commande = commande;
	}
	public Facture(int IdFacture, Date dateFacture, double remise, double totalHT, double totalTTC,
			Commande commande) {
		super();
		this.IdFacture = IdFacture;
		this.dateFacture = dateFacture;
		this.remise = remise;
		this.totalHT = totalHT;
		this.totalTTC = totalTTC;
		this.commande = commande;
	}
	@Override
	public String toString() {
		return Integer.toString(IdFacture);
	}
	
}
