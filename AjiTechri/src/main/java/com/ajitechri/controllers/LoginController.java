package com.ajitechri.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajitechri.dao.UtilisateurDao;
import com.ajitechri.models.Utilisateur;
import com.ajitechri.dao.DaoFactory;


@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
       
    
    public LoginController() {
        super();
    }
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.utilisateurDao = daoFactory.getUtilisateurDao();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie c[] = request.getCookies();
				
		if(c != null) {
			if(c.length >= 3) {
				for(int i=0;i<c.length;i++){  
					if(c[i].getName().equals("utilisateurId")) {
						Utilisateur utilisateur = utilisateurDao.getUtilisateur(Integer.parseInt(c[i].getValue()));				
						if(utilisateur != null) {
							response.sendRedirect("/home");
						}else {
							this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
						}
					}
				}
			}else {
				this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
			}
		}else {
			this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Utilisateur utilisateur = utilisateurDao.login(request.getParameter("email"), request.getParameter("mdp"));
		
		if(utilisateur != null) {
	        Cookie cookieId = new Cookie("utilisateurId", Integer.toString(utilisateur.getIdUtilisateur()));
	        Cookie cookieNom = new Cookie("utilisateurNom", utilisateur.getNom());
	        Cookie cookiePrenom = new Cookie("utilisateurPrenom", utilisateur.getPrenom());

	        cookieId.setMaxAge(60 * 60 * 24 * 1);
	        cookieNom.setMaxAge(60 * 60 * 24 * 1);
	        cookiePrenom.setMaxAge(60 * 60 * 24 * 1);

	        response.addCookie(cookieId);
	        response.addCookie(cookieNom);
	        response.addCookie(cookiePrenom);

	        
	        if(utilisateur.isAdmin()) {
		        Cookie isAdmin = new Cookie("isAdmin", "true");
		        isAdmin.setMaxAge(60 * 60 * 24 * 1);
		        response.addCookie(isAdmin);

	        	response.sendRedirect(request.getContextPath() + "/admin");
	        }else {
	        	response.sendRedirect(request.getContextPath() + "/home");
	        }
		}else {
			request.setAttribute("errMsg", "Email ou Mot De Passe incorrect");
			this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

}
