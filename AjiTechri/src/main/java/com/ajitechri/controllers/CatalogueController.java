package com.ajitechri.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajitechri.dao.CategorieDao;
import com.ajitechri.dao.DaoFactory;
import com.ajitechri.dao.MarqueDao;
import com.ajitechri.dao.ProduitDao;
import com.ajitechri.dao.UtilisateurDao;
import com.ajitechri.models.Utilisateur;


@WebServlet("/catalogue")
public class CatalogueController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProduitDao produitDao;
	private UtilisateurDao utilisateurDao;
	private CategorieDao categorieDao;
	private MarqueDao marqueDao;


    public CatalogueController() {
        super();
    }
    
    public void init() throws ServletException {
    	DaoFactory daoFactory = DaoFactory.getInstance();
    	this.categorieDao = daoFactory.getCategorieDao();
    	this.marqueDao = daoFactory.getMarqueDao();
        this.produitDao = daoFactory.getProduitDao();
        this.utilisateurDao = daoFactory.getUtilisateurDao();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie c[] = request.getCookies(); 

		if(c != null) {
			for(int i=0;i<c.length;i++){  
				if(c[i].getName().equals("utilisateurId")) {
					Utilisateur utilisateur = utilisateurDao.getUtilisateur(Integer.parseInt(c[i].getValue()));				
					if(utilisateur != null) {
						request.setAttribute("utilisateur", utilisateur);
					}
				}
			}
		}
		request.setAttribute("categories", categorieDao.getCategories());
		request.setAttribute("marques", marqueDao.getMarques());
		
		
		
		String idCategorie = request.getParameter("categorie");
		String idMarque = request.getParameter("marque");
		String nomProduit = request.getParameter("nomProduit");
		
		
		if(idCategorie != null && idMarque != null) {
			request.setAttribute("produits", produitDao.getProduitsFilter(Integer.parseInt(idCategorie), Integer.parseInt(idMarque), nomProduit));
		}else if(idCategorie != null) {
			
			request.setAttribute("produits", produitDao.getProduitsFilter(Integer.parseInt(idCategorie), 0, nomProduit));
		}else if(idMarque != null){
			
			request.setAttribute("produits", produitDao.getProduitsFilter(0, Integer.parseInt(idMarque), nomProduit));
		}else if(nomProduit != null) {
			request.setAttribute("produits", produitDao.getProduitsByNom(nomProduit));
		}else {
			request.setAttribute("produits", produitDao.getProduits());
		}
		

		this.getServletContext().getRequestDispatcher("/catalogue.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
