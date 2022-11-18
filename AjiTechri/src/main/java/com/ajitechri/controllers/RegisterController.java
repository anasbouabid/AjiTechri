package com.ajitechri.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajitechri.dao.DaoFactory;
import com.ajitechri.dao.UtilisateurDao;
import com.ajitechri.models.Utilisateur;


@WebServlet("/register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;

       
    public RegisterController() {
        super();
    }
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.utilisateurDao = daoFactory.getUtilisateurDao();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String email = request.getParameter("email");
		String mdp = request.getParameter("mdp");
		
		Utilisateur utilisateur = utilisateurDao.register(nom, prenom, email, mdp);
		
		if(utilisateur == null) {
			request.setAttribute("errMsg", "Cette adresse e-mail est deja utilise");
			this.getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
		}
		
		response.sendRedirect(request.getContextPath() + "/login");
	}

}
