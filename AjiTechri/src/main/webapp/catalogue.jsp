<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="includes/main/head.jsp" %>

	<link rel="stylesheet" type="text/css" href="assets/styles/shop_styles.css">
	<link rel="stylesheet" type="text/css" href="assets/styles/shop_responsive.css">
	
	<title>Catalogue - AjiTechri</title>
</head>

<body>

<div class="super_container">
	
	
	<%@ include file="includes/main/header.jsp" %>


	<div class="shop">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">

					<form action="" method="GET">
						<div class="shop_sidebar">
							<div class="sidebar_section">
								<div class="sidebar_title">Nom:</div>
								<ul class="sidebar_categories mt-2 mb-4 form-group">
									<li class="brand"><input class="form-control text-dark" type="text" name="nomProduit" placeholder="Nom Produit" value="${ param.nomProduit != null ? param.nomProduit : '' }"></li>
								</ul>
							</div>
							<div class="sidebar_section">
								<div class="sidebar_title">Catégories:</div>
								<ul class="sidebar_categories mt-2 mb-4">
									
									<c:if test="${categories != null}">
										<c:forEach items="${ categories }" var="c">
											<li class="brand"><input id="cat-${ c.getIdCategorie() }" type="radio" name="categorie" value="${ c.getIdCategorie() }"><label for="cat-${ c.getIdCategorie() }">${ c }</label></li>
										</c:forEach>
									</c:if>
									
								</ul>
							</div>
							
							<div class="sidebar_section">
								<div class="sidebar_title">Marques:</div>
								<ul class="brands_list mt-2 mb-4">
									<c:if test="${marques != null}">
										<c:forEach items="${ marques }" var="m">
											<li class="brand"><input id="marque-${ m.getIdMarque() }" type="radio" name="marque" value="${ m.getIdMarque() }"><label for="marque-${ m.getIdMarque() }">${ m }</label></li>
										</c:forEach>
									</c:if>
								</ul>
							</div>
							
							<div class="mt-4">
								<button type="submit" style="cursor: pointer" class="btn btn-primary">Rechercher</button>
							</div>
						</div>
						
					</form>

				</div>

				<div class="col-lg-9">
					
					<!-- Shop Content -->

					<div class="shop_content">
						<div class="shop_bar clearfix">
							<div class="shop_product_count"><span>${ produits != null ? produits.size() : "0" }</span> produits trouvés</div>
							
						</div>

						<div class="product_grid">
							<div class="product_grid_border"></div>

							<c:if test="${produits != null}">
								<c:forEach items="${ produits }" var="p">
									<div class="product_item is_new">
										<div class="product_border"></div>
										<div class="product_image d-flex flex-column align-items-center justify-content-center"><img src="${ p.getImage() }" alt="produit"></div>
										<div class="product_content">
											<div class="product_price">${ p.getProduitOptions().get(0).getPrix() } MAD</div>
											<div class="product_name"><div><a href="/produit?p=${ p.getIdProduit() }" tabindex="0" data-toggle="tooltip" title="${ p.getDesignation() }">${ p.getDesignation().length() > 20 ? fn:substring(p.getDesignation(), 0, 18).concat("...") : p.getDesignation() }</a></div></div>
										</div>
									</div>
								</c:forEach>
							</c:if>

						</div>


					</div>

				</div>
			</div>
		</div>
	</div>

	<%@ include file="includes/main/footer.jsp" %>
	
	
</div>


	<script src="assets/plugins/easing/easing.js"></script>
	<script src="assets/plugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="assets/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
	<script src="assets/plugins/parallax-js-master/parallax.min.js"></script>
	<script src="assets/js/shop_custom.js"></script>
</body>

</html>