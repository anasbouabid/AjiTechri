<c:if test="${ empty cookie.utilisateurId.getValue() || empty cookie.utilisateurNom.getValue() || empty cookie.utilisateurPrenom.getValue()}">
		<%
			String site = new String("/login");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site); 
		%>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="includes/main/head.jsp" %>

	<link rel="stylesheet" type="text/css" href="assets/styles/cart_styles.css">
	<link rel="stylesheet" type="text/css" href="assets/styles/cart_responsive.css">
	
	<title>Mes Commandes - AjiTechri</title>
</head>

<body>

<div class="super_container">
		
	<%@ include file="includes/main/header.jsp" %>
	

	<div class="cart_section">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="cart_container">
						<div class="cart_title">Mes Commandes</div>
						<div class="cart_items">
						
							<table class="table">
							  <thead>
							    <tr>
							      <th scope="col" class="h5">Date</th>
							      <th scope="col" class="h5">Total</th>
							      <th scope="col" class="h5">État</th>
							    </tr>
							  </thead>
							  <tbody>
							  	<c:if test="${commandes != null}">
									<c:forEach items="${ commandes }" var="c">
									    <tr>
									      <td class="h5 font-weight-normal">${ c.getDateCommande() }</td>
									      <td class="h5 font-weight-normal">${ c.getTotal() }</td>
									      <td class="h5 font-weight-normal">${ c.getEtat() }</td>
									    </tr>
								    </c:forEach>
							    </c:if>
							  </tbody>
							</table>
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