package com.ajitechri.controllers;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ajitechri.dao.DaoFactory;
import com.ajitechri.dao.MarqueDao;
import com.ajitechri.dao.UtilisateurDao;
import com.ajitechri.models.Marque;
import com.ajitechri.models.Utilisateur;


@WebServlet("/admin/marques")

@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)

public class AdminMarquesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MarqueDao marqueDao;
	private UtilisateurDao utilisateurDao;

	
    public AdminMarquesController() {
        super();
    }
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.marqueDao = daoFactory.getMarqueDao();
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
		
		request.setAttribute("marques", marqueDao.getMarques());

		this.getServletContext().getRequestDispatcher("/admin/marques.jsp").forward(request, response);	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nom = request.getParameter("nom");

		
		if(request.getParameter("action").equals("ajouter")) {
			
			Part filePart = request.getPart("image");
		    String fichier = filePart.getSubmittedFileName();
		    String[] fDetails = fichier.split("\\.");
		    String extention = fDetails[1];
		    String nomFichier = nom + "-" + UUID.randomUUID().toString() + "." + extention;
			for (Part part : request.getParts()) {
			      part.write("/media/destoshi/TOSHIBA EXT/FI_GI/S2/FIGI Projet/AjiTechri/src/main/webapp/uploads/marques/" + nomFichier);
		    }
			    
			String image = "uploads/marques/" + nomFichier;
			
			boolean resAjoute = marqueDao.ajouter(nom, image);
			request.setAttribute("resAjoute", resAjoute);
		}else if(request.getParameter("action").equals("supprimer")) {
			boolean resSupprimer = marqueDao.supprimer(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("resSupprimer", resSupprimer);
		}else if(request.getParameter("action").equals("modifier")) {
			
			int id = Integer.parseInt(request.getParameter("id"));
			Marque tempMarque = marqueDao.getMarque(id);
			String image = tempMarque.getImage();
			
			
			try {
				Part filePart = request.getPart("image");
			    String fichier = filePart.getSubmittedFileName();
			    String[] fDetails = fichier.split("\\.");
			    String extention = fDetails[1];
			    String nomFichier = nom + "-" + UUID.randomUUID().toString() + "." + extention;
				for (Part part : request.getParts()) {
				      part.write("/media/destoshi/TOSHIBA EXT/FI_GI/S2/FIGI Projet/AjiTechri/src/main/webapp/uploads/marques/" + nomFichier);
			    }
				    
				image = "uploads/marques/" + nomFichier;
			}catch(Exception e) {
				System.out.println(e);
			}
			
			
			boolean resModifier = marqueDao.modifier(id, nom, image);
			request.setAttribute("resModifier", resModifier);
		}
		
		
		doGet(request, response);
	}

}
