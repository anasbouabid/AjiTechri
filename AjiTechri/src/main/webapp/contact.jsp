<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="includes/main/head.jsp" %>

	<link rel="stylesheet" type="text/css" href="assets/styles/contact_styles.css">
	<link rel="stylesheet" type="text/css" href="assets/styles/contact_responsive.css">
	
	<title>Contact - AjiTechri</title>
</head>

<body>

<div class="super_container">
	
	<!-- Header -->
	
	<%@ include file="includes/main/header.jsp" %>
	

	<!-- Contact Info -->

	<div class="contact_info">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="contact_info_container d-flex flex-lg-row flex-column justify-content-between align-items-between">

						<div class="contact_info_item d-flex flex-row align-items-center justify-content-start">
							<div class="contact_info_image"><img src="assets/images/contact_1.png" alt=""></div>
							<div class="contact_info_content">
								<div class="contact_info_title">Téléphone</div>
								<div class="contact_info_text">+212 645 23 77 40</div>
							</div>
						</div>

						<div class="contact_info_item d-flex flex-row align-items-center justify-content-start">
							<div class="contact_info_image"><img src="assets/images/contact_2.png" alt=""></div>
							<div class="contact_info_content">
								<div class="contact_info_title">Adresse E-mail</div>
								<div class="contact_info_text">contact@ajitechri.com</div>
							</div>
						</div>

						<div class="contact_info_item d-flex flex-row align-items-center justify-content-start">
							<div class="contact_info_image"><img src="assets/images/contact_3.png" alt=""></div>
							<div class="contact_info_content">
								<div class="contact_info_title">Addresse</div>
								<div class="contact_info_text">Mabrouka, Settat, Maroc, Afrique, Terre, Galaxie de la Voie lactée</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Contact Form -->

	<div class="contact_form">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="contact_form_container">
						<div class="contact_form_title">Entrer en contact</div>

						<form action="" method="POST" id="contact_form">
							<div class="contact_form_inputs d-flex flex-md-row flex-column justify-content-between align-items-between">
								<input type="text" id="contact_form_name" class="contact_form_name input_field" placeholder="Nom" required="required" name="nom" data-error="Le nom est requis.">
								<input type="text" id="contact_form_email" class="contact_form_email input_field" placeholder="Email" required="required" name="email" data-error="L'email est requis.">
								<input type="text" id="contact_form_phone" class="contact_form_phone input_field" placeholder="Numero Téléphone" required="required" name="tele">
							</div>
							<div class="contact_form_text">
								<textarea id="contact_form_message" class="text_field contact_form_message" name="message" rows="4" placeholder="Message" required="required" data-error="S'il vous plaît, écrivez-nous un message."></textarea>
							</div>
							<div class="contact_form_button">
								<button type="submit" class="button contact_submit_button">Envoyer</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
		<div class="panel"></div>
	</div>

	<!-- Footer -->
	<%@ include file="includes/main/footer.jsp" %>
	
	
</div>


<script src="assets/js/contact_custom.js"></script>
</body>

</html>