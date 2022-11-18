<%@ include file="../taglibs.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.ajitechri.dao.DaoFactory" %>
<%@ page import="com.ajitechri.dao.ProduitDao" %>
<%@ page import="com.ajitechri.dao.PanierDao" %>
<%@ page import="com.ajitechri.models.ProduitOption" %>
<%@ page import="com.ajitechri.models.Utilisateur" %>

<header class="header">


		<div class="top_bar">
			<div class="container">
				<div class="row">
					<div class="col d-flex flex-row">
						<div class="top_bar_contact_item"><div class="top_bar_icon"><img src="assets/images/phone.png" alt=""></div>+212 645 23 77 40</div>
						<div class="top_bar_contact_item"><div class="top_bar_icon"><img src="assets/images/mail.png" alt=""></div><a href="mailto:contact@ajitechri.com">contact@ajitechri.com</a></div>
						<div class="top_bar_content ml-auto">
							<div class="top_bar_menu">
								<ul class="standard_dropdown top_bar_dropdown">
									<li>
										<a href="#">Français<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="#">Anglais</a></li>
											<li><a href="#">Arabe</a></li>
										</ul>
									</li>
									<li>
										<a href="#">MAD<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="#">$ US Dolar</a></li>
											<li><a href="#">MAD Dirham Marocain</a></li>
											<li><a href="#">Euro</a></li>
										</ul>
									</li>
								</ul>
							</div>
							<div class="top_bar_user">
							
								
								<c:if test="${ !empty cookie.utilisateurId.getValue() && !empty cookie.utilisateurNom.getValue() && !empty cookie.utilisateurPrenom.getValue()}">
	        						
	        						<ul class="standard_dropdown top_bar_dropdown">
										<li>
											<a href="/profile">
		        								<div class="user_icon"><img src="assets/images/user.svg" alt="icon user"></div>
		        								${ cookie.utilisateurNom.getValue() } ${ cookie.utilisateurPrenom.getValue() }
		        							</a>
		        		
											<ul>
												<c:if test="${utilisateur.getPrivilege() != null}">
			        								<c:if test="${utilisateur.getPrivilege() == 'admin'}">
														<li><a href="/admin">Dashboard <span style="margin-left: 45px"> </span></a></li>
			        								</c:if>
			        							</c:if>
			        							<li><a href="/mes-commandes">Mes Commandes <span style="margin-left: 45px"> </span></a></li>
												<li><a href="/logout">Déconnexion <span style="margin-left: 45px"> </span></a></li>
											</ul>
										</li>
									</ul>
	    						</c:if>
	    							    						
	    						<c:if test="${ empty cookie.utilisateurId.getValue() || empty cookie.utilisateurNom.getValue() || empty cookie.utilisateurPrenom.getValue()}">
	        						<div class="user_icon"><img src="assets/images/user.svg" alt="icon user"></div>
	        						<div><a href="register">Inscription</a></div>
									<div><a href="login">Login</a></div>
	    						</c:if>
								
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>


		<div class="header_main">
			<div class="container">
				<div class="row">

					<div class="col-lg-2 col-sm-3 col-3 order-1">
						<div class="logo_container">
							<div class="logo"><a href="/home">AjiTechri</a></div>
						</div>
					</div>

					<div class="col-lg-8 col-12 order-lg-2 order-3 text-lg-left text-right">
						<div class="header_search">
							<div class="header_search_content">
								<div class="header_search_form_container">
									<form action="/catalogue" method="GET" class="header_search_form clearfix">
										<input type="search" name="nomProduit" required="required" class="header_search_input" placeholder="Rechercher des produits...">
										<button type="submit" class="header_search_button trans_300" value="Submit"><img src="assets/images/search.png" alt=""></button>
									</form>
								</div>
							</div>
						</div>
					</div>


					<c:if test="${ !empty cookie.utilisateurId.getValue() && !empty cookie.utilisateurNom.getValue() && !empty cookie.utilisateurPrenom.getValue()}">
						<div class="col-lg-2 col-9 order-lg-3 order-2 text-lg-left text-right">
							<div class="wishlist_cart d-flex flex-row align-items-center justify-content-end">
								<div class="cart">
									<div class="cart_container d-flex flex-row align-items-center justify-content-end">
										<div class="cart_icon">
											<img src="assets/images/cart.png" alt="icon panier">
											<div class="cart_count">
												<span>
													<% 
														Utilisateur utilisateur = (Utilisateur) request.getAttribute("utilisateur");
														DaoFactory daoFactory = DaoFactory.getInstance();
											      		PanierDao panierDao = daoFactory.getPanierDao();
											      		
											      		out.println(panierDao.getProduitOptions(utilisateur.getIdUtilisateur()).size());
													%>
												</span>
											</div>
										</div>
										<div class="cart_content">
											<div class="cart_text"><a href="panier">Panier</a></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		

		<nav class="main_nav">
			<div class="container">
				<div class="row">
					<div class="col">
						
						<div class="main_nav_content d-flex flex-row">


							<div class="cat_menu_container">
								<div class="cat_menu_title d-flex flex-row align-items-center justify-content-start">
									<div class="cat_burger"><span></span><span></span><span></span></div>
									<div class="cat_menu_text">catégories</div>
								</div>

								<ul class="cat_menu">
									<li><a href="/catalogue?nomProduit=&categorie=1">Ordinateurs et Laptops <i class="fas fa-chevron-right ml-auto"></i></a></li>
									<li><a href="/catalogue?nomProduit=&categorie=2">Appareils photo<i class="fas fa-chevron-right"></i></a></li>
									<li><a href="/catalogue?nomProduit=&categorie=3">Smartphones et Tablettes<i class="fas fa-chevron-right"></i></a></li>
									<li><a href="/catalogue?nomProduit=&categorie=4">Accessoires<i class="fas fa-chevron-right"></i></a></li>
									<li><a href="/catalogue?nomProduit=&categorie=5">Jeux vidéo et Consoles<i class="fas fa-chevron-right"></i></a></li>
								</ul>
							</div>


							<div class="main_nav_menu ml-auto">
								<ul class="standard_dropdown main_nav_dropdown">
									<li><a href="/home">Accueil<i class="fas fa-chevron-down"></i></a></li>
									<li><a href="/catalogue">Catalogue<i class="fas fa-chevron-down"></i></a></li>
									<li><a href="/contact">Contact<i class="fas fa-chevron-down"></i></a></li>
								</ul>
							</div>


							<div class="menu_trigger_container ml-auto">
								<div class="menu_trigger d-flex flex-row align-items-center justify-content-end">
									<div class="menu_burger">
										<div class="menu_trigger_text">menu</div>
										<div class="cat_burger menu_burger_inner"><span></span><span></span><span></span></div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</nav>
		

		<div class="page_menu">
			<div class="container">
				<div class="row">
					<div class="col">
						
						<div class="page_menu_content">
							
							<div class="page_menu_search">
								<form action="#">
									<input type="search" required="required" class="page_menu_search_input" placeholder="Rechercher des produits...">
								</form>
							</div>
							<ul class="page_menu_nav">
								<li class="page_menu_item has-children">
									<a href="#">Langue<i class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">Français<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Anglais<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Arabe<i class="fa fa-angle-down"></i></a></li>
									</ul>
								</li>
								<li class="page_menu_item has-children">
									<a href="#">Devise<i class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">Euro<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">$ US Dollar<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">MAD Dirham Marocain<i class="fa fa-angle-down"></i></a></li>
									</ul>
								</li>
								<li class="page_menu_item">
									<a href="#">Accueil<i class="fa fa-angle-down"></i></a>
								</li>
								
								<li class="page_menu_item">
									<a href="/catalogue">Catalogue<i class="fa fa-angle-down"></i></a>
								</li>
								
								<li class="page_menu_item"><a href="/contact">contact<i class="fa fa-angle-down"></i></a></li>
							</ul>
							
							<div class="menu_contact">
								<div class="menu_contact_item"><div class="menu_contact_icon"><img src="assets/images/phone_white.png" alt=""></div>+212 645 23 77 40</div>
								<div class="menu_contact_item"><div class="menu_contact_icon"><img src="assets/images/mail_white.png" alt=""></div><a href="mailto:fastsales@gmail.com">contact@ajitechri.com</a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</header>