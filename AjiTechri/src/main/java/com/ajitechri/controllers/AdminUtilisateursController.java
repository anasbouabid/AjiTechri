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
import com.ajitechri.dao.UtilisateurDao;
import com.ajitechri.models.Utilisateur;


@WebServlet("/admin/utilisateurs")

@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)

public class AdminUtilisateursController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDao utilisateurDao;
	
       
    
    public AdminUtilisateursController() {
        super();
    }
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
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
		
		request.setAttribute("utilisateurs", utilisateurDao.getUtilisateurs());
		
		this.getServletContext().getRequestDispatcher("/admin/utilisateurs.jsp").forward(request, response);	
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String email = request.getParameter("email");
		String mdp = request.getParameter("mdp");
		String tel = request.getParameter("tel");
		String dateNaissance = request.getParameter("dateNaissance");
		String sexe = request.getParameter("sexe");
		String adresse = request.getParameter("adresse");
		String ville = request.getParameter("ville");
		String codePostal = request.getParameter("codePostal");
		String pays = request.getParameter("pays");
		String numIdentite = request.getParameter("numIdentite");
		String privilege = request.getParameter("privilege");
		
		
		
		if(request.getParameter("action").equals("ajouter")) {
			
			Part filePart = request.getPart("photo");
		    String fichier = filePart.getSubmittedFileName();
		    String[] fDetails = fichier.split("\\.");
		    String extention = fDetails[1];
		    String nomFichier = nom + "-" + prenom + "-" + UUID.randomUUID().toString() + "." + extention;
			for (Part part : request.getParts()) {
			      part.write("/media/destoshi/TOSHIBA EXT/FI_GI/S2/FIGI Projet/AjiTechri/src/main/webapp/uploads/avatars/" + nomFichier);
		    }
			    
			String photo = "uploads/avatars/" + nomFichier;
			
			boolean resAjoute = utilisateurDao.ajouter(
					nom, prenom, email, mdp, tel, dateNaissance, sexe, adresse, ville, codePostal, pays, numIdentite, photo, privilege
			);
			request.setAttribute("resAjoute", resAjoute);
		}else if(request.getParameter("action").equals("supprimer")) {
			boolean resSupprimer = utilisateurDao.supprimer(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("resSupprimer", resSupprimer);
		}else if(request.getParameter("action").equals("modifier")) {
			
			int id = Integer.parseInt(request.getParameter("id"));
			Utilisateur tempUser = utilisateurDao.getUtilisateur(id);
			String photo = tempUser.getPhoto();
			
			try {
				Part filePart = request.getPart("photo");
			    String fichier = filePart.getSubmittedFileName();
			    String[] fDetails = fichier.split("\\.");
			    String extention = fDetails[1];
			    String nomFichier = nom + "-" + prenom + "-" + UUID.randomUUID().toString() + "." + extention;
				for (Part part : request.getParts()) {
				      part.write("F:\\FI_GI\\S2\\FIGI Projet\\AjiTechri\\src\\main\\webapp\\uploads\\avatars\\" + nomFichier);
			    }
				    
				photo = "uploads/avatars/" + nomFichier;
			}catch(Exception e) {
				System.out.println(e);
			}
			
			
			boolean resModifier = utilisateurDao.modifier(
					id, nom, prenom, email, tel, dateNaissance, sexe, adresse, ville, codePostal, pays, numIdentite, photo, privilege
			);
			request.setAttribute("resModifier", resModifier);
		}
		
		
		
		doGet(request, response);
	}
	
	

}
