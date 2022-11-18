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
	
	<title>Profile - AjiTechri</title>
	
	<style>
		.form-control{
			color: #343a40!important;;
		}
	</style>
</head>

<body>

<div class="super_container">
		
	<%@ include file="includes/main/header.jsp" %>
	

	<div class="cart_section">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="container ">
						<div style="border: 1px solid #d3d3d3; box-shadow: 0px 3px 11px #d3d3d3;" class="p-3 mb-5 rounded">
							<h3 class="mb-4">Profile</h3>
							
							<form method="POST" action="/profile" enctype="multipart/form-data">
								<div class="form-group">
									<input name="action" type="hidden" value="modifierInfo" required>
									<input id="idUtilisateur" class="form-control mb-4" type="text" name="idUtilisateur" value="${ utilisateur.getIdUtilisateur() }" hidden="true" required>
								
									<div class="mb-4 text-center">
										<img width="150" class="rounded" src="${ utilisateur.getPhoto() != null ? utilisateur.getPhoto(): 'uploads/avatars/default.png' }" alt="utilisateur">
									</div>
									
									
									<input id="nom" class="form-control mb-4" type="text" placeholder="Nom" name="nom" value="${ utilisateur.getNom() }" required>
									<input id="prenom" class="form-control mb-4" type="text" placeholder="Prénom" name="prenom" value="${ utilisateur.getPrenom() }" required>
									<input id="email" class="form-control mb-4" type="email" placeholder="Email" name="email" value="${ utilisateur.getEmail() }" required>
									<input id="tel" class="form-control mb-4" type="number" placeholder="Numéro téléphone" name="tel" value="${ utilisateur.getTel() }" required>
									<input id="dateNaissance" class="form-control mb-4" type="date" placeholder="Date Naissance" name="dateNaissance" value="${ utilisateur.getDateNaissance() }" required>
									
									<select id="sexe" class="form-control mb-4 ml-0" name="sexe" required >
                                        <option value="">Sexe</option>
                                        <option ${ utilisateur.getSexe() == "Homme" ? "selected" : "" } value="Homme">Homme</option>
                                        <option ${ utilisateur.getSexe() == "Femme" ? "selected" : "" } value="Femme">Femme</option>
                                    </select>
									
									<input id="adresse" class="form-control mb-4" type="text" placeholder="Adresse" name="adresse" value="${ utilisateur.getAdresse() }" required>
									<input id="ville" class="form-control mb-4" type="text" placeholder="Ville" name="ville" value="${ utilisateur.getVille() }" required>
									<input id="codePostal" class="form-control mb-4" type="number" placeholder="Code Postal" name="codePostal" value="${ utilisateur.getCodePostal() }" required>
									
									<select id="pays" class="form-control mb-4 ml-0" name="pays" required>
	                                    <option value="">Pays</option>
	                                                   
	                                    <option ${ utilisateur.getPays() == "Afghanistan" ? "selected" : "" } value="Afghanistan">Afghanistan </option>
										<option ${ utilisateur.getPays() == "Afrique_Centrale" ? "selected" : "" } value="Afrique_Centrale">Afrique_Centrale </option>
										<option ${ utilisateur.getPays() == "Afrique_du_Sud" ? "selected" : "" } value="Afrique_du_sud">Afrique_du_Sud </option>
										<option ${ utilisateur.getPays() == "Albanie" ? "selected" : "" } value="Albanie">Albanie </option>
										<option ${ utilisateur.getPays() == "Algerie" ? "selected" : "" } value="Algerie">Algerie </option>
										<option ${ utilisateur.getPays() == "Allemagne" ? "selected" : "" } value="Allemagne">Allemagne </option>
										<option ${ utilisateur.getPays() == "Andorre" ? "selected" : "" } value="Andorre">Andorre </option>
										<option ${ utilisateur.getPays() == "Angola" ? "selected" : "" } value="Angola">Angola </option>
										<option ${ utilisateur.getPays() == "Anguilla" ? "selected" : "" } value="Anguilla">Anguilla </option>
										<option ${ utilisateur.getPays() == "Arabie_Saoudite" ? "selected" : "" } value="Arabie_Saoudite">Arabie_Saoudite </option>
										<option ${ utilisateur.getPays() == "Argentine" ? "selected" : "" } value="Argentine">Argentine </option>
										<option ${ utilisateur.getPays() == "Armenie" ? "selected" : "" } value="Armenie">Armenie </option>
										<option ${ utilisateur.getPays() == "Australie" ? "selected" : "" } value="Australie">Australie </option>
										<option ${ utilisateur.getPays() == "Autriche" ? "selected" : "" } value="Autriche">Autriche </option>
										<option ${ utilisateur.getPays() == "Azerbaidjan" ? "selected" : "" } value="Azerbaidjan">Azerbaidjan </option>
										                          																									
										<option ${ utilisateur.getPays() == "Bahamas" ? "selected" : "" } value="Bahamas">Bahamas </option>
										<option ${ utilisateur.getPays() == "Bangladesh" ? "selected" : "" } value="Bangladesh">Bangladesh </option>
										<option ${ utilisateur.getPays() == "Barbade" ? "selected" : "" } value="Barbade">Barbade </option>
										<option ${ utilisateur.getPays() == "Bahrein" ? "selected" : "" } value="Bahrein">Bahrein </option>
										<option ${ utilisateur.getPays() == "Belgique" ? "selected" : "" } value="Belgique">Belgique </option>
										<option ${ utilisateur.getPays() == "Belize" ? "selected" : "" } value="Belize">Belize </option>
										<option ${ utilisateur.getPays() == "Benin" ? "selected" : "" } value="Benin">Benin </option>
										<option ${ utilisateur.getPays() == "Bermudes" ? "selected" : "" } value="Bermudes">Bermudes </option>
										<option ${ utilisateur.getPays() == "Bielorussie" ? "selected" : "" } value="Bielorussie">Bielorussie </option>
										<option ${ utilisateur.getPays() == "Bolivie" ? "selected" : "" } value="Bolivie">Bolivie </option>
										<option ${ utilisateur.getPays() == "Botswana" ? "selected" : "" } value="Botswana">Botswana </option>
										<option ${ utilisateur.getPays() == "Bhoutan" ? "selected" : "" } value="Bhoutan">Bhoutan </option>
										<option ${ utilisateur.getPays() == "Boznie_Herzegovine" ? "selected" : "" } value="Boznie_Herzegovine">Boznie_Herzegovine </option>
										<option ${ utilisateur.getPays() == "Bresil" ? "selected" : "" } value="Bresil">Bresil </option>
										<option ${ utilisateur.getPays() == "Brunei" ? "selected" : "" } value="Brunei">Brunei </option>
										<option ${ utilisateur.getPays() == "Bulgarie" ? "selected" : "" } value="Bulgarie">Bulgarie </option>
										<option ${ utilisateur.getPays() == "Burkina_Faso" ? "selected" : "" } value="Burkina_Faso">Burkina_Faso </option>
										<option ${ utilisateur.getPays() == "Burundi" ? "selected" : "" } value="Burundi">Burundi </option>
										                          																									
										<option ${ utilisateur.getPays() == "Caiman" ? "selected" : "" } value="Caiman">Caiman </option>
										<option ${ utilisateur.getPays() == "Cambodge" ? "selected" : "" } value="Cambodge">Cambodge </option>
										<option ${ utilisateur.getPays() == "Cameroun" ? "selected" : "" } value="Cameroun">Cameroun </option>
										<option ${ utilisateur.getPays() == "Canada" ? "selected" : "" } value="Canada">Canada </option>
										<option ${ utilisateur.getPays() == "Canaries" ? "selected" : "" } value="Canaries">Canaries </option>
										<option ${ utilisateur.getPays() == "Cap_Vert" ? "selected" : "" } value="Cap_vert">Cap_Vert </option>
										<option ${ utilisateur.getPays() == "Chili" ? "selected" : "" } value="Chili">Chili </option>
										<option ${ utilisateur.getPays() == "Chine" ? "selected" : "" } value="Chine">Chine </option>
										<option ${ utilisateur.getPays() == "Chypre" ? "selected" : "" } value="Chypre">Chypre </option>
										<option ${ utilisateur.getPays() == "Colombie" ? "selected" : "" } value="Colombie">Colombie </option>
										<option ${ utilisateur.getPays() == "Colombie" ? "selected" : "" } value="Comores">Colombie </option>
										<option ${ utilisateur.getPays() == "Congo" ? "selected" : "" } value="Congo">Congo </option>
										<option ${ utilisateur.getPays() == "Congo_democratique" ? "selected" : "" } value="Congo_democratique">Congo_democratique </option>
										<option ${ utilisateur.getPays() == "Cook" ? "selected" : "" } value="Cook">Cook </option>
										<option ${ utilisateur.getPays() == "Coree_du_Nord" ? "selected" : "" } value="Coree_du_Nord">Coree_du_Nord </option>
										<option ${ utilisateur.getPays() == "Coree_du_Sud" ? "selected" : "" } value="Coree_du_Sud">Coree_du_Sud </option>
										<option ${ utilisateur.getPays() == "Costa_Rica" ? "selected" : "" } value="Costa_Rica">Costa_Rica </option>
										<option ${ utilisateur.getPays() == "Cote_d_Ivoire" ? "selected" : "" } value="Cote_d_Ivoire">Côte_d_Ivoire </option>
										<option ${ utilisateur.getPays() == "Croatie" ? "selected" : "" } value="Croatie">Croatie </option>
										<option ${ utilisateur.getPays() == "Cuba" ? "selected" : "" } value="Cuba">Cuba </option>
										                          																									
										<option ${ utilisateur.getPays() == "Danemark" ? "selected" : "" } value="Danemark">Danemark </option>
										<option ${ utilisateur.getPays() == "Djibouti" ? "selected" : "" } value="Djibouti">Djibouti </option>
										<option ${ utilisateur.getPays() == "Dominique" ? "selected" : "" } value="Dominique">Dominique </option>
										                          																									
										<option ${ utilisateur.getPays() == "Egypte" ? "selected" : "" } value="Egypte">Egypte </option>
										<option ${ utilisateur.getPays() == "Emirats_Arabes_Unis" ? "selected" : "" } value="Emirats_Arabes_Unis">Emirats_Arabes_Unis </option>
										<option ${ utilisateur.getPays() == "Equateur" ? "selected" : "" } value="Equateur">Equateur </option>
										<option ${ utilisateur.getPays() == "Erythree" ? "selected" : "" } value="Erythree">Erythree </option>
										<option ${ utilisateur.getPays() == "Espagne" ? "selected" : "" } value="Espagne">Espagne </option>
										<option ${ utilisateur.getPays() == "Estonie" ? "selected" : "" } value="Estonie">Estonie </option>
										<option ${ utilisateur.getPays() == "Etats_Unis" ? "selected" : "" } value="Etats_Unis">Etats_Unis </option>
										<option ${ utilisateur.getPays() == "Ethiopie" ? "selected" : "" } value="Ethiopie">Ethiopie </option>
										                          																									
										<option ${ utilisateur.getPays() == "Falkland" ? "selected" : "" } value="Falkland">Falkland </option>
										<option ${ utilisateur.getPays() == "Feroe" ? "selected" : "" } value="Feroe">Feroe </option>
										<option ${ utilisateur.getPays() == "Fidji" ? "selected" : "" } value="Fidji">Fidji </option>
										<option ${ utilisateur.getPays() == "Finlande" ? "selected" : "" } value="Finlande">Finlande </option>
										<option ${ utilisateur.getPays() == "France" ? "selected" : "" } value="France">France </option>
										                          																									
										<option ${ utilisateur.getPays() == "Gabon" ? "selected" : "" } value="Gabon">Gabon </option>
										<option ${ utilisateur.getPays() == "Gambie" ? "selected" : "" } value="Gambie">Gambie </option>
										<option ${ utilisateur.getPays() == "Georgie" ? "selected" : "" } value="Georgie">Georgie </option>
										<option ${ utilisateur.getPays() == "Ghana" ? "selected" : "" } value="Ghana">Ghana </option>
										<option ${ utilisateur.getPays() == "Gibraltar" ? "selected" : "" } value="Gibraltar">Gibraltar </option>
										<option ${ utilisateur.getPays() == "Grece" ? "selected" : "" } value="Grece">Grece </option>
										<option ${ utilisateur.getPays() == "Grenade" ? "selected" : "" } value="Grenade">Grenade </option>
										<option ${ utilisateur.getPays() == "Groenland" ? "selected" : "" } value="Groenland">Groenland </option>
										<option ${ utilisateur.getPays() == "Guadeloupe" ? "selected" : "" } value="Guadeloupe">Guadeloupe </option>
										<option ${ utilisateur.getPays() == "Guam" ? "selected" : "" } value="Guam">Guam </option>
										<option ${ utilisateur.getPays() == "Guatemala</option>" ? "selected" : "" } value="Guatemala">Guatemala</option>
										<option ${ utilisateur.getPays() == "Guernesey" ? "selected" : "" } value="Guernesey">Guernesey </option>
										<option ${ utilisateur.getPays() == "Guinee" ? "selected" : "" } value="Guinee">Guinee </option>
										<option ${ utilisateur.getPays() == "Guinee_Bissau" ? "selected" : "" } value="Guinee_Bissau">Guinee_Bissau </option>
										<option ${ utilisateur.getPays() == "Guinee_Equatoriale" ? "selected" : "" } value="Guinee equatoriale">Guinee_Equatoriale </option>
										<option ${ utilisateur.getPays() == "Guyana" ? "selected" : "" } value="Guyana">Guyana </option>
										<option ${ utilisateur.getPays() == "Guyane_Francaise" ? "selected" : "" } value="Guyane_Francaise ">Guyane_Francaise </option>
										                          																									
										<option ${ utilisateur.getPays() == "Haiti" ? "selected" : "" } value="Haiti">Haiti </option>
										<option ${ utilisateur.getPays() == "Hawaii" ? "selected" : "" } value="Hawaii">Hawaii </option>
										<option ${ utilisateur.getPays() == "Honduras" ? "selected" : "" } value="Honduras">Honduras </option>
										<option ${ utilisateur.getPays() == "Hong_Kong" ? "selected" : "" } value="Hong_Kong">Hong_Kong </option>
										<option ${ utilisateur.getPays() == "Hongrie" ? "selected" : "" } value="Hongrie">Hongrie </option>
										                          																									
										<option ${ utilisateur.getPays() == "Inde" ? "selected" : "" } value="Inde">Inde </option>
										<option ${ utilisateur.getPays() == "Indonesie" ? "selected" : "" } value="Indonesie">Indonesie </option>
										<option ${ utilisateur.getPays() == "Iran" ? "selected" : "" } value="Iran">Iran </option>
										<option ${ utilisateur.getPays() == "Iraq" ? "selected" : "" } value="Iraq">Iraq </option>
										<option ${ utilisateur.getPays() == "Irlande" ? "selected" : "" } value="Irlande">Irlande </option>
										<option ${ utilisateur.getPays() == "Islande" ? "selected" : "" } value="Islande">Islande </option>
										<option ${ utilisateur.getPays() == "Israel" ? "selected" : "" } value="Israel">Israel </option>
										<option ${ utilisateur.getPays() == "italie" ? "selected" : "" } value="Italie">italie </option>
										                          																									
										<option ${ utilisateur.getPays() == "Jamaique" ? "selected" : "" } value="Jamaique">Jamaique </option>
										<option ${ utilisateur.getPays() == "Jan Mayen" ? "selected" : "" } value="Jan Mayen">Jan Mayen </option>
										<option ${ utilisateur.getPays() == "Japon" ? "selected" : "" } value="Japon">Japon </option>
										<option ${ utilisateur.getPays() == "Jersey" ? "selected" : "" } value="Jersey">Jersey </option>
										<option ${ utilisateur.getPays() == "Jordanie" ? "selected" : "" } value="Jordanie">Jordanie </option>
										                          																									
										<option ${ utilisateur.getPays() == "Kazakhstan" ? "selected" : "" } value="Kazakhstan">Kazakhstan </option>
										<option ${ utilisateur.getPays() == "Kenya" ? "selected" : "" } value="Kenya">Kenya </option>
										<option ${ utilisateur.getPays() == "Kirghizistan" ? "selected" : "" } value="Kirghizstan">Kirghizistan </option>
										<option ${ utilisateur.getPays() == "Kiribati" ? "selected" : "" } value="Kiribati">Kiribati </option>
										<option ${ utilisateur.getPays() == "Koweit" ? "selected" : "" } value="Koweit">Koweit </option>
										                          																									
										<option ${ utilisateur.getPays() == "Laos" ? "selected" : "" } value="Laos">Laos </option>
										<option ${ utilisateur.getPays() == "Lesotho" ? "selected" : "" } value="Lesotho">Lesotho </option>
										<option ${ utilisateur.getPays() == "Lettonie" ? "selected" : "" } value="Lettonie">Lettonie </option>
										<option ${ utilisateur.getPays() == "Liban" ? "selected" : "" } value="Liban">Liban </option>
										<option ${ utilisateur.getPays() == "Liberia" ? "selected" : "" } value="Liberia">Liberia </option>
										<option ${ utilisateur.getPays() == "Liechtenstein" ? "selected" : "" } value="Liechtenstein">Liechtenstein </option>
										<option ${ utilisateur.getPays() == "Lituanie" ? "selected" : "" } value="Lituanie">Lituanie </option>
										<option ${ utilisateur.getPays() == "Luxembourg" ? "selected" : "" } value="Luxembourg">Luxembourg </option>
										<option ${ utilisateur.getPays() == "Lybie" ? "selected" : "" } value="Lybie">Lybie </option>
										                          																									
										<option ${ utilisateur.getPays() == "Macao" ? "selected" : "" } value="Macao">Macao </option>
										<option ${ utilisateur.getPays() == "Macedoine" ? "selected" : "" } value="Macedoine">Macedoine </option>
										<option ${ utilisateur.getPays() == "Madagascar" ? "selected" : "" } value="Madagascar">Madagascar </option>
										<option ${ utilisateur.getPays() == "Madere" ? "selected" : "" } value="Madère">Madère </option>
										<option ${ utilisateur.getPays() == "Malaisie" ? "selected" : "" } value="Malaisie">Malaisie </option>
										<option ${ utilisateur.getPays() == "Malawi" ? "selected" : "" } value="Malawi">Malawi </option>
										<option ${ utilisateur.getPays() == "Maldives" ? "selected" : "" } value="Maldives">Maldives </option>
										<option ${ utilisateur.getPays() == "Mali" ? "selected" : "" } value="Mali">Mali </option>
										<option ${ utilisateur.getPays() == "Malte" ? "selected" : "" } value="Malte">Malte </option>
										<option ${ utilisateur.getPays() == "Man" ? "selected" : "" } value="Man">Man </option>
										<option ${ utilisateur.getPays() == "Mariannes du Nord" ? "selected" : "" } value="Mariannes du Nord">Mariannes du Nord </option>
										<option ${ utilisateur.getPays() == "Maroc" ? "selected" : "" } value="Maroc">Maroc </option>
										<option ${ utilisateur.getPays() == "Marshall" ? "selected" : "" } value="Marshall">Marshall </option>
										<option ${ utilisateur.getPays() == "Martinique" ? "selected" : "" } value="Martinique">Martinique </option>
										<option ${ utilisateur.getPays() == "Maurice" ? "selected" : "" } value="Maurice">Maurice </option>
										<option ${ utilisateur.getPays() == "Mauritanie" ? "selected" : "" } value="Mauritanie">Mauritanie </option>
										<option ${ utilisateur.getPays() == "Mayotte" ? "selected" : "" } value="Mayotte">Mayotte </option>
										<option ${ utilisateur.getPays() == "Mexique" ? "selected" : "" } value="Mexique">Mexique </option>
										<option ${ utilisateur.getPays() == "Micronesie" ? "selected" : "" } value="Micronesie">Micronesie </option>
										<option ${ utilisateur.getPays() == "Midway" ? "selected" : "" } value="Midway">Midway </option>
										<option ${ utilisateur.getPays() == "Moldavie" ? "selected" : "" } value="Moldavie">Moldavie </option>
										<option ${ utilisateur.getPays() == "Monaco" ? "selected" : "" } value="Monaco">Monaco </option>
										<option ${ utilisateur.getPays() == "Mongolie" ? "selected" : "" } value="Mongolie">Mongolie </option>
										<option ${ utilisateur.getPays() == "Montserrat" ? "selected" : "" } value="Montserrat">Montserrat </option>
										<option ${ utilisateur.getPays() == "Mozambique" ? "selected" : "" } value="Mozambique">Mozambique </option>
										                          																									
										<option ${ utilisateur.getPays() == "Namibie" ? "selected" : "" } value="Namibie">Namibie </option>
										<option ${ utilisateur.getPays() == "Nauru" ? "selected" : "" } value="Nauru">Nauru </option>
										<option ${ utilisateur.getPays() == "Nepal" ? "selected" : "" } value="Nepal">Nepal </option>
										<option ${ utilisateur.getPays() == "Nicaragua" ? "selected" : "" } value="Nicaragua">Nicaragua </option>
										<option ${ utilisateur.getPays() == "Niger" ? "selected" : "" } value="Niger">Niger </option>
										<option ${ utilisateur.getPays() == "Nigeria" ? "selected" : "" } value="Nigeria">Nigeria </option>
										<option ${ utilisateur.getPays() == "Niue" ? "selected" : "" } value="Niue">Niue </option>
										<option ${ utilisateur.getPays() == "Norfolk" ? "selected" : "" } value="Norfolk">Norfolk </option>
										<option ${ utilisateur.getPays() == "Norvege" ? "selected" : "" } value="Norvege">Norvege </option>
										<option ${ utilisateur.getPays() == "Nouvelle_Caledonie" ? "selected" : "" } value="Nouvelle_Caledonie">Nouvelle_Caledonie </option>
										<option ${ utilisateur.getPays() == "Nouvelle_Zelande" ? "selected" : "" } value="Nouvelle_Zelande">Nouvelle_Zelande </option>
										                          																									
										<option ${ utilisateur.getPays() == "Oman" ? "selected" : "" } value="Oman">Oman </option>
										<option ${ utilisateur.getPays() == "Ouganda" ? "selected" : "" } value="Ouganda">Ouganda </option>
										<option ${ utilisateur.getPays() == "Ouzbekistan" ? "selected" : "" } value="Ouzbekistan">Ouzbekistan </option>
										                          																									
										<option ${ utilisateur.getPays() == "Pakistan" ? "selected" : "" } value="Pakistan">Pakistan </option>
										<option ${ utilisateur.getPays() == "Palau" ? "selected" : "" } value="Palau">Palau </option>
										<option ${ utilisateur.getPays() == "Palestine" ? "selected" : "" } value="Palestine">Palestine </option>
										<option ${ utilisateur.getPays() == "Panama" ? "selected" : "" } value="Panama">Panama </option>
										<option ${ utilisateur.getPays() == "Papouasie_Nouvelle_Guinee" ? "selected" : "" } value="Papouasie_Nouvelle_Guinee">Papouasie_Nouvelle_Guinee </option>
										<option ${ utilisateur.getPays() == "Paraguay" ? "selected" : "" } value="Paraguay">Paraguay </option>
										<option ${ utilisateur.getPays() == "Pays_Bas" ? "selected" : "" } value="Pays_Bas">Pays_Bas </option>
										<option ${ utilisateur.getPays() == "Perou" ? "selected" : "" } value="Perou">Perou </option>
										<option ${ utilisateur.getPays() == "Philippines" ? "selected" : "" } value="Philippines">Philippines </option>
										<option ${ utilisateur.getPays() == "Pologne" ? "selected" : "" } value="Pologne">Pologne </option>
										<option ${ utilisateur.getPays() == "Polynesie" ? "selected" : "" } value="Polynesie">Polynesie </option>
										<option ${ utilisateur.getPays() == "Porto_Rico" ? "selected" : "" } value="Porto_Rico">Porto_Rico </option>
										<option ${ utilisateur.getPays() == "Portugal" ? "selected" : "" } value="Portugal">Portugal </option>
										                          																									
										<option ${ utilisateur.getPays() == "Qatar" ? "selected" : "" } value="Qatar">Qatar </option>
										                          																									
										<option ${ utilisateur.getPays() == "Republique_Dominicaine" ? "selected" : "" } value="Republique_Dominicaine">Republique_Dominicaine </option>
										<option ${ utilisateur.getPays() == "Republique_Tcheque" ? "selected" : "" } value="Republique_Tcheque">Republique_Tcheque </option>
										<option ${ utilisateur.getPays() == "Reunion" ? "selected" : "" } value="Reunion">Reunion </option>
										<option ${ utilisateur.getPays() == "Roumanie" ? "selected" : "" } value="Roumanie">Roumanie </option>
										<option ${ utilisateur.getPays() == "Royaume_Uni" ? "selected" : "" } value="Royaume_Uni">Royaume_Uni </option>
										<option ${ utilisateur.getPays() == "Russie" ? "selected" : "" } value="Russie">Russie </option>
										<option ${ utilisateur.getPays() == "Rwanda" ? "selected" : "" } value="Rwanda">Rwanda </option>
										                          																									
										<option ${ utilisateur.getPays() == "Sahara Occidental" ? "selected" : "" } value="Sahara Occidental">Sahara Occidental </option>
										<option ${ utilisateur.getPays() == "Sainte_Lucie" ? "selected" : "" } value="Sainte_Lucie">Sainte_Lucie </option>
										<option ${ utilisateur.getPays() == "Saint_Marin" ? "selected" : "" } value="Saint_Marin">Saint_Marin </option>
										<option ${ utilisateur.getPays() == "Salomon" ? "selected" : "" } value="Salomon">Salomon </option>
										<option ${ utilisateur.getPays() == "Salvador" ? "selected" : "" } value="Salvador">Salvador </option>
										<option ${ utilisateur.getPays() == "Samoa_Occidentales</option>" ? "selected" : "" } value="Samoa_Occidentales">Samoa_Occidentales</option>
										<option ${ utilisateur.getPays() == "Samoa_Americaine" ? "selected" : "" } value="Samoa_Americaine">Samoa_Americaine </option>
										<option ${ utilisateur.getPays() == "Sao_Tome_et_Principe" ? "selected" : "" } value="Sao_Tome_et_Principe">Sao_Tome_et_Principe </option>
										<option ${ utilisateur.getPays() == "Senegal" ? "selected" : "" } value="Senegal">Senegal </option>
										<option ${ utilisateur.getPays() == "Seychelles" ? "selected" : "" } value="Seychelles">Seychelles </option>
										<option ${ utilisateur.getPays() == "Sierra Leone" ? "selected" : "" } value="Sierra Leone">Sierra Leone </option>
										<option ${ utilisateur.getPays() == "Singapour" ? "selected" : "" } value="Singapour">Singapour </option>
										<option ${ utilisateur.getPays() == "Slovaquie" ? "selected" : "" } value="Slovaquie">Slovaquie </option>
										<option ${ utilisateur.getPays() == "Slovenie</option>" ? "selected" : "" } value="Slovenie">Slovenie</option>
										<option ${ utilisateur.getPays() == "Somalie" ? "selected" : "" } value="Somalie">Somalie </option>
										<option ${ utilisateur.getPays() == "Soudan" ? "selected" : "" } value="Soudan">Soudan </option>
										<option ${ utilisateur.getPays() == "Sri_Lanka" ? "selected" : "" } value="Sri_Lanka">Sri_Lanka </option>
										<option ${ utilisateur.getPays() == "Suede" ? "selected" : "" } value="Suede">Suede </option>
										<option ${ utilisateur.getPays() == "Suisse" ? "selected" : "" } value="Suisse">Suisse </option>
										<option ${ utilisateur.getPays() == "Surinam" ? "selected" : "" } value="Surinam">Surinam </option>
										<option ${ utilisateur.getPays() == "Swaziland" ? "selected" : "" } value="Swaziland">Swaziland </option>
										<option ${ utilisateur.getPays() == "Syrie" ? "selected" : "" } value="Syrie">Syrie </option>
										                          																									
										<option ${ utilisateur.getPays() == "Tadjikistan" ? "selected" : "" } value="Tadjikistan">Tadjikistan </option>
										<option ${ utilisateur.getPays() == "Taiwan" ? "selected" : "" } value="Taiwan">Taiwan </option>
										<option ${ utilisateur.getPays() == "Tonga" ? "selected" : "" } value="Tonga">Tonga </option>
										<option ${ utilisateur.getPays() == "Tanzanie" ? "selected" : "" } value="Tanzanie">Tanzanie </option>
										<option ${ utilisateur.getPays() == "Tchad" ? "selected" : "" } value="Tchad">Tchad </option>
										<option ${ utilisateur.getPays() == "Thailande" ? "selected" : "" } value="Thailande">Thailande </option>
										<option ${ utilisateur.getPays() == "Tibet" ? "selected" : "" } value="Tibet">Tibet </option>
										<option ${ utilisateur.getPays() == "Timor_Oriental" ? "selected" : "" } value="Timor_Oriental">Timor_Oriental </option>
										<option ${ utilisateur.getPays() == "Togo" ? "selected" : "" } value="Togo">Togo </option>
										<option ${ utilisateur.getPays() == "Trinite_et_Tobago" ? "selected" : "" } value="Trinite_et_Tobago">Trinite_et_Tobago </option>
										<option ${ utilisateur.getPays() == "Tristan de cuncha" ? "selected" : "" } value="Tristan da cunha">Tristan de cuncha </option>
										<option ${ utilisateur.getPays() == "Tunisie" ? "selected" : "" } value="Tunisie">Tunisie </option>
										<option ${ utilisateur.getPays() == "Turmenistan" ? "selected" : "" } value="Turkmenistan">Turmenistan </option>
										<option ${ utilisateur.getPays() == "Turquie" ? "selected" : "" } value="Turquie">Turquie </option>
										                          																									
										<option ${ utilisateur.getPays() == "Ukraine" ? "selected" : "" } value="Ukraine">Ukraine </option>
										<option ${ utilisateur.getPays() == "Uruguay" ? "selected" : "" } value="Uruguay">Uruguay </option>
										                          																									
										<option ${ utilisateur.getPays() == "Vanuatu" ? "selected" : "" } value="Vanuatu">Vanuatu </option>
										<option ${ utilisateur.getPays() == "Vatican" ? "selected" : "" } value="Vatican">Vatican </option>
										<option ${ utilisateur.getPays() == "Venezuela" ? "selected" : "" } value="Venezuela">Venezuela </option>
										<option ${ utilisateur.getPays() == "Vierges_Americaines" ? "selected" : "" } value="Vierges_Americaines">Vierges_Americaines </option>
										<option ${ utilisateur.getPays() == "Vierges_Britanniques" ? "selected" : "" } value="Vierges_Britanniques">Vierges_Britanniques </option>
										<option ${ utilisateur.getPays() == "Vietnam" ? "selected" : "" } value="Vietnam">Vietnam </option>
										                          																									
										<option ${ utilisateur.getPays() == "Wake" ? "selected" : "" } value="Wake">Wake </option>
										<option ${ utilisateur.getPays() == "Wallis et Futuma" ? "selected" : "" } value="Wallis et Futuma">Wallis et Futuma </option>
										                          																									
										<option ${ utilisateur.getPays() == "Yemen" ? "selected" : "" } value="Yemen">Yemen </option>
										<option ${ utilisateur.getPays() == "Yougoslavie" ? "selected" : "" } value="Yougoslavie">Yougoslavie </option>
										                          																									
										<option ${ utilisateur.getPays() == "Zambie" ? "selected" : "" } value="Zambie">Zambie </option>
										<option ${ utilisateur.getPays() == "Zimbabwe" ? "selected" : "" } value="Zimbabwe">Zimbabwe </option>
                                    </select>
                                    
									<input id="numIdentite" class="form-control mb-4" type="text" placeholder="Numéro d'Identité" name="numIdentite" value="${ utilisateur.getNumeroIdentite() }" required>
									
									<input id="privilege" class="form-control mb-4" type="text" name="privilege" value="${ utilisateur.getPrivilege() }" hidden="true" required>
									
									<input id="image" name="photo" type="file" class="form-controm mb-4"  accept="image/png, image/jpg, image/jpeg">
									
									<div class="text-center">
										<button type="submit" class="button cart_button_checkout">Modifier</button>
									</div>
								</div>
								
							</form>
						</div>
						
						<div style="border: 1px solid #d3d3d3; box-shadow: 0px 3px 11px #d3d3d3;" class="p-3 mb-5 rounded">
							<h3 class="mb-4">Modifier Mot De Passe: </h3>
							
							<form action="" method="POST">
								<input type="hidden" name="action" value="modifierMdp">
								<input id="idUtilisateur" class="form-control mb-4" type="text" name="idUtilisateur" value="${ utilisateur.getIdUtilisateur() }" hidden="true" required>
								
								<div class="form-group">
									<input id="mdp" class="form-control mb-4" type="password" placeholder="Ancien Mot de Passe" name="mdp" required>
									<input id="mdpNew" class="form-control mb-4" type="password" placeholder="Nouveau Mot de Passe" name="mdpNew" required>
									
									<div class="text-center">
										<button type="submit" class="button cart_button_checkout">Modifier Mot De Passe</button>
									</div>
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


	<script src="assets/js/cart_custom.js"></script>
</body>

</html>