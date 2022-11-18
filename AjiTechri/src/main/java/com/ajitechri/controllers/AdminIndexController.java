package com.ajitechri.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajitechri.dao.DaoFactory;
import com.ajitechri.dao.StatsDao;
import com.ajitechri.dao.UtilisateurDao;
import com.ajitechri.models.Utilisateur;


@WebServlet("/admin")
public class AdminIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
	private StatsDao statsDao;
       
	
    public AdminIndexController() {
        super();
    }
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.utilisateurDao = daoFactory.getUtilisateurDao();
        this.statsDao = daoFactory.getStatsDao();
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
		
		request.setAttribute("stats", statsDao.getStats());
		
		this.getServletContext().getRequestDispatcher("/admin/index.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
