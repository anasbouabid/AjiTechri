<c:if test="${ empty cookie.utilisateurId.getValue() || empty cookie.utilisateurNom.getValue() || empty cookie.utilisateurPrenom.getValue()}">
		<%
			String site = new String("/login");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site); 
		%>
</c:if>

<%@ page import="com.ajitechri.dao.ProduitDao" %>
<%@ page import="com.ajitechri.models.Produit" %>
<%@ page import="com.ajitechri.models.ProduitOption" %>


<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="includes/main/head.jsp" %>

	<link rel="stylesheet" type="text/css" href="assets/styles/cart_styles.css">
	<link rel="stylesheet" type="text/css" href="assets/styles/cart_responsive.css">
	
	<title>Panier - AjiTechri</title>
</head>

<body>

<div class="super_container">
		
	<%@ include file="includes/main/header.jsp" %>
	

	<div class="cart_section">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="cart_container">
						<div class="cart_title">Panier</div>
						<div class="cart_items">
						
							<table class="table">
							  <thead>
							    <tr>
							      <th scope="col" class="h5">Image</th>
							      <th scope="col" class="h5">Nom</th>
							      <th scope="col" class="h5">Option</th>
							      <th scope="col" class="h5">Prix</th>
							      <th scope="col" class="h5">Action</th>
							    </tr>
							  </thead>
							  <tbody>
							  	<c:if test="${options != null}">
									<c:forEach items="${ options }" var="o">
									    <tr>
									      <% 
									      		DaoFactory daoFactory1 = DaoFactory.getInstance();
									      		ProduitOption o = (ProduitOption) pageContext.getAttribute("o");
									      		ProduitDao produitDao = daoFactory1.getProduitDao();
									      		
									      		Produit p = produitDao.getProduit(o.getIdProduit());
									      		
									      %>
									      	
									      <th scope="row"><div class="cart_item_image"><img height=75 width=auto src="<% out.println(p.getImage()); %>" alt=""></div></th>
									      <td class="h5 font-weight-normal">
									      	<% out.println(p); %>
									      </td>
									      <td class="h5 font-weight-normal">${ o.getNom() }</td>
									      <td class="h5 font-weight-normal">${ o.getPrix() }</td>
									      <td class="h5 font-weight-normal text-center">
									      	<form action="" method="POST">
									      		<input type="hidden" name="action" value="supprimer">
									      		<input type="text" name="idProduitOptionSupp" value="${ o.getIdProduitOption() }" hidden="true">
									      		
									      		<button style="cursor: pointer" class="border-0 bg-transparent" type="submit"> X </button>
									      	</form>
									      </td>
									    </tr>
								    </c:forEach>
							    </c:if>
							  </tbody>
							</table>
							
						</div>
						
						<!-- Order Total -->
						<div class="order_total">
							<div class="order_total_content text-md-right">
								<div class="order_total_title">Total:</div>
								<div class="order_total_amount">
									<c:if test="${options != null}">
										<% double total = 0.0; %>
										<c:forEach items="${ options }" var="o">
											<%
												ProduitOption o = (ProduitOption) pageContext.getAttribute("o");
												total += o.getPrix(); 
											%>
										</c:forEach>
										<%
											total *= 100;
											total = Math.round(total);
											total /= 100;
											out.println(total); 
										%> MAD
									</c:if>
								</div>
							</div>
						</div>

						<div class="cart_buttons">
							<a href="/valider-commande" class="button cart_button_checkout">Valider Commande</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	


	<%@ include file="includes/main/footer.jsp" %>
	
</div>


	<script src="assets/js/cart_custom.js"></script>
</body>

</html>