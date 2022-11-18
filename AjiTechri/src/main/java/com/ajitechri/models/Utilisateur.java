package com.ajitechri.models;

import java.util.Date;

public class Utilisateur {
	private int idUtilisateur;
	private String nom;
	private String prenom;
	private String email;
	private String mdp;
	private String tel;
	private Date dateNaissance;
	private String sexe;
	private String adresse;
	private String ville;
	private int codePostal;
	private String pays;
	private String numeroIdentite;
	private String photo;
	private String privilege;
	
	
	
	public Utilisateur() {
		super();
	}

	public Utilisateur(int idUtilisateur, String nom, String prenom, String email, String mdp, String tel, Date dateNaissance,
			String sexe, String adresse, String ville, int codePostal, String pays, String numeroIdentite, String photo,
			String privilege) {
		super();
		this.idUtilisateur = idUtilisateur;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.mdp = mdp;
		this.tel = tel;
		this.dateNaissance = dateNaissance;
		this.sexe = sexe;
		this.adresse = adresse;
		this.ville = ville;
		this.codePostal = codePostal;
		this.pays = pays;
		this.numeroIdentite = numeroIdentite;
		this.photo = photo;
		this.privilege = privilege;
	}


	public int getIdUtilisateur() {
		return idUtilisateur;
	}

	public void setIdUtilisateur(int id) {
		this.idUtilisateur = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMdp() {
		return mdp;
	}

	public void setMdp(String mdp) {
		this.mdp = mdp;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getDateNaissance() {
		return dateNaissance;
	}

	public void setDateNaissance(Date dateNaissance) {
		this.dateNaissance = dateNaissance;
	}

	public String getSexe() {
		return sexe;
	}

	public void setSexe(String sexe) {
		this.sexe = sexe;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public int getCodePostal() {
		return codePostal;
	}

	public void setCodePostal(int codePostal) {
		this.codePostal = codePostal;
	}

	public String getPays() {
		return pays;
	}

	public void setPays(String pays) {
		this.pays = pays;
	}

	public String getNumeroIdentite() {
		return numeroIdentite;
	}

	public void setNumeroIdentite(String numeroIdentite) {
		this.numeroIdentite = numeroIdentite;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPrivilege() {
		return privilege;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}
	
	public boolean isAdmin() {
		return this.privilege.equals("admin");
	}


	@Override
	public String toString() {
		return nom + " " + prenom;
	}
	
	
}
