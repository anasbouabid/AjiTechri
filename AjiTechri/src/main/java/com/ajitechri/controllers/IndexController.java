package com.ajitechri.controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajitechri.dao.DaoFactory;
import com.ajitechri.dao.ProduitDao;
import com.ajitechri.dao.UtilisateurDao;
import com.ajitechri.models.Produit;
import com.ajitechri.models.Utilisateur;


@WebServlet("/home")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProduitDao produitDao;
	private UtilisateurDao utilisateurDao;


    public IndexController() {
        super();
    }
    
    public void init() throws ServletException {
    	DaoFactory daoFactory = DaoFactory.getInstance();
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
		
		ArrayList<Produit> produitsSolde = produitDao.getProduitsSolde();
		ArrayList<Produit> produitsNouveau = produitDao.getProduitsNouveau();
		
		request.setAttribute("produitsSolde", produitsSolde);
		request.setAttribute("produitsNouveau", produitsNouveau);

		
		this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
