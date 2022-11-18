<!DOCTYPE html>
<html class="loading" lang="fr" data-textdirection="ltr">

<head>
	<%@ include file="../includes/admin/head.jsp" %>
    <title>Utilisateurs - AjiTechri</title>
    
   	<link rel="stylesheet" type="text/css" href="../ressources-app/css/plugins/forms/validation/form-validation.css">
    
</head>


<body class="vertical-layout vertical-menu-modern boxicon-layout no-card-shadow 2-columns  navbar-sticky footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">



	<%@ include file="../includes/admin/header.jsp" %>  
	
	
	
	<!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-12 mb-2 mt-1">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h5 class="content-header-title float-left pr-1 mb-0">Utilisateurs</h5>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb p-0 mb-0">
                                    <li class="breadcrumb-item"><a href="/admin"><i class="bx bx-home-alt"></i></a></li>
                                    <li class="breadcrumb-item"><a href="/admin/utilisateurs">Utilisateurs</a></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <div class="content-body">
            
                <section class="multiple-validation">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Ajouter un utilisateur</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <form method="POST" action="" class="form-horizontal" novalidate enctype="multipart/form-data">
                                        	<input name="action" type="hidden" value="ajouter">
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <input type="text" name="nom" class="form-control" placeholder="Nom" required data-validation-required-message="Ce champ est requis">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <input type="text" name="prenom" class="form-control" placeholder="Prenom" required data-validation-required-message="Ce champ est requis">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <input type="email" name="email" class="form-control" placeholder="Email" required data-validation-required-message="Ce champ est requis">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <input type="number" name="tel" class="form-control" placeholder="Numéro téléphone" required data-validation-required-message="Ce champ est requis" minlength="10" minlength="10">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <input type="password" name="mdp" class="form-control" placeholder="Your Password" required data-validation-required-message="Ce champ est requis" minlength="6">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <input type="password" name="mdp2" class="form-control" placeholder="Confirm Password" required data-validation-match-match="mdp" data-validation-required-message="Ce champ est requis" minlength="6">
                                                        </div>
                                                    </div>
                                                </div>
                                                 <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <fieldset class="form-group position-relative has-icon-left">
					                                            <input name="dateNaissance" type="text" class="form-control pickadate-translations" placeholder="Date Naissance" required data-validation-required-message="Ce champ est requis">
					                                            <div class="form-control-position">
					                                                <i class='bx bx-calendar'></i>
					                                            </div>
					                                        </fieldset>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <select name="sexe" class="custom-select" id="customSelect" required data-validation-required-message="Ce champ est requis">
		                                                        <option value="" selected>Sexe</option>
		                                                        <option value="Homme">Homme</option>
		                                                        <option value="Femme">Femme</option>
		                                                    </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <input type="text" name="adresse" class="form-control" placeholder="Adresse" required data-validation-required-message="Ce champ est requis">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <input type="text" name="ville" class="form-control" placeholder="Ville" required data-validation-required-message="Ce champ est requis">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <select name="pays" class="custom-select" id="customSelect" required data-validation-required-message="Ce champ est requis">
		                                                        <option value="" selected>Pays</option>
		                                                        
		                                                        <option value="Afghanistan">Afghanistan </option>
																<option value="Afrique_Centrale">Afrique_Centrale </option>
																<option value="Afrique_du_sud">Afrique_du_Sud </option>
																<option value="Albanie">Albanie </option>
																<option value="Algerie">Algerie </option>
																<option value="Allemagne">Allemagne </option>
																<option value="Andorre">Andorre </option>
																<option value="Angola">Angola </option>
																<option value="Anguilla">Anguilla </option>
																<option value="Arabie_Saoudite">Arabie_Saoudite </option>
																<option value="Argentine">Argentine </option>
																<option value="Armenie">Armenie </option>
																<option value="Australie">Australie </option>
																<option value="Autriche">Autriche </option>
																<option value="Azerbaidjan">Azerbaidjan </option>
																
																<option value="Bahamas">Bahamas </option>
																<option value="Bangladesh">Bangladesh </option>
																<option value="Barbade">Barbade </option>
																<option value="Bahrein">Bahrein </option>
																<option value="Belgique">Belgique </option>
																<option value="Belize">Belize </option>
																<option value="Benin">Benin </option>
																<option value="Bermudes">Bermudes </option>
																<option value="Bielorussie">Bielorussie </option>
																<option value="Bolivie">Bolivie </option>
																<option value="Botswana">Botswana </option>
																<option value="Bhoutan">Bhoutan </option>
																<option value="Boznie_Herzegovine">Boznie_Herzegovine </option>
																<option value="Bresil">Bresil </option>
																<option value="Brunei">Brunei </option>
																<option value="Bulgarie">Bulgarie </option>
																<option value="Burkina_Faso">Burkina_Faso </option>
																<option value="Burundi">Burundi </option>
																
																<option value="Caiman">Caiman </option>
																<option value="Cambodge">Cambodge </option>
																<option value="Cameroun">Cameroun </option>
																<option value="Canada">Canada </option>
																<option value="Canaries">Canaries </option>
																<option value="Cap_vert">Cap_Vert </option>
																<option value="Chili">Chili </option>
																<option value="Chine">Chine </option>
																<option value="Chypre">Chypre </option>
																<option value="Colombie">Colombie </option>
																<option value="Comores">Colombie </option>
																<option value="Congo">Congo </option>
																<option value="Congo_democratique">Congo_democratique </option>
																<option value="Cook">Cook </option>
																<option value="Coree_du_Nord">Coree_du_Nord </option>
																<option value="Coree_du_Sud">Coree_du_Sud </option>
																<option value="Costa_Rica">Costa_Rica </option>
																<option value="Cote_d_Ivoire">Côte_d_Ivoire </option>
																<option value="Croatie">Croatie </option>
																<option value="Cuba">Cuba </option>
																
																<option value="Danemark">Danemark </option>
																<option value="Djibouti">Djibouti </option>
																<option value="Dominique">Dominique </option>
																
																<option value="Egypte">Egypte </option>
																<option value="Emirats_Arabes_Unis">Emirats_Arabes_Unis </option>
																<option value="Equateur">Equateur </option>
																<option value="Erythree">Erythree </option>
																<option value="Espagne">Espagne </option>
																<option value="Estonie">Estonie </option>
																<option value="Etats_Unis">Etats_Unis </option>
																<option value="Ethiopie">Ethiopie </option>
																
																<option value="Falkland">Falkland </option>
																<option value="Feroe">Feroe </option>
																<option value="Fidji">Fidji </option>
																<option value="Finlande">Finlande </option>
																<option value="France">France </option>
																
																<option value="Gabon">Gabon </option>
																<option value="Gambie">Gambie </option>
																<option value="Georgie">Georgie </option>
																<option value="Ghana">Ghana </option>
																<option value="Gibraltar">Gibraltar </option>
																<option value="Grece">Grece </option>
																<option value="Grenade">Grenade </option>
																<option value="Groenland">Groenland </option>
																<option value="Guadeloupe">Guadeloupe </option>
																<option value="Guam">Guam </option>
																<option value="Guatemala">Guatemala</option>
																<option value="Guernesey">Guernesey </option>
																<option value="Guinee">Guinee </option>
																<option value="Guinee_Bissau">Guinee_Bissau </option>
																<option value="Guinee equatoriale">Guinee_Equatoriale </option>
																<option value="Guyana">Guyana </option>
																<option value="Guyane_Francaise ">Guyane_Francaise </option>
																
																<option value="Haiti">Haiti </option>
																<option value="Hawaii">Hawaii </option>
																<option value="Honduras">Honduras </option>
																<option value="Hong_Kong">Hong_Kong </option>
																<option value="Hongrie">Hongrie </option>
																
																<option value="Inde">Inde </option>
																<option value="Indonesie">Indonesie </option>
																<option value="Iran">Iran </option>
																<option value="Iraq">Iraq </option>
																<option value="Irlande">Irlande </option>
																<option value="Islande">Islande </option>
																<option value="Israel">Israel </option>
																<option value="Italie">italie </option>
																
																<option value="Jamaique">Jamaique </option>
																<option value="Jan Mayen">Jan Mayen </option>
																<option value="Japon">Japon </option>
																<option value="Jersey">Jersey </option>
																<option value="Jordanie">Jordanie </option>
																
																<option value="Kazakhstan">Kazakhstan </option>
																<option value="Kenya">Kenya </option>
																<option value="Kirghizstan">Kirghizistan </option>
																<option value="Kiribati">Kiribati </option>
																<option value="Koweit">Koweit </option>
																
																<option value="Laos">Laos </option>
																<option value="Lesotho">Lesotho </option>
																<option value="Lettonie">Lettonie </option>
																<option value="Liban">Liban </option>
																<option value="Liberia">Liberia </option>
																<option value="Liechtenstein">Liechtenstein </option>
																<option value="Lituanie">Lituanie </option>
																<option value="Luxembourg">Luxembourg </option>
																<option value="Lybie">Lybie </option>
																
																<option value="Macao">Macao </option>
																<option value="Macedoine">Macedoine </option>
																<option value="Madagascar">Madagascar </option>
																<option value="Madère">Madère </option>
																<option value="Malaisie">Malaisie </option>
																<option value="Malawi">Malawi </option>
																<option value="Maldives">Maldives </option>
																<option value="Mali">Mali </option>
																<option value="Malte">Malte </option>
																<option value="Man">Man </option>
																<option value="Mariannes du Nord">Mariannes du Nord </option>
																<option value="Maroc">Maroc </option>
																<option value="Marshall">Marshall </option>
																<option value="Martinique">Martinique </option>
																<option value="Maurice">Maurice </option>
																<option value="Mauritanie">Mauritanie </option>
																<option value="Mayotte">Mayotte </option>
																<option value="Mexique">Mexique </option>
																<option value="Micronesie">Micronesie </option>
																<option value="Midway">Midway </option>
																<option value="Moldavie">Moldavie </option>
																<option value="Monaco">Monaco </option>
																<option value="Mongolie">Mongolie </option>
																<option value="Montserrat">Montserrat </option>
																<option value="Mozambique">Mozambique </option>
																
																<option value="Namibie">Namibie </option>
																<option value="Nauru">Nauru </option>
																<option value="Nepal">Nepal </option>
																<option value="Nicaragua">Nicaragua </option>
																<option value="Niger">Niger </option>
																<option value="Nigeria">Nigeria </option>
																<option value="Niue">Niue </option>
																<option value="Norfolk">Norfolk </option>
																<option value="Norvege">Norvege </option>
																<option value="Nouvelle_Caledonie">Nouvelle_Caledonie </option>
																<option value="Nouvelle_Zelande">Nouvelle_Zelande </option>
																
																<option value="Oman">Oman </option>
																<option value="Ouganda">Ouganda </option>
																<option value="Ouzbekistan">Ouzbekistan </option>
																
																<option value="Pakistan">Pakistan </option>
																<option value="Palau">Palau </option>
																<option value="Palestine">Palestine </option>
																<option value="Panama">Panama </option>
																<option value="Papouasie_Nouvelle_Guinee">Papouasie_Nouvelle_Guinee </option>
																<option value="Paraguay">Paraguay </option>
																<option value="Pays_Bas">Pays_Bas </option>
																<option value="Perou">Perou </option>
																<option value="Philippines">Philippines </option>
																<option value="Pologne">Pologne </option>
																<option value="Polynesie">Polynesie </option>
																<option value="Porto_Rico">Porto_Rico </option>
																<option value="Portugal">Portugal </option>
																
																<option value="Qatar">Qatar </option>
																
																<option value="Republique_Dominicaine">Republique_Dominicaine </option>
																<option value="Republique_Tcheque">Republique_Tcheque </option>
																<option value="Reunion">Reunion </option>
																<option value="Roumanie">Roumanie </option>
																<option value="Royaume_Uni">Royaume_Uni </option>
																<option value="Russie">Russie </option>
																<option value="Rwanda">Rwanda </option>
																
																<option value="Sahara Occidental">Sahara Occidental </option>
																<option value="Sainte_Lucie">Sainte_Lucie </option>
																<option value="Saint_Marin">Saint_Marin </option>
																<option value="Salomon">Salomon </option>
																<option value="Salvador">Salvador </option>
																<option value="Samoa_Occidentales">Samoa_Occidentales</option>
																<option value="Samoa_Americaine">Samoa_Americaine </option>
																<option value="Sao_Tome_et_Principe">Sao_Tome_et_Principe </option>
																<option value="Senegal">Senegal </option>
																<option value="Seychelles">Seychelles </option>
																<option value="Sierra Leone">Sierra Leone </option>
																<option value="Singapour">Singapour </option>
																<option value="Slovaquie">Slovaquie </option>
																<option value="Slovenie">Slovenie</option>
																<option value="Somalie">Somalie </option>
																<option value="Soudan">Soudan </option>
																<option value="Sri_Lanka">Sri_Lanka </option>
																<option value="Suede">Suede </option>
																<option value="Suisse">Suisse </option>
																<option value="Surinam">Surinam </option>
																<option value="Swaziland">Swaziland </option>
																<option value="Syrie">Syrie </option>
																
																<option value="Tadjikistan">Tadjikistan </option>
																<option value="Taiwan">Taiwan </option>
																<option value="Tonga">Tonga </option>
																<option value="Tanzanie">Tanzanie </option>
																<option value="Tchad">Tchad </option>
																<option value="Thailande">Thailande </option>
																<option value="Tibet">Tibet </option>
																<option value="Timor_Oriental">Timor_Oriental </option>
																<option value="Togo">Togo </option>
																<option value="Trinite_et_Tobago">Trinite_et_Tobago </option>
																<option value="Tristan da cunha">Tristan de cuncha </option>
																<option value="Tunisie">Tunisie </option>
																<option value="Turkmenistan">Turmenistan </option>
																<option value="Turquie">Turquie </option>
																
																<option value="Ukraine">Ukraine </option>
																<option value="Uruguay">Uruguay </option>
																
																<option value="Vanuatu">Vanuatu </option>
																<option value="Vatican">Vatican </option>
																<option value="Venezuela">Venezuela </option>
																<option value="Vierges_Americaines">Vierges_Americaines </option>
																<option value="Vierges_Britanniques">Vierges_Britanniques </option>
																<option value="Vietnam">Vietnam </option>
																
																<option value="Wake">Wake </option>
																<option value="Wallis et Futuma">Wallis et Futuma </option>
																
																<option value="Yemen">Yemen </option>
																<option value="Yougoslavie">Yougoslavie </option>
																
																<option value="Zambie">Zambie </option>
																<option value="Zimbabwe">Zimbabwe </option>
		                                                    </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <input type="number" name="codePostal" class="form-control" placeholder="Code Postal" required data-validation-required-message="Ce champ est requis">
                                                        </div>
                                                    </div>
                                                </div>  
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <input type="text" name="numIdentite" class="form-control" placeholder="Numéro d'Identité" required data-validation-required-message="Ce champ est requis">
                                                        </div>
                                                    </div>
                                                </div>  
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <select name="privilege" class="custom-select" id="customSelect" required data-validation-required-message="Ce champ est requis">
		                                                        <option value="" selected>Privilège</option>
		                                                        <option value="user">Utilisateur</option>
		                                                        <option value="admin">Admin</option>
		                                                    </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                        	<fieldset class="form-group">
			                                                    <div class="custom-file">
			                                                        <input name="photo" type="file" class="custom-file-input" id="inputGroupFile01"  accept="image/png, image/jpg, image/jpeg" required data-validation-required-message="Ce champ est requis">
			                                                        <label class="custom-file-label" for="inputGroupFile01">Choisissez une photo</label>
			                                                    </div>
			                                                </fieldset>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                            <button type="submit" class="btn btn-primary">Ajouter</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                
                <section id="column-selectors">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body card-dashboard">
                                        
                                        <div class="table-responsive">
                                            <table class="table table-striped dataex-html5-selectors">
                                                <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Photo</th>
                                                        <th>Nom</th>
                                                        <th>Prenom</th>
                                                        <th>Email</th>
                                                        <th style="display: none">Date Naissance</th>
                                                        <th>Sexe</th>
                                                        <th style="display: none">Ville</th>
                                                        <th>Pays</th>
                                                        <th style="display: none">Numéro d'Identité</th>
                                                        <th>Privilege</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
	                                                <c:forEach items="${ utilisateurs }" var="user">
		                                                <tr>
	                                                        <td>${ user.getIdUtilisateur() }</td>
	                                                        <td><a href="#"><img class="round" width="40" height="40" src="../${ user.getPhoto() != null ? user.getPhoto(): 'uploads/avatars/default.png' }" alt="avatar"></a></td>
	                                                        <td>${ user.getNom() }</td>
	                                                        <td>${ user.getPrenom() }</td>
	                                                        <td>${ user.getEmail() }</td>
	                                                        <td style="display: none">${ user.getDateNaissance() }</td>
	                                                        <td>${ user.getSexe() }</td>
	                                                        <td style="display: none">${ user.getVille() }</td>
	                                                        <td>${ user.getPays() }</td>
	                                                        <td style="display: none">${ user.getNumeroIdentite() }</td>
	                                                        <td>${ user.getPrivilege() }</td>
															<td>
																<div class="dropdown">
																	<span class="bx bx-dots-vertical-rounded font-medium-3 dropdown-toggle nav-hide-arrow cursor-pointer" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="menu"></span>
																	<div class="dropdown-menu dropdown-menu-right">
																		<button class="dropdown-item" data-toggle="modal" data-target="#formModifier${ user.getIdUtilisateur() }"><i class="bx bx-edit-alt mr-1"></i> modifier</button>
																		
																		<form action="" method="POST" onsubmit="return confirm('Êtes-vous sûr de bien vouloir supprimer cet élément?');">
																			<input name="action" type="hidden" value="supprimer">
																			<input name="id" type="hidden" value="${ user.getIdUtilisateur() }">
																			<button type="submit" class="dropdown-item"><i class="bx bx-trash mr-1"></i> supprimer</button>
																		</form>
																	</div>
																</div>
															</td>
															
															
															<div class="modal fade text-left" id="formModifier${ user.getIdUtilisateur() }" tabindex="-1" role="dialog" aria-labelledby="modalLabel${ user.getIdUtilisateur() }" aria-hidden="true">
				                                                <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable" role="document">
				                                                    <div class="modal-content">
				                                                        <div class="modal-header">
				                                                            <h4 class="modal-title" id="modalLabel${ user.getIdUtilisateur() }">Modifer Utilisateur </h4>
				                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                                                                <i class="bx bx-x"></i>
				                                                            </button>
				                                                        </div>
				                                                        <form method="POST" action="" class="form-horizontal" novalidate enctype="multipart/form-data">
				                                                        	<input type="hidden" name="action" value="modifier" required>
				                                                        	<input name="id" type="hidden" value="${ user.getIdUtilisateur() }" required>
				                                                            <div class="modal-body">
				                                                                
				                                                                <div class="row">
									                                                <div class="col-sm-3">
									                                                    <div class="form-group">
									                                                        <div class="controls">
									                                                            <input type="text" name="nom" value="${ user.getNom() }" class="form-control" placeholder="Nom" required data-validation-required-message="Ce champ est requis">
									                                                        </div>
									                                                    </div>
									                                                </div>
									                                                <div class="col-sm-3">
									                                                    <div class="form-group">
									                                                        <div class="controls">
									                                                            <input type="text" name="prenom" value="${ user.getPrenom() }" class="form-control" placeholder="Prenom" required data-validation-required-message="Ce champ est requis">
									                                                        </div>
									                                                    </div>
									                                                </div>
									                                                <div class="col-sm-3">
									                                                    <div class="form-group">
									                                                        <div class="controls">
									                                                            <input type="email" name="email" value="${ user.getEmail() }" class="form-control" placeholder="Email" required data-validation-required-message="Ce champ est requis">
									                                                        </div>
									                                                    </div>
									                                                </div>
									                                                <div class="col-sm-3">
									                                                    <div class="form-group">
									                                                        <div class="controls">
									                                                            <input type="number" name="tel" value="${ user.getTel() }" class="form-control" placeholder="Numéro téléphone" required data-validation-required-message="Ce champ est requis" minlength="10" minlength="10">
									                                                        </div>
									                                                    </div>
									                                                </div>
									                                                 <div class="col-sm-3">
									                                                    <div class="form-group">
									                                                        <div class="controls">
									                                                            <fieldset class="form-group position-relative has-icon-left">
														                                            <input name="dateNaissance" value="${ user.getDateNaissance() }" type="text" class="form-control pickadate-translations" placeholder="Date Naissance" required data-validation-required-message="Ce champ est requis">
														                                            <div class="form-control-position">
														                                                <i class='bx bx-calendar'></i>
														                                            </div>
														                                        </fieldset>
									                                                        </div>
									                                                    </div>
									                                                </div>
									                                                <div class="col-sm-3">
									                                                    <div class="form-group">
									                                                        <div class="controls">
									                                                            <select name="sexe" class="custom-select" id="customSelect" required data-validation-required-message="Ce champ est requis">
											                                                        <option value="">Sexe</option>
											                                                        <option ${ user.getSexe() == "Homme" ? "selected" : "" } value="Homme">Homme</option>
											                                                        <option ${ user.getSexe() == "Femme" ? "selected" : "" } value="Femme">Femme</option>
											                                                    </select>
									                                                        </div>
									                                                    </div>
									                                                </div>
									                                                <div class="col-sm-6">
									                                                    <div class="form-group">
									                                                        <div class="controls">
									                                                            <input type="text" name="adresse" value="${ user.getAdresse() }" class="form-control" placeholder="Adresse" required data-validation-required-message="Ce champ est requis">
									                                                        </div>
									                                                    </div>
									                                                </div>
									                                                <div class="col-sm-3">
									                                                    <div class="form-group">
									                                                        <div class="controls">
									                                                            <input type="text" name="ville" value="${ user.getVille() }" class="form-control" placeholder="Ville" required data-validation-required-message="Ce champ est requis">
									                                                        </div>
									                                                    </div>
									                                                </div>
									                                                <div class="col-sm-3">
									                                                    <div class="form-group">
									                                                        <div class="controls">
									                                                            <select name="pays" class="custom-select" id="customSelect" required data-validation-required-message="Ce champ est requis">
											                                                        <option value="">Pays</option>
											                                                        
											                                                        <option ${ user.getPays() == "Afghanistan" ? "selected" : "" } value="Afghanistan">Afghanistan </option>
																									<option ${ user.getPays() == "Afrique_Centrale" ? "selected" : "" } value="Afrique_Centrale">Afrique_Centrale </option>
																									<option ${ user.getPays() == "Afrique_du_Sud" ? "selected" : "" } value="Afrique_du_sud">Afrique_du_Sud </option>
																									<option ${ user.getPays() == "Albanie" ? "selected" : "" } value="Albanie">Albanie </option>
																									<option ${ user.getPays() == "Algerie" ? "selected" : "" } value="Algerie">Algerie </option>
																									<option ${ user.getPays() == "Allemagne" ? "selected" : "" } value="Allemagne">Allemagne </option>
																									<option ${ user.getPays() == "Andorre" ? "selected" : "" } value="Andorre">Andorre </option>
																									<option ${ user.getPays() == "Angola" ? "selected" : "" } value="Angola">Angola </option>
																									<option ${ user.getPays() == "Anguilla" ? "selected" : "" } value="Anguilla">Anguilla </option>
																									<option ${ user.getPays() == "Arabie_Saoudite" ? "selected" : "" } value="Arabie_Saoudite">Arabie_Saoudite </option>
																									<option ${ user.getPays() == "Argentine" ? "selected" : "" } value="Argentine">Argentine </option>
																									<option ${ user.getPays() == "Armenie" ? "selected" : "" } value="Armenie">Armenie </option>
																									<option ${ user.getPays() == "Australie" ? "selected" : "" } value="Australie">Australie </option>
																									<option ${ user.getPays() == "Autriche" ? "selected" : "" } value="Autriche">Autriche </option>
																									<option ${ user.getPays() == "Azerbaidjan" ? "selected" : "" } value="Azerbaidjan">Azerbaidjan </option>
																									                              																									
																									<option ${ user.getPays() == "Bahamas" ? "selected" : "" } value="Bahamas">Bahamas </option>
																									<option ${ user.getPays() == "Bangladesh" ? "selected" : "" } value="Bangladesh">Bangladesh </option>
																									<option ${ user.getPays() == "Barbade" ? "selected" : "" } value="Barbade">Barbade </option>
																									<option ${ user.getPays() == "Bahrein" ? "selected" : "" } value="Bahrein">Bahrein </option>
																									<option ${ user.getPays() == "Belgique" ? "selected" : "" } value="Belgique">Belgique </option>
																									<option ${ user.getPays() == "Belize" ? "selected" : "" } value="Belize">Belize </option>
																									<option ${ user.getPays() == "Benin" ? "selected" : "" } value="Benin">Benin </option>
																									<option ${ user.getPays() == "Bermudes" ? "selected" : "" } value="Bermudes">Bermudes </option>
																									<option ${ user.getPays() == "Bielorussie" ? "selected" : "" } value="Bielorussie">Bielorussie </option>
																									<option ${ user.getPays() == "Bolivie" ? "selected" : "" } value="Bolivie">Bolivie </option>
																									<option ${ user.getPays() == "Botswana" ? "selected" : "" } value="Botswana">Botswana </option>
																									<option ${ user.getPays() == "Bhoutan" ? "selected" : "" } value="Bhoutan">Bhoutan </option>
																									<option ${ user.getPays() == "Boznie_Herzegovine" ? "selected" : "" } value="Boznie_Herzegovine">Boznie_Herzegovine </option>
																									<option ${ user.getPays() == "Bresil" ? "selected" : "" } value="Bresil">Bresil </option>
																									<option ${ user.getPays() == "Brunei" ? "selected" : "" } value="Brunei">Brunei </option>
																									<option ${ user.getPays() == "Bulgarie" ? "selected" : "" } value="Bulgarie">Bulgarie </option>
																									<option ${ user.getPays() == "Burkina_Faso" ? "selected" : "" } value="Burkina_Faso">Burkina_Faso </option>
																									<option ${ user.getPays() == "Burundi" ? "selected" : "" } value="Burundi">Burundi </option>
																									                              																									
																									<option ${ user.getPays() == "Caiman" ? "selected" : "" } value="Caiman">Caiman </option>
																									<option ${ user.getPays() == "Cambodge" ? "selected" : "" } value="Cambodge">Cambodge </option>
																									<option ${ user.getPays() == "Cameroun" ? "selected" : "" } value="Cameroun">Cameroun </option>
																									<option ${ user.getPays() == "Canada" ? "selected" : "" } value="Canada">Canada </option>
																									<option ${ user.getPays() == "Canaries" ? "selected" : "" } value="Canaries">Canaries </option>
																									<option ${ user.getPays() == "Cap_Vert" ? "selected" : "" } value="Cap_vert">Cap_Vert </option>
																									<option ${ user.getPays() == "Chili" ? "selected" : "" } value="Chili">Chili </option>
																									<option ${ user.getPays() == "Chine" ? "selected" : "" } value="Chine">Chine </option>
																									<option ${ user.getPays() == "Chypre" ? "selected" : "" } value="Chypre">Chypre </option>
																									<option ${ user.getPays() == "Colombie" ? "selected" : "" } value="Colombie">Colombie </option>
																									<option ${ user.getPays() == "Colombie" ? "selected" : "" } value="Comores">Colombie </option>
																									<option ${ user.getPays() == "Congo" ? "selected" : "" } value="Congo">Congo </option>
																									<option ${ user.getPays() == "Congo_democratique" ? "selected" : "" } value="Congo_democratique">Congo_democratique </option>
																									<option ${ user.getPays() == "Cook" ? "selected" : "" } value="Cook">Cook </option>
																									<option ${ user.getPays() == "Coree_du_Nord" ? "selected" : "" } value="Coree_du_Nord">Coree_du_Nord </option>
																									<option ${ user.getPays() == "Coree_du_Sud" ? "selected" : "" } value="Coree_du_Sud">Coree_du_Sud </option>
																									<option ${ user.getPays() == "Costa_Rica" ? "selected" : "" } value="Costa_Rica">Costa_Rica </option>
																									<option ${ user.getPays() == "Cote_d_Ivoire" ? "selected" : "" } value="Cote_d_Ivoire">Côte_d_Ivoire </option>
																									<option ${ user.getPays() == "Croatie" ? "selected" : "" } value="Croatie">Croatie </option>
																									<option ${ user.getPays() == "Cuba" ? "selected" : "" } value="Cuba">Cuba </option>
																									                              																									
																									<option ${ user.getPays() == "Danemark" ? "selected" : "" } value="Danemark">Danemark </option>
																									<option ${ user.getPays() == "Djibouti" ? "selected" : "" } value="Djibouti">Djibouti </option>
																									<option ${ user.getPays() == "Dominique" ? "selected" : "" } value="Dominique">Dominique </option>
																									                              																									
																									<option ${ user.getPays() == "Egypte" ? "selected" : "" } value="Egypte">Egypte </option>
																									<option ${ user.getPays() == "Emirats_Arabes_Unis" ? "selected" : "" } value="Emirats_Arabes_Unis">Emirats_Arabes_Unis </option>
																									<option ${ user.getPays() == "Equateur" ? "selected" : "" } value="Equateur">Equateur </option>
																									<option ${ user.getPays() == "Erythree" ? "selected" : "" } value="Erythree">Erythree </option>
																									<option ${ user.getPays() == "Espagne" ? "selected" : "" } value="Espagne">Espagne </option>
																									<option ${ user.getPays() == "Estonie" ? "selected" : "" } value="Estonie">Estonie </option>
																									<option ${ user.getPays() == "Etats_Unis" ? "selected" : "" } value="Etats_Unis">Etats_Unis </option>
																									<option ${ user.getPays() == "Ethiopie" ? "selected" : "" } value="Ethiopie">Ethiopie </option>
																									                              																									
																									<option ${ user.getPays() == "Falkland" ? "selected" : "" } value="Falkland">Falkland </option>
																									<option ${ user.getPays() == "Feroe" ? "selected" : "" } value="Feroe">Feroe </option>
																									<option ${ user.getPays() == "Fidji" ? "selected" : "" } value="Fidji">Fidji </option>
																									<option ${ user.getPays() == "Finlande" ? "selected" : "" } value="Finlande">Finlande </option>
																									<option ${ user.getPays() == "France" ? "selected" : "" } value="France">France </option>
																									                              																									
																									<option ${ user.getPays() == "Gabon" ? "selected" : "" } value="Gabon">Gabon </option>
																									<option ${ user.getPays() == "Gambie" ? "selected" : "" } value="Gambie">Gambie </option>
																									<option ${ user.getPays() == "Georgie" ? "selected" : "" } value="Georgie">Georgie </option>
																									<option ${ user.getPays() == "Ghana" ? "selected" : "" } value="Ghana">Ghana </option>
																									<option ${ user.getPays() == "Gibraltar" ? "selected" : "" } value="Gibraltar">Gibraltar </option>
																									<option ${ user.getPays() == "Grece" ? "selected" : "" } value="Grece">Grece </option>
																									<option ${ user.getPays() == "Grenade" ? "selected" : "" } value="Grenade">Grenade </option>
																									<option ${ user.getPays() == "Groenland" ? "selected" : "" } value="Groenland">Groenland </option>
																									<option ${ user.getPays() == "Guadeloupe" ? "selected" : "" } value="Guadeloupe">Guadeloupe </option>
																									<option ${ user.getPays() == "Guam" ? "selected" : "" } value="Guam">Guam </option>
																									<option ${ user.getPays() == "Guatemala</option>" ? "selected" : "" } value="Guatemala">Guatemala</option>
																									<option ${ user.getPays() == "Guernesey" ? "selected" : "" } value="Guernesey">Guernesey </option>
																									<option ${ user.getPays() == "Guinee" ? "selected" : "" } value="Guinee">Guinee </option>
																									<option ${ user.getPays() == "Guinee_Bissau" ? "selected" : "" } value="Guinee_Bissau">Guinee_Bissau </option>
																									<option ${ user.getPays() == "Guinee_Equatoriale" ? "selected" : "" } value="Guinee equatoriale">Guinee_Equatoriale </option>
																									<option ${ user.getPays() == "Guyana" ? "selected" : "" } value="Guyana">Guyana </option>
																									<option ${ user.getPays() == "Guyane_Francaise" ? "selected" : "" } value="Guyane_Francaise ">Guyane_Francaise </option>
																									                              																									
																									<option ${ user.getPays() == "Haiti" ? "selected" : "" } value="Haiti">Haiti </option>
																									<option ${ user.getPays() == "Hawaii" ? "selected" : "" } value="Hawaii">Hawaii </option>
																									<option ${ user.getPays() == "Honduras" ? "selected" : "" } value="Honduras">Honduras </option>
																									<option ${ user.getPays() == "Hong_Kong" ? "selected" : "" } value="Hong_Kong">Hong_Kong </option>
																									<option ${ user.getPays() == "Hongrie" ? "selected" : "" } value="Hongrie">Hongrie </option>
																									                              																									
																									<option ${ user.getPays() == "Inde" ? "selected" : "" } value="Inde">Inde </option>
																									<option ${ user.getPays() == "Indonesie" ? "selected" : "" } value="Indonesie">Indonesie </option>
																									<option ${ user.getPays() == "Iran" ? "selected" : "" } value="Iran">Iran </option>
																									<option ${ user.getPays() == "Iraq" ? "selected" : "" } value="Iraq">Iraq </option>
																									<option ${ user.getPays() == "Irlande" ? "selected" : "" } value="Irlande">Irlande </option>
																									<option ${ user.getPays() == "Islande" ? "selected" : "" } value="Islande">Islande </option>
																									<option ${ user.getPays() == "Israel" ? "selected" : "" } value="Israel">Israel </option>
																									<option ${ user.getPays() == "italie" ? "selected" : "" } value="Italie">italie </option>
																									                              																									
																									<option ${ user.getPays() == "Jamaique" ? "selected" : "" } value="Jamaique">Jamaique </option>
																									<option ${ user.getPays() == "Jan Mayen" ? "selected" : "" } value="Jan Mayen">Jan Mayen </option>
																									<option ${ user.getPays() == "Japon" ? "selected" : "" } value="Japon">Japon </option>
																									<option ${ user.getPays() == "Jersey" ? "selected" : "" } value="Jersey">Jersey </option>
																									<option ${ user.getPays() == "Jordanie" ? "selected" : "" } value="Jordanie">Jordanie </option>
																									                              																									
																									<option ${ user.getPays() == "Kazakhstan" ? "selected" : "" } value="Kazakhstan">Kazakhstan </option>
																									<option ${ user.getPays() == "Kenya" ? "selected" : "" } value="Kenya">Kenya </option>
																									<option ${ user.getPays() == "Kirghizistan" ? "selected" : "" } value="Kirghizstan">Kirghizistan </option>
																									<option ${ user.getPays() == "Kiribati" ? "selected" : "" } value="Kiribati">Kiribati </option>
																									<option ${ user.getPays() == "Koweit" ? "selected" : "" } value="Koweit">Koweit </option>
																									                              																									
																									<option ${ user.getPays() == "Laos" ? "selected" : "" } value="Laos">Laos </option>
																									<option ${ user.getPays() == "Lesotho" ? "selected" : "" } value="Lesotho">Lesotho </option>
																									<option ${ user.getPays() == "Lettonie" ? "selected" : "" } value="Lettonie">Lettonie </option>
																									<option ${ user.getPays() == "Liban" ? "selected" : "" } value="Liban">Liban </option>
																									<option ${ user.getPays() == "Liberia" ? "selected" : "" } value="Liberia">Liberia </option>
																									<option ${ user.getPays() == "Liechtenstein" ? "selected" : "" } value="Liechtenstein">Liechtenstein </option>
																									<option ${ user.getPays() == "Lituanie" ? "selected" : "" } value="Lituanie">Lituanie </option>
																									<option ${ user.getPays() == "Luxembourg" ? "selected" : "" } value="Luxembourg">Luxembourg </option>
																									<option ${ user.getPays() == "Lybie" ? "selected" : "" } value="Lybie">Lybie </option>
																									                              																									
																									<option ${ user.getPays() == "Macao" ? "selected" : "" } value="Macao">Macao </option>
																									<option ${ user.getPays() == "Macedoine" ? "selected" : "" } value="Macedoine">Macedoine </option>
																									<option ${ user.getPays() == "Madagascar" ? "selected" : "" } value="Madagascar">Madagascar </option>
																									<option ${ user.getPays() == "Madere" ? "selected" : "" } value="Madère">Madère </option>
																									<option ${ user.getPays() == "Malaisie" ? "selected" : "" } value="Malaisie">Malaisie </option>
																									<option ${ user.getPays() == "Malawi" ? "selected" : "" } value="Malawi">Malawi </option>
																									<option ${ user.getPays() == "Maldives" ? "selected" : "" } value="Maldives">Maldives </option>
																									<option ${ user.getPays() == "Mali" ? "selected" : "" } value="Mali">Mali </option>
																									<option ${ user.getPays() == "Malte" ? "selected" : "" } value="Malte">Malte </option>
																									<option ${ user.getPays() == "Man" ? "selected" : "" } value="Man">Man </option>
																									<option ${ user.getPays() == "Mariannes du Nord" ? "selected" : "" } value="Mariannes du Nord">Mariannes du Nord </option>
																									<option ${ user.getPays() == "Maroc" ? "selected" : "" } value="Maroc">Maroc </option>
																									<option ${ user.getPays() == "Marshall" ? "selected" : "" } value="Marshall">Marshall </option>
																									<option ${ user.getPays() == "Martinique" ? "selected" : "" } value="Martinique">Martinique </option>
																									<option ${ user.getPays() == "Maurice" ? "selected" : "" } value="Maurice">Maurice </option>
																									<option ${ user.getPays() == "Mauritanie" ? "selected" : "" } value="Mauritanie">Mauritanie </option>
																									<option ${ user.getPays() == "Mayotte" ? "selected" : "" } value="Mayotte">Mayotte </option>
																									<option ${ user.getPays() == "Mexique" ? "selected" : "" } value="Mexique">Mexique </option>
																									<option ${ user.getPays() == "Micronesie" ? "selected" : "" } value="Micronesie">Micronesie </option>
																									<option ${ user.getPays() == "Midway" ? "selected" : "" } value="Midway">Midway </option>
																									<option ${ user.getPays() == "Moldavie" ? "selected" : "" } value="Moldavie">Moldavie </option>
																									<option ${ user.getPays() == "Monaco" ? "selected" : "" } value="Monaco">Monaco </option>
																									<option ${ user.getPays() == "Mongolie" ? "selected" : "" } value="Mongolie">Mongolie </option>
																									<option ${ user.getPays() == "Montserrat" ? "selected" : "" } value="Montserrat">Montserrat </option>
																									<option ${ user.getPays() == "Mozambique" ? "selected" : "" } value="Mozambique">Mozambique </option>
																									                              																									
																									<option ${ user.getPays() == "Namibie" ? "selected" : "" } value="Namibie">Namibie </option>
																									<option ${ user.getPays() == "Nauru" ? "selected" : "" } value="Nauru">Nauru </option>
																									<option ${ user.getPays() == "Nepal" ? "selected" : "" } value="Nepal">Nepal </option>
																									<option ${ user.getPays() == "Nicaragua" ? "selected" : "" } value="Nicaragua">Nicaragua </option>
																									<option ${ user.getPays() == "Niger" ? "selected" : "" } value="Niger">Niger </option>
																									<option ${ user.getPays() == "Nigeria" ? "selected" : "" } value="Nigeria">Nigeria </option>
																									<option ${ user.getPays() == "Niue" ? "selected" : "" } value="Niue">Niue </option>
																									<option ${ user.getPays() == "Norfolk" ? "selected" : "" } value="Norfolk">Norfolk </option>
																									<option ${ user.getPays() == "Norvege" ? "selected" : "" } value="Norvege">Norvege </option>
																									<option ${ user.getPays() == "Nouvelle_Caledonie" ? "selected" : "" } value="Nouvelle_Caledonie">Nouvelle_Caledonie </option>
																									<option ${ user.getPays() == "Nouvelle_Zelande" ? "selected" : "" } value="Nouvelle_Zelande">Nouvelle_Zelande </option>
																									                              																									
																									<option ${ user.getPays() == "Oman" ? "selected" : "" } value="Oman">Oman </option>
																									<option ${ user.getPays() == "Ouganda" ? "selected" : "" } value="Ouganda">Ouganda </option>
																									<option ${ user.getPays() == "Ouzbekistan" ? "selected" : "" } value="Ouzbekistan">Ouzbekistan </option>
																									                              																									
																									<option ${ user.getPays() == "Pakistan" ? "selected" : "" } value="Pakistan">Pakistan </option>
																									<option ${ user.getPays() == "Palau" ? "selected" : "" } value="Palau">Palau </option>
																									<option ${ user.getPays() == "Palestine" ? "selected" : "" } value="Palestine">Palestine </option>
																									<option ${ user.getPays() == "Panama" ? "selected" : "" } value="Panama">Panama </option>
																									<option ${ user.getPays() == "Papouasie_Nouvelle_Guinee" ? "selected" : "" } value="Papouasie_Nouvelle_Guinee">Papouasie_Nouvelle_Guinee </option>
																									<option ${ user.getPays() == "Paraguay" ? "selected" : "" } value="Paraguay">Paraguay </option>
																									<option ${ user.getPays() == "Pays_Bas" ? "selected" : "" } value="Pays_Bas">Pays_Bas </option>
																									<option ${ user.getPays() == "Perou" ? "selected" : "" } value="Perou">Perou </option>
																									<option ${ user.getPays() == "Philippines" ? "selected" : "" } value="Philippines">Philippines </option>
																									<option ${ user.getPays() == "Pologne" ? "selected" : "" } value="Pologne">Pologne </option>
																									<option ${ user.getPays() == "Polynesie" ? "selected" : "" } value="Polynesie">Polynesie </option>
																									<option ${ user.getPays() == "Porto_Rico" ? "selected" : "" } value="Porto_Rico">Porto_Rico </option>
																									<option ${ user.getPays() == "Portugal" ? "selected" : "" } value="Portugal">Portugal </option>
																									                              																									
																									<option ${ user.getPays() == "Qatar" ? "selected" : "" } value="Qatar">Qatar </option>
																									                              																									
																									<option ${ user.getPays() == "Republique_Dominicaine" ? "selected" : "" } value="Republique_Dominicaine">Republique_Dominicaine </option>
																									<option ${ user.getPays() == "Republique_Tcheque" ? "selected" : "" } value="Republique_Tcheque">Republique_Tcheque </option>
																									<option ${ user.getPays() == "Reunion" ? "selected" : "" } value="Reunion">Reunion </option>
																									<option ${ user.getPays() == "Roumanie" ? "selected" : "" } value="Roumanie">Roumanie </option>
																									<option ${ user.getPays() == "Royaume_Uni" ? "selected" : "" } value="Royaume_Uni">Royaume_Uni </option>
																									<option ${ user.getPays() == "Russie" ? "selected" : "" } value="Russie">Russie </option>
																									<option ${ user.getPays() == "Rwanda" ? "selected" : "" } value="Rwanda">Rwanda </option>
																									                              																									
																									<option ${ user.getPays() == "Sahara Occidental" ? "selected" : "" } value="Sahara Occidental">Sahara Occidental </option>
																									<option ${ user.getPays() == "Sainte_Lucie" ? "selected" : "" } value="Sainte_Lucie">Sainte_Lucie </option>
																									<option ${ user.getPays() == "Saint_Marin" ? "selected" : "" } value="Saint_Marin">Saint_Marin </option>
																									<option ${ user.getPays() == "Salomon" ? "selected" : "" } value="Salomon">Salomon </option>
																									<option ${ user.getPays() == "Salvador" ? "selected" : "" } value="Salvador">Salvador </option>
																									<option ${ user.getPays() == "Samoa_Occidentales</option>" ? "selected" : "" } value="Samoa_Occidentales">Samoa_Occidentales</option>
																									<option ${ user.getPays() == "Samoa_Americaine" ? "selected" : "" } value="Samoa_Americaine">Samoa_Americaine </option>
																									<option ${ user.getPays() == "Sao_Tome_et_Principe" ? "selected" : "" } value="Sao_Tome_et_Principe">Sao_Tome_et_Principe </option>
																									<option ${ user.getPays() == "Senegal" ? "selected" : "" } value="Senegal">Senegal </option>
																									<option ${ user.getPays() == "Seychelles" ? "selected" : "" } value="Seychelles">Seychelles </option>
																									<option ${ user.getPays() == "Sierra Leone" ? "selected" : "" } value="Sierra Leone">Sierra Leone </option>
																									<option ${ user.getPays() == "Singapour" ? "selected" : "" } value="Singapour">Singapour </option>
																									<option ${ user.getPays() == "Slovaquie" ? "selected" : "" } value="Slovaquie">Slovaquie </option>
																									<option ${ user.getPays() == "Slovenie</option>" ? "selected" : "" } value="Slovenie">Slovenie</option>
																									<option ${ user.getPays() == "Somalie" ? "selected" : "" } value="Somalie">Somalie </option>
																									<option ${ user.getPays() == "Soudan" ? "selected" : "" } value="Soudan">Soudan </option>
																									<option ${ user.getPays() == "Sri_Lanka" ? "selected" : "" } value="Sri_Lanka">Sri_Lanka </option>
																									<option ${ user.getPays() == "Suede" ? "selected" : "" } value="Suede">Suede </option>
																									<option ${ user.getPays() == "Suisse" ? "selected" : "" } value="Suisse">Suisse </option>
																									<option ${ user.getPays() == "Surinam" ? "selected" : "" } value="Surinam">Surinam </option>
																									<option ${ user.getPays() == "Swaziland" ? "selected" : "" } value="Swaziland">Swaziland </option>
																									<option ${ user.getPays() == "Syrie" ? "selected" : "" } value="Syrie">Syrie </option>
																									                              																									
																									<option ${ user.getPays() == "Tadjikistan" ? "selected" : "" } value="Tadjikistan">Tadjikistan </option>
																									<option ${ user.getPays() == "Taiwan" ? "selected" : "" } value="Taiwan">Taiwan </option>
																									<option ${ user.getPays() == "Tonga" ? "selected" : "" } value="Tonga">Tonga </option>
																									<option ${ user.getPays() == "Tanzanie" ? "selected" : "" } value="Tanzanie">Tanzanie </option>
																									<option ${ user.getPays() == "Tchad" ? "selected" : "" } value="Tchad">Tchad </option>
																									<option ${ user.getPays() == "Thailande" ? "selected" : "" } value="Thailande">Thailande </option>
																									<option ${ user.getPays() == "Tibet" ? "selected" : "" } value="Tibet">Tibet </option>
																									<option ${ user.getPays() == "Timor_Oriental" ? "selected" : "" } value="Timor_Oriental">Timor_Oriental </option>
																									<option ${ user.getPays() == "Togo" ? "selected" : "" } value="Togo">Togo </option>
																									<option ${ user.getPays() == "Trinite_et_Tobago" ? "selected" : "" } value="Trinite_et_Tobago">Trinite_et_Tobago </option>
																									<option ${ user.getPays() == "Tristan de cuncha" ? "selected" : "" } value="Tristan da cunha">Tristan de cuncha </option>
																									<option ${ user.getPays() == "Tunisie" ? "selected" : "" } value="Tunisie">Tunisie </option>
																									<option ${ user.getPays() == "Turmenistan" ? "selected" : "" } value="Turkmenistan">Turmenistan </option>
																									<option ${ user.getPays() == "Turquie" ? "selected" : "" } value="Turquie">Turquie </option>
																									                              																									
																									<option ${ user.getPays() == "Ukraine" ? "selected" : "" } value="Ukraine">Ukraine </option>
																									<option ${ user.getPays() == "Uruguay" ? "selected" : "" } value="Uruguay">Uruguay </option>
																									                              																									
																									<option ${ user.getPays() == "Vanuatu" ? "selected" : "" } value="Vanuatu">Vanuatu </option>
																									<option ${ user.getPays() == "Vatican" ? "selected" : "" } value="Vatican">Vatican </option>
																									<option ${ user.getPays() == "Venezuela" ? "selected" : "" } value="Venezuela">Venezuela </option>
																									<option ${ user.getPays() == "Vierges_Americaines" ? "selected" : "" } value="Vierges_Americaines">Vierges_Americaines </option>
																									<option ${ user.getPays() == "Vierges_Britanniques" ? "selected" : "" } value="Vierges_Britanniques">Vierges_Britanniques </option>
																									<option ${ user.getPays() == "Vietnam" ? "selected" : "" } value="Vietnam">Vietnam </option>
																									                              																									
																									<option ${ user.getPays() == "Wake" ? "selected" : "" } value="Wake">Wake </option>
																									<option ${ user.getPays() == "Wallis et Futuma" ? "selected" : "" } value="Wallis et Futuma">Wallis et Futuma </option>
																									                              																									
																									<option ${ user.getPays() == "Yemen" ? "selected" : "" } value="Yemen">Yemen </option>
																									<option ${ user.getPays() == "Yougoslavie" ? "selected" : "" } value="Yougoslavie">Yougoslavie </option>
																									                              																									
																									<option ${ user.getPays() == "Zambie" ? "selected" : "" } value="Zambie">Zambie </option>
																									<option ${ user.getPays() == "Zimbabwe" ? "selected" : "" } value="Zimbabwe">Zimbabwe </option>
											                                                    </select>
									                                                        </div>
									                                                    </div>
									                                                </div>
									                                                <div class="col-sm-3">
									                                                    <div class="form-group">
									                                                        <div class="controls">
									                                                            <input type="number" name="codePostal" value="${ user.getCodePostal() }" class="form-control" placeholder="Code Postal" required data-validation-required-message="Ce champ est requis">
									                                                        </div>
									                                                    </div>
									                                                </div>  
									                                                <div class="col-sm-3">
									                                                    <div class="form-group">
									                                                        <div class="controls">
									                                                            <input type="text" name="numIdentite" value="${ user.getNumeroIdentite() }" class="form-control" placeholder="Numéro d'Identité" required data-validation-required-message="Ce champ est requis">
									                                                        </div>
									                                                    </div>
									                                                </div>  
									                                                <div class="col-sm-3">
									                                                    <div class="form-group">
									                                                        <div class="controls">
									                                                            <select name="privilege" class="custom-select" id="customSelect" required data-validation-required-message="Ce champ est requis">
											                                                        <option value="">Privilège</option>
											                                                        <option ${ user.getPrivilege() == "utilisateur" ? "selected" : "" } value="user">Utilisateur</option>
											                                                        <option ${ user.getPrivilege() == "admin" ? "selected" : "" } value="admin">Admin</option>
											                                                    </select>
									                                                        </div>
									                                                    </div>
									                                                </div>
									                                                <div class="col-sm-3">
									                                                    <div class="form-group">
									                                                        <div class="controls">
									                                                        	<fieldset class="form-group">
												                                                    <div class="custom-file">
												                                                        <input name="photo" type="file" class="custom-file-input" id="inputGroupFile01"  accept="image/png, image/jpg, image/jpeg">
												                                                        <label class="custom-file-label" for="inputGroupFile01">Choisissez une photo</label>
												                                                        <label><em>Laissez vide si vous ne voulez pas la changer</em></label>
												                                                        
												                                                    </div>
												                                                </fieldset>
									                                                        </div>
									                                                    </div>
									                                                </div>
									                                                <div class="col-sm-3">
									                                                    <div class="form-group">
									                                                        <div class="controls">
									                                                        	<img class="round" width="40" height="40" src="../../${ user.getPhoto() != null ? user.getPhoto(): 'uploads/avatars/default.png' }" alt="avatar" />
									                                                        </div>
									                                                    </div>
									                                                </div>
									                                                
									                                            </div>
                                            
				                                                                
				                                                            </div>
				                                                            <div class="modal-footer">
				                                                                <button type="button" class="btn btn-light-secondary" data-dismiss="modal">
				                                                                    <i class="bx bx-x d-block d-sm-none"></i>
				                                                                    <span class="d-none d-sm-block">Fermer</span>
				                                                                </button>
				                                                                <button type="submit" class="btn btn-primary ml-1">
				                                                                    <i class="bx bx-check d-block d-sm-none"></i>
				                                                                    <span class="d-none d-sm-block">Modifier</span>
				                                                                </button>
				                                                            </div>
				                                                        </form>
				                                                    </div>
				                                                </div>
                                         					</div>				
	                                                    </tr>
	                                                </c:forEach>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Photo</th>
                                                        <th>Nom</th>
                                                        <th>Prenom</th>
                                                        <th>Email</th>
                                                        <th style="display: none">Date Naissance</th>
                                                        <th>Sexe</th>
                                                        <th style="display: none">Ville</th>
                                                        <th>Pays</th>
                                                        <th style="display: none">Numéro d'Identité</th>
                                                        <th>Privilege</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                
            </div>
        </div>
    </div>
    <!-- END: Content-->


    	
	<%@ include file="../includes/admin/scripts.jsp" %>
	
	
    <script src="../ressources-app/js/scripts/forms/validation/form-validation.js"></script>
	<script src="../ressources-app/js/scripts/modal/components-modal.js"></script>
    <script src="../ressources-app/js/scripts/pickers/dateTime/pick-a-datetime.js"></script>
    <script src="../ressources-app/js/scripts/forms/select/form-select2.js"></script>
    
	
    
    
    
    <c:if test="${ resAjoute != null }">
	    <script>
			$(document).ready(function () {
				<c:if test="${ resAjoute }">
	 				toastr.success('Élément ajouté', 'Succès', { positionClass: 'toast-bottom-right', containerId: 'toast-bottom-right' });
				</c:if>
	
				<c:if test="${ not resAjoute }">
					toastr.error('Élément non ajouté', 'Erreur', { positionClass: 'toast-bottom-right', containerId: 'toast-bottom-right' });
				</c:if>
			});
		</script>
	</c:if>
	
	<c:if test="${ resSupprimer != null }">
	    <script>
			$(document).ready(function () {
				<c:if test="${ resSupprimer }">
	 				toastr.success('Élément supprimé', 'Succès', { positionClass: 'toast-bottom-right', containerId: 'toast-bottom-right' });
				</c:if>
	
				<c:if test="${ not resSupprimer }">
					toastr.error('Élément non supprimé', 'Erreur', { positionClass: 'toast-bottom-right', containerId: 'toast-bottom-right' });
				</c:if>
			});
		</script>
	</c:if>
	
	<c:if test="${ resModifier != null }">
	    <script>
			$(document).ready(function () {
				<c:if test="${ resModifier }">
	 				toastr.success('Élément modifé', 'Succès', { positionClass: 'toast-bottom-right', containerId: 'toast-bottom-right' });
				</c:if>
	
				<c:if test="${ not resModifier }">
					toastr.error('Élément non modifé', 'Erreur', { positionClass: 'toast-bottom-right', containerId: 'toast-bottom-right' });
				</c:if>
			});
		</script>
	</c:if>
    
    
    
</body>

</html>




