package com.ajitechri.controllers;

import java.io.IOException;
import java.util.ArrayList;
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
import com.ajitechri.models.Produit;
import com.ajitechri.models.Utilisateur;


@WebServlet("/admin/produit")

@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)

public class AdminProduitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
	private ProduitDao produitDao;
	private CategorieDao categorieDao;
	private FournisseurDao fournisseurDao;
	private MarqueDao marqueDao;
	private ProprieteDao proprieteDao;
	private ProduitOptionDao produitOptionDao;
	
       
    
    public AdminProduitController() {
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
		Produit produit = null;

		
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
		
		try {
			int idProduit = Integer.parseInt(request.getParameter("id"));
			produit = produitDao.getProduit(idProduit);
		}catch(Exception e) {
			//rien
		}finally {
			if(produit != null) {
				request.setAttribute("produit", produit);
				this.getServletContext().getRequestDispatcher("/admin/produit.jsp").forward(request, response);
			}else {
				response.sendRedirect("/admin/produits");
			}
		}	
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String designation = request.getParameter("designation");
		String description = request.getParameter("description");
		Double tauxTva = Double.parseDouble(request.getParameter("tauxTva"));
		Double tauxReduction = Double.parseDouble(request.getParameter("tauxReduction"));
		int idCategorie = Integer.parseInt(request.getParameter("idCategorie"));
		int idFournisseur = Integer.parseInt(request.getParameter("idFournisseur"));
		int idMarque = Integer.parseInt(request.getParameter("idMarque"));
		
		//int nbrProprietes = Integer.parseInt(request.getParameter("nbrProprietes"));
		//int nbrOptions = Integer.parseInt(request.getParameter("nbrOptions"));
		
		
				
		if(request.getParameter("action").equals("modifier")) {
			
			int id = Integer.parseInt(request.getParameter("id"));
			Produit tempProduit = produitDao.getProduit(id);
			String image = tempProduit.getImage();
			
			try {
				Part filePart = request.getPart("image");
			    String fichier = filePart.getSubmittedFileName();
			    String[] fDetails = fichier.split("\\.");
			    String extention = fDetails[1];
			    String nomFichier = UUID.randomUUID().toString() + "." + extention;
			    
			    int i = 0;
				for (Part part : request.getParts()) {
					if(i == 3) {
						part.write("/media/destoshi/TOSHIBA EXT/FI_GI/S2/FIGI Projet/AjiTechri/src/main/webapp/uploads/produits/" + nomFichier);
					}
					i++;
			    }
				    
				image = "uploads/produits/" + nomFichier;
			}catch(Exception e) {
				System.out.println(e);
			}
			
			
			boolean resModifier = produitDao.modifier(
					id, designation, image, description, tauxTva, tauxReduction, idCategorie, idFournisseur, idMarque
			);
			request.setAttribute("resModifier", resModifier);
						
			
			
			ArrayList<Integer> idsProprietes = proprieteDao.getIdProprietes(id);
			
			for(int i = 0; i < idsProprietes.size(); i++) {
				String propriete = request.getParameter("propriete-" + String.valueOf(idsProprietes.get(i)));
				
				String valeur = request.getParameter("valeurPropriete-" + String.valueOf(idsProprietes.get(i)));
				
				proprieteDao.modifier(idsProprietes.get(i), propriete, valeur);
			}
			
			
			ArrayList<Integer> idsOptions = produitOptionDao.getIdProduitOptions(id);
			
			for(int i = 0; i < idsOptions.size(); i++) {
				String option = request.getParameter("option-" + String.valueOf(idsOptions.get(i)));
				Double prix = Double.parseDouble(request.getParameter("prix-" + String.valueOf(idsOptions.get(i))));
				int stock = Integer.parseInt(request.getParameter("stock-" + String.valueOf(idsOptions.get(i))));
				
				produitOptionDao.modifier(idsOptions.get(i), option, prix, stock);
			}			
		}
		
		doGet(request, response);
	}
	
	

}
