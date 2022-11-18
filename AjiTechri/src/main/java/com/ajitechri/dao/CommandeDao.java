package com.ajitechri.dao;

import java.util.ArrayList;

import com.ajitechri.models.Commande;


public interface CommandeDao {

    boolean ajouter(double total, String description, int idUtilisateur);

    boolean modifier(int id, String etat);
            
    Commande getCommande(int id);
    
    ArrayList<Commande> getCommandes();
    
    ArrayList<Commande> getCommandesUtilisateur(int idUtilisateur);
}
