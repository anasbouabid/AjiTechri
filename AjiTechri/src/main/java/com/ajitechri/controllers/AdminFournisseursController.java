package com.ajitechri.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajitechri.dao.DaoFactory;
import com.ajitechri.dao.FournisseurDao;
import com.ajitechri.dao.UtilisateurDao;
import com.ajitechri.models.Utilisateur;


@WebServlet("/admin/fournisseurs")
public class AdminFournisseursController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FournisseurDao fournisseurDao;
	private UtilisateurDao utilisateurDao;

	
    public AdminFournisseursController() {
        super();
    }
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.fournisseurDao = daoFactory.getFournisseurDao();
        this.utilisateurDao = daoFactory.getUtilisateurDao();
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
		
		request.setAttribute("fournisseurs", fournisseurDao.getFournisseurs());

		this.getServletContext().getRequestDispatcher("/admin/fournisseurs.jsp").forward(request, response);	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nom = request.getParameter("nom");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String adresse = request.getParameter("adresse");
		String description = request.getParameter("description");
	
		if(request.getParameter("action").equals("ajouter")) {
			boolean resAjoute = fournisseurDao.ajouter(nom, email, tel, adresse, description);
			request.setAttribute("resAjoute", resAjoute);
		}else if(request.getParameter("action").equals("supprimer")) {
			int id = Integer.parseInt(request.getParameter("id"));
			boolean resSupprimer = fournisseurDao.supprimer(id);
			request.setAttribute("resSupprimer", resSupprimer);
		}else if(request.getParameter("action").equals("modifier")) {
			int id = Integer.parseInt(request.getParameter("id"));
			boolean resModifier = fournisseurDao.modifier(id, nom, email, tel, adresse, description);
			request.setAttribute("resModifier", resModifier);
		}
		
		
		doGet(request, response);
	}

}
