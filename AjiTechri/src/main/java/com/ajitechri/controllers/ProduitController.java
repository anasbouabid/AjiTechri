package com.ajitechri.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajitechri.dao.DaoFactory;
import com.ajitechri.dao.PanierDao;
import com.ajitechri.dao.ProduitDao;
import com.ajitechri.dao.UtilisateurDao;
import com.ajitechri.models.Produit;
import com.ajitechri.models.Utilisateur;


@WebServlet("/produit")
public class ProduitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProduitDao produitDao;
	private UtilisateurDao utilisateurDao;
	private PanierDao panierDao;


    public ProduitController() {
        super();
    }
    
    public void init() throws ServletException {
    	DaoFactory daoFactory = DaoFactory.getInstance();
        this.produitDao = daoFactory.getProduitDao();
        this.utilisateurDao = daoFactory.getUtilisateurDao();
        this.panierDao = daoFactory.getPanierDao();
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
		
		try {
			int idProduit = Integer.parseInt(request.getParameter("p"));
			produit = produitDao.getProduit(idProduit);
		}catch(Exception e) {
			//rien
		}finally {
			if(produit != null) {
				request.setAttribute("produit", produit);
				this.getServletContext().getRequestDispatcher("/produit.jsp").forward(request, response);
			}else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
			}
		}

		request.setAttribute("produit", produit);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idUtilisateur = 0;
		
		Cookie c[] = request.getCookies();
		
		for(int i=0;i<c.length;i++){  
			if(c[i].getName().equals("utilisateurId")) {
				idUtilisateur = Integer.parseInt(c[i].getValue());				
				
			}
		}
		
		if(idUtilisateur != 0) {
			String idOption = request.getParameter("option");
			
			if(idOption != null && idUtilisateur != 0) {
				panierDao.ajouterAuPanier(Integer.parseInt(idOption), idUtilisateur);
			}
			
			response.sendRedirect("/panier");
		}else {
			response.sendRedirect("/login");
		}

	
	}

}
