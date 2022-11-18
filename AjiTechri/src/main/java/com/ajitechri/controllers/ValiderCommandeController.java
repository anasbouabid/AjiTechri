package com.ajitechri.controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajitechri.dao.CommandeDao;
import com.ajitechri.dao.DaoFactory;
import com.ajitechri.dao.PanierDao;
import com.ajitechri.dao.ProduitOptionDao;
import com.ajitechri.dao.UtilisateurDao;
import com.ajitechri.models.ProduitOption;
import com.ajitechri.models.Utilisateur;

@WebServlet("/valider-commande")


public class ValiderCommandeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
	private PanierDao panierDao;
	private ProduitOptionDao produitOptionDao;
	private CommandeDao commandeDao;
       
 
    public ValiderCommandeController() {
        super();
    }
    
    public void init() throws ServletException {
    	DaoFactory daoFactory = DaoFactory.getInstance();
        this.utilisateurDao = daoFactory.getUtilisateurDao();
        this.panierDao = daoFactory.getPanierDao();
        this.produitOptionDao = daoFactory.getProduitOptionDao();
        this.commandeDao = daoFactory.getCommandeDao();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idUtilisateur = 0;
		
		Cookie c[] = request.getCookies(); 
		
		if(c != null) {
			for(int i=0;i<c.length;i++){  
				if(c[i].getName().equals("utilisateurId")) {
					idUtilisateur = Integer.parseInt(c[i].getValue());
					Utilisateur utilisateur = utilisateurDao.getUtilisateur(Integer.parseInt(c[i].getValue()));				
					if(utilisateur != null) {
						request.setAttribute("utilisateur", utilisateur);
					}
				}
			}
		}
		
		
  		
		
		if(panierDao.getProduitOptions(idUtilisateur).size() == 0) {
			
			response.sendRedirect("/catalogue");

		}else {
			request.setAttribute("options", panierDao.getProduitOptions(idUtilisateur));
			this.getServletContext().getRequestDispatcher("/valider-commande.jsp").forward(request, response);
		}

		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idUtilisateur = 0;
		
		Cookie c[] = request.getCookies(); 
		
		if(c != null) {
			for(int i=0;i<c.length;i++){  
				if(c[i].getName().equals("utilisateurId")) {
					idUtilisateur = Integer.parseInt(c[i].getValue());
					Utilisateur utilisateur = utilisateurDao.getUtilisateur(Integer.parseInt(c[i].getValue()));				
					if(utilisateur != null) {
						request.setAttribute("utilisateur", utilisateur);
					}
				}
			}
		}
		
		ArrayList<ProduitOption> options = (ArrayList<ProduitOption>) panierDao.getProduitOptions(idUtilisateur);
		
		double total = 0.0;
		
		String produits = "";
		for(ProduitOption o : options) {
			produits += o.getIdProduitOption() + ";";
			total += o.getPrix();
			panierDao.supprimerDuPanier(o.getIdProduitOption(), idUtilisateur);
			int stockAncien = o.getStock();
			produitOptionDao.modifierStock(o.getIdProduitOption(), stockAncien - 1);
			
		}
		
		
		//String numCarte = request.getParameter("carteBancaire");
		//String cvv = request.getParameter("cvv");
		String adresse = "Adresse: " +  request.getParameter("adresse");
		String tel = "Tel: " + request.getParameter("tel");
		
		commandeDao.ajouter(total, produits + "#" +  adresse + "#" + tel, idUtilisateur);
			
		response.sendRedirect("/mes-commandes");
	
	}

}
