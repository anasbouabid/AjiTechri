<%@ include file="includes/taglibs.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<!DOCTYPE html>
<html lang="fr">
<head>
	<%@ include file="includes/main/head.jsp" %>

	<link rel="stylesheet" type="text/css" href="assets/plugins/slick-1.8.0/slick.css">
	<link rel="stylesheet" type="text/css" href="assets/styles/responsive.css">
	
	<title>AjiTechri</title>
</head>

<body>

<div class="super_container">
	
	
	<%@ include file="includes/main/header.jsp" %>


	<div class="characteristics pb-0">
		<div class="container">
			<div class="row d-flex justify-content-center">

				<div class="col-lg-4 col-md-4 char_col">
					
					<div class="char_item d-flex flex-row align-items-center justify-content-start">
						<div class="char_icon"><img src="assets/images/char_1.png" alt=""></div>
						<div class="char_content">
							<div class="char_title">Livraison gratuite</div>
							<div class="char_subtitle">D'après 500 DH</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-4 char_col">
					
					<div class="char_item d-flex flex-row align-items-center justify-content-start">
						<div class="char_icon"><img src="assets/images/char_4.png" alt=""></div>
						<div class="char_content">
							<div class="char_title">Des Réductions</div>
							<div class="char_subtitle">jusqu'à 80%</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="new_arrivals pb-0">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="tabbed_container">
						<div class="tabs clearfix tabs-right">
							<ul class="clearfix float-left">
								<li class="active">En Soldes</li>
								<li>Nouveau</li>
							</ul>
							<div class="tabs_line"><span style="left: 0!important;"></span></div>
						</div>
						<div class="row">
							<div class="col-12" style="z-index:1;">

								<!-- En Soldes -->
								<div class="product_panel panel active">
									<div class="arrivals_slider slider">
									
										<c:if test="${produitsSolde != null}">
											<c:forEach items="${ produitsSolde }" var="p">
												<div class="arrivals_slider_item">
													<div class="border_active"></div>
													<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
														<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="${ p.getImage() }" alt=""></div>
														<div class="product_content">
															<div class="product_price">${ p.getProduitOptions().get(0).getPrix() } MAD</div>
															<div class="product_name"><div><a href="/produit?p=${ p.getIdProduit() }" data-toggle="tooltip" title="${ p.getDesignation() }">${ p.getDesignation().length() > 20 ? fn:substring(p.getDesignation(), 0, 28).concat("...") : p.getDesignation() }</a></div></div>
															
														</div>
														<ul class="product_marks">
															<li class="product_mark product_discount">${ p.getTauxReduction() }%</li>
														</ul>
													</div>
												</div>
											</c:forEach>
										</c:if>
										
										<c:if test="${produitsSolde == null}">
											<p>Aucun produit trouvé</p>
										</c:if>

									</div>
									<div class="arrivals_slider_dots_cover"></div>
								</div>

								<!-- Product Panel -->
								<div class="product_panel panel">
									<div class="arrivals_slider slider">

										<c:if test="${produitsNouveau != null}">
											<c:forEach items="${ produitsNouveau }" var="p">
												<div class="arrivals_slider_item">
													<div class="border_active"></div>
													<div class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
														<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="${ p.getImage() }" alt="produit"></div>
														<div class="product_content">
															<div class="product_price">${ p.getProduitOptions().get(0).getPrix() } MAD</div>
															<div class="product_name"><div><a href="/produit?p=${ p.getIdProduit() }" data-toggle="tooltip" title="${ p.getDesignation() }">${ p.getDesignation().length() > 20 ? fn:substring(p.getDesignation(), 0, 28).concat("...") : p.getDesignation() }</a></div></div>
															
														</div>
														<ul class="product_marks">
															<li class="product_mark product_new">new</li>
														</ul>
													</div>
												</div>
											</c:forEach>
										</c:if>
										
										<c:if test="${produitsNouveau == null}">
											<p>Aucun produit trouvé</p>
										</c:if>

									</div>
									<div class="arrivals_slider_dots_cover"></div>
								</div>

							</div>

						</div>
								
					</div>
				</div>
			</div>
		</div>		
	</div>

	
	<div class="popular_categories pt-0">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="popular_categories_content">
						<div class="popular_categories_title">Catégories Populaires</div>
						<div class="popular_categories_slider_nav">
							<div class="popular_categories_prev popular_categories_nav"><i class="fas fa-angle-left ml-auto"></i></div>
							<div class="popular_categories_next popular_categories_nav"><i class="fas fa-angle-right ml-auto"></i></div>
						</div>
					</div>
				</div>
				

				<div class="col-lg-9">
					<div class="popular_categories_slider_container">
						<div class="owl-carousel owl-theme popular_categories_slider">

							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image">
										<a href="/catalogue?nomProduit=&categorie=1">
											<img src="assets/images/cat-pc.png" alt="Ordinateurs et Laptops">
										</a>
									</div>
									<div class="popular_category_text">Ordinateurs et Laptops</div>
								</div>
							</div>
							
							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image">
										<a href="/catalogue?nomProduit=&categorie=2">
											<img src="assets/images/cat-cameras.png" alt="Appareils photo">
										</a>
									</div>
									<div class="popular_category_text">Appareils photo</div>
								</div>
							</div>

							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image">
										<a href="/catalogue?nomProduit=&categorie=3">
											<img src="assets/images/cat-smartphone.png" alt="Smartphones et Tablettes">
										</a>
									</div>
									<div class="popular_category_text">Smartphones et Tablettes</div>
								</div>
							</div>

							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image">
										<a href="/catalogue?nomProduit=&categorie=4">
											<img src="assets/images/cat-accessoires.png" alt="Accessories">
										</a>
									</div>
									<div class="popular_category_text">Accessories</div>
								</div>
							</div>
							
							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image">
										<a href="/catalogue?nomProduit=&categorie=5">
											<img src="assets/images/cat-consoles.png" alt="Jeux vidéos et Consoles">
										</a>
									</div>
									<div class="popular_category_text">Jeux vidéos et Consoles</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="brands">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="brands_slider_container">
						

						<div class="owl-carousel owl-theme brands_slider">
							
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="assets/images/brands_2.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="assets/images/brands_3.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="assets/images/brands_4.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="assets/images/brands_5.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="assets/images/brands_6.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="assets/images/brands_7.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="assets/images/brands_8.jpg" alt=""></div></div>

						</div>
						
						<div class="brands_nav brands_prev"><i class="fas fa-chevron-left"></i></div>
						<div class="brands_nav brands_next"><i class="fas fa-chevron-right"></i></div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->

	<%@ include file="includes/main/footer.jsp" %>
	
</div>



<script src="assets/plugins/slick-1.8.0/slick.js"></script>
<script src="assets/plugins/easing/easing.js"></script>
<script src="assets/js/custom.js"></script>
</body>

</html>