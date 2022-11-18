package com.ajitechri.controllers;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ajitechri.dao.CategorieDao;
import com.ajitechri.dao.DaoFactory;
import com.ajitechri.dao.FournisseurDao;
import com.ajitechri.dao.MarqueDao;
import com.ajitechri.dao.ProduitDao;
import com.ajitechri.dao.ProduitOptionDao;
import com.ajitechri.dao.ProprieteDao;
import com.ajitechri.dao.UtilisateurDao;
import com.ajitechri.models.Utilisateur;


@WebServlet("/admin/produits_ajouter")

@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)

public class AdminProduitsAjouterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
	private ProduitDao produitDao;
	private CategorieDao categorieDao;
	private FournisseurDao fournisseurDao;
	private MarqueDao marqueDao;
	private ProprieteDao proprieteDao;
	private ProduitOptionDao produitOptionDao;
	
       
    
    public AdminProduitsAjouterController() {
        super();
    }
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.utilisateurDao = daoFactory.getUtilisateurDao();
        this.produitDao = daoFactory.getProduitDao();
        this.categorieDao = daoFactory.getCategorieDao();
        this.fournisseurDao = daoFactory.getFournisseurDao();
        this.marqueDao = daoFactory.getMarqueDao();
        this.proprieteDao = daoFactory.getProprieteDao();
        this.produitOptionDao = daoFactory.getProduitOptionDao();

    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie c[] = request.getCookies(); 

		
		for(int i=0;i<c.length;i++){  
			if(c[i].getName().equals("utilisateurId")) {
				Utilisateur utilisateur = utilisateurDao.getUtilisateur(Integer.parseInt(c[i].getValue()));				
				if(utilisateur != null) {
					request.setAttribute("utilisateur", utilisateur);
				}
			}
		}
		
		request.setAttribute("categories", categorieDao.getCategories());
		request.setAttribute("fournisseurs", fournisseurDao.getFournisseurs());
		request.setAttribute("marques", marqueDao.getMarques());
		
		this.getServletContext().getRequestDispatcher("/admin/produits_ajouter.jsp").forward(request, response);	
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String designation = request.getParameter("designation");
		String description = request.getParameter("description");
		Double tauxTva = Double.parseDouble(request.getParameter("tauxTva"));
		Double tauxReduction = Double.parseDouble(request.getParameter("tauxReduction"));
		int idCategorie = Integer.parseInt(request.getParameter("idCategorie"));
		int idFournisseur = Integer.parseInt(request.getParameter("idFournisseur"));
		int idMarque = Integer.parseInt(request.getParameter("idMarque"));
		
		int nbrProprietes = Integer.parseInt(request.getParameter("nbrProprietes"));
		int nbrOptions = Integer.parseInt(request.getParameter("nbrOptions"));
		
		
				
		if(request.getParameter("action").equals("ajouter")) {
			
			Part filePart = request.getPart("image");
		    String fichier = filePart.getSubmittedFileName();
		    String[] fDetails = fichier.split("\\.");
		    String extention = fDetails[1];
		    String nomFichier = UUID.randomUUID().toString() + "." + extention;
		    int k = 0;
			for (Part part : request.getParts()) {
				if(k == 2) {
					part.write("/media/destoshi/TOSHIBA EXT/FI_GI/S2/FIGI Projet/AjiTechri/src/main/webapp/uploads/produits/" + nomFichier);
				}
				k++;
		    }
			    
			String image = "uploads/produits/" + nomFichier;
			
			boolean resAjoute = produitDao.ajouter(
					designation, image, description, tauxTva, tauxReduction, idCategorie, idFournisseur, idMarque
			);
			
			// Id de produit
			int idProduit = produitDao.getIdRecent();
			
			// les proprietes
			for(int i = 0; i < nbrProprietes; i++) {
				String propriete = request.getParameter("repeater-list["+ String.valueOf(i) +"][propriete]");
				String valeur = request.getParameter("repeater-list["+ String.valueOf(i) +"][valeurPropriete]");
				
				proprieteDao.ajouter(propriete, valeur, idProduit);
			}
			
			// les options
			for(int i = 0; i < nbrOptions; i++) {
				String option = request.getParameter("repeater-list["+ String.valueOf(i) +"][option]");
				Double prix = Double.parseDouble(request.getParameter("repeater-list["+ String.valueOf(i) +"][prix]"));
				int stock = Integer.parseInt(request.getParameter("repeater-list["+ String.valueOf(i) +"][stock]"));
				
				produitOptionDao.ajouter(option, prix, stock, idProduit);
			}
			
			request.setAttribute("resAjoute", resAjoute);
		}else if(request.getParameter("action").equals("supprimer")) {
			boolean resSupprimer = produitDao.supprimer(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("resSupprimer", resSupprimer);
		}
		
		
		doGet(request, response);
	}
	
	

}
