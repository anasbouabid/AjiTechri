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
import com.ajitechri.dao.UtilisateurDao;
import com.ajitechri.models.Utilisateur;


@WebServlet("/admin/categories")
public class AdminCategoriesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategorieDao categorieDao;
	private UtilisateurDao utilisateurDao;

	
    public AdminCategoriesController() {
        super();
    }
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.categorieDao = daoFactory.getCategorieDao();
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
		
		request.setAttribute("categories", categorieDao.getCategories());

		this.getServletContext().getRequestDispatcher("/admin/categories.jsp").forward(request, response);	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("action").equals("ajouter")) {
			boolean resAjoute = categorieDao.ajouter((String) request.getParameter("categorie"));
			request.setAttribute("resAjoute", resAjoute);
		}else if(request.getParameter("action").equals("supprimer")) {
			boolean resSupprimer = categorieDao.supprimer(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("resSupprimer", resSupprimer);
		}else if(request.getParameter("action").equals("modifier")) {
			boolean resModifier = categorieDao.modifier(Integer.parseInt(request.getParameter("id")), request.getParameter("nom"));
			request.setAttribute("resModifier", resModifier);
		}
		
		
		doGet(request, response);
	}

}
