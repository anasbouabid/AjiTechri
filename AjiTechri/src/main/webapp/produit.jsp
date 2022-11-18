<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="includes/main/head.jsp" %>

	<link rel="stylesheet" type="text/css" href="assets/styles/product_styles.css">
	<link rel="stylesheet" type="text/css" href="assets/styles/product_responsive.css">
	
	<title>${ produit.getDesignation() } - AjiTechri</title>

</head>

<body>

<div class="super_container">
	
	<%@ include file="includes/main/header.jsp" %>

	<!-- Single Product -->
	<div class="single_product">
		<div class="container">
			<div class="row">


				<div class="col-lg-7 order-lg-1 order-1">
					<div class="image_selected"><img src="${ produit.getImage() }" alt="${ produit.getDesignation() }"></div>
				</div>

				<!-- Description -->
				<div class="col-lg-5 order-lg-1 order-3">
					<div class="product_description">
						<div class="product_category">${ produit.getCategorie().getNom() }</div>
						<div class="product_name">${ produit.getDesignation() }</div>
						<div class="product_text"><p>${ produit.getDescription() }</p></div>
						<div class="order_info d-flex flex-row">
							<form action="" method="POST">
								<div class="clearfix" style="z-index: 1000;">
								
									<h4 class="mb-2">Les Options:</h4>
									<c:if test="${produit.getProduitOptions() != null}">
										<c:forEach items="${ produit.getProduitOptions() }" var="o">
											<div class="">
												<input ${ o.getStock() == 0 ? "disabled" : "" } type="radio" id="option-${ o.getIdProduitOption() }" name="option" value="${ o.getIdProduitOption() }" required>
												<label class='${ o.getStock() == 0 ? "text-muted" : "" }' for="option-${ o.getIdProduitOption() }">${ o.getNom() } / ${ o.getPrix() } MAD</label>
											</div>
										</c:forEach>
									</c:if>
									
								</div>

								<div class="button_container">
									<button type="submit" class="button cart_button">Ajouter au Panier</button>
									<div class="product_fav"><i class="fas fa-heart"></i></div>
								</div>
								
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<%@ include file="includes/main/footer.jsp" %>
	
	
</div>


	<script src="assets/js/product_custom.js"></script>
</body>

</html>