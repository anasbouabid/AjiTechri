<!DOCTYPE html>
<html class="loading" lang="fr" data-textdirection="ltr">

<head>
	<%@ include file="../includes/admin/head.jsp" %>
    <title>${ produit.getDesignation() } - AjiTechri</title>
    
   	<link rel="stylesheet" type="text/css" href="../ressources-app/css/plugins/forms/validation/form-validation.css">
    
</head>


<body class="vertical-layout vertical-menu-modern boxicon-layout no-card-shadow 2-columns  navbar-sticky footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">



	<%@ include file="../includes/admin/header.jsp" %>  
	
	
	
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-12 mb-2 mt-1">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h5 class="content-header-title float-left pr-1 mb-0">Produits</h5>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb p-0 mb-0">
                                    <li class="breadcrumb-item"><a href="/admin"><i class="bx bx-home-alt"></i></a></li>
                                    <li class="breadcrumb-item"><a href="/admin/produits">Produits</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/produits_ajouter">Ajouter</a></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <div class="content-body">
            	<form method="POST" action="" id="formProduit" class="form-horizontal form" novalidate enctype="multipart/form-data">
            		<input name="action" type="hidden" value="modifier">
            		<input name="id" type="hidden" value="${ produit.getIdProduit() }">
            
	                <section class="multiple-validation">
	                    <div class="row">
	                        <div class="col-md-12">
	                            <div class="card">
	                                <div class="card-header">
	                                    <h4 class="card-title">Modifier produit</h4>
	                                </div>
	                                <div class="card-content">
	                                    <div class="card-body">
	                                           <div class="row">
	                                               <div class="col-sm-12 text-center mb-2">
	                                                   <img src="../${ produit.getImage() }" height="250" alt="produit">
	                                               </div>
	                                               <div class="col-sm-6">
	                                                   <div class="form-group">
	                                                       <div class="controls">
	                                                           <input type="text" name="designation" value="${ produit.getDesignation() }" class="form-control readonly" placeholder="Designation" required data-validation-required-message="Ce champ est requis">
	                                                       </div>
	                                                   </div>
	                                               </div>
	                                               <div class="col-sm-6">
	                                                   <div class="form-group">
	                                                       <div class="controls">
	                                                       	<fieldset class="form-group">
			                                                    <div class="custom-file">
			                                                        <input name="image" type="file" class="custom-file-input" id="inputGroupFile01"  accept="image/png, image/jpg, image/jpeg">
			                                                        <label class="custom-file-label" for="inputGroupFile01">Choisissez une photo</label>
			                                                    </div>
			                                                </fieldset>
	                                                       </div>
	                                                   </div>
	                                               </div>
	                                               <div class="col-sm-12">
	                                                   <div class="form-group">
	                                                       <div class="controls">
	                                                           <input type="text" name="description" value="${ produit.getDescription() }" class="form-control readonly" placeholder="Description"  required data-validation-required-message="Ce champ est requis">
	                                                       </div>
	                                                   </div>
	                                               </div>
	                                               <div class="col-sm-6">
	                                                   <div class="input-group bootstrap-touchspin bootstrap-touchspin-injected form-group">
	                                               		<input type="text" name="tauxTva" value="${ produit.getTauxTva() }" class="touchspin form-control readonly" placeholder="Taux TVA" data-bts-step="0.01" data-bts-decimals="2" required data-validation-required-message="Ce champ est requis">
	                                              		</div>
	                                               </div>
	                                               <div class="col-sm-6">
	                                                   <div class="input-group bootstrap-touchspin bootstrap-touchspin-injected form-group">
	                                               		<input type="text" name="tauxReduction" value="${ produit.getTauxReduction() }" class="touchspin form-control readonly" placeholder="Taux Reduction" data-bts-step="0.01" data-bts-decimals="2" required data-validation-required-message="Ce champ est requis">
	                                              		</div>
	                                               </div>
	                                               <div class="col-sm-4">
	                                                   <div class="form-group">
	                                                       <div class="controls">
	                                                           <select name="idCategorie" class="custom-select readonly" id="customSelect" required data-validation-required-message="Ce champ est requis">
		                                                        <option>Catégorie</option>
		                                                        
		                                                        <c:forEach items="${ categories }" var="c">
		                                                        	<option ${ produit.getCategorie().getIdCategorie() == c.getIdCategorie() ? "selected" : "" } value="${ c.getIdCategorie() }">${ c.getNom() }</option>
		                                                        </c:forEach>
		                                                    </select>
	                                                       </div>
	                                                   </div>
	                                               </div>
	                                               <div class="col-sm-4">
	                                                   <div class="form-group">
	                                                       <div class="controls">
	                                                           <select name="idFournisseur" class="custom-select readonly" id="customSelect" required data-validation-required-message="Ce champ est requis">
		                                                        <option>Fournisseur</option>
		                                                        
		                                                        <c:forEach items="${ fournisseurs }" var="f">
		                                                        	<option ${ produit.getFournisseur().getIdFournisseur() == f.getIdFournisseur() ? "selected" : "" } value="${ f.getIdFournisseur() }">${ f.getNom() }</option>
		                                                        </c:forEach>
		                                                    </select>
	                                                       </div>
	                                                   </div>
	                                               </div>
	                                               <div class="col-sm-4">
	                                                   <div class="form-group">
	                                                       <div class="controls">
	                                                           <select name="idMarque" class="custom-select readonly" id="customSelect" required data-validation-required-message="Ce champ est requis">
		                                                        <option>Marque</option>
		                                                        
		                                                        <c:forEach items="${ marques }" var="m">
		                                                        	<option ${ produit.getMarque().getIdMarque() == m.getIdMarque() ? "selected" : "" } value="${ m.getIdMarque() }">${ m.getNom() }</option>
		                                                        </c:forEach>
		                                                    </select>
	                                                       </div>
	                                                   </div>
	                                               </div>
	                                           </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </section>
	                
                	<section id="form-control-repeater">
                    	<div class="row">
	                        <div class="col-xl-6 col-lg-12">
	                            <div class="card">
	                                <div class="card-header">
	                                    <h4 class="card-title">Propriétés</h4>
	                                    <input type="number" name="nbrProprietes" id="nbrProprietes" value="0" required hidden="true">
	                                </div>
	                                <div class="card-content">
	                                    <div class="card-body">
                                            <div class="col-12">
                                            	<c:forEach items="${ produit.getProprietes() }" var="p">
	                                            	<div class="row mb-2">
			                                            <div class="col-sm-6">
			                                            	<input type="text" class="form-control propriete" name="propriete-${ p.getIdPropriete() }" value="${ p.getNom() }" placeholder="Propriété" required data-validation-required-message="Ce champ est requis">
			                                            </div>
			                                            <div class="col-sm-6">
			                                            	<input type="text" class="form-control" name="valeurPropriete-${ p.getIdPropriete() }" value="${ p.getValeur() }" placeholder="Valeur" required data-validation-required-message="Ce champ est requis">
			                                            </div>
	                                        		</div>
	                                        		<hr>
                                        		</c:forEach>
                                            </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        
	                        
	                        <div class="col-xl-6 col-lg-12">
	                            <div class="card">
	                                <div class="card-header">
	                                    <h4 class="card-title">Options</h4>
	                                    <input type="number" name="nbrOptions" id="nbrOptions" value="0" required hidden="true">
	                                </div>
	                                <div class="card-content">
	                                    <div class="card-body">
	                                    	<div class="col-12">
	                                    		<c:forEach items="${ produit.getProduitOptions() }" var="o">
			                                    	<div class="row mb-2">
			                                            <div class="col-12 mb-1">
			                                            	<input type="text" name="option-${ o.getIdProduitOption() }" value="${ o.getNom() }" placeholder="Option" class="form-control option" required data-validation-required-message="Ce champ est requis">
			                                            </div>
			                                            <div class="col-sm-6" class="form-control">
			                                            	<input type="number" name="prix-${ o.getIdProduitOption() }" value="${ o.getPrix() }" class="form-control" placeholder="Prix" step=".01" required data-validation-required-message="Ce champ est requis">
			                                            </div>
			                                            <div class="col-sm-6" class="form-control">
			                                            	<input type="number" name="stock-${ o.getIdProduitOption() }" value="${ o.getStock() }" class="form-control" placeholder="Stock" min="1" step="1" required data-validation-required-message="Ce champ est requis">
			                                            </div>
		                                        	</div>
		                                        	<hr>
	                                        	</c:forEach>
                                        	</div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                	</section>
                	
                	
                	<section id="form-control-repeater">
                    	<div class="row">
	                        <div class="col-12">
	                            <div class="card">
	                                <div class="card-content">
	                                    <div class="card-body text-center">
                                            <button id="modifierProduit" type="button" class="btn btn-success">Modifier Produit</button>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                	</section>
               	</form>
            </div>
        </div>
    </div>
    <!-- END: Content-->


    	
	<%@ include file="../includes/admin/scripts.jsp" %>
	
	
    <script src="../ressources-app/js/scripts/forms/validation/form-validation.js"></script>
	<script src="../ressources-app/js/scripts/modal/components-modal.js"></script>
    <script src="../ressources-app/js/scripts/pickers/dateTime/pick-a-datetime.js"></script>
    <script src="../ressources-app/js/scripts/forms/select/form-select2.js"></script>
    <script src="../ressources-app/js/scripts/forms/number-input.js"></script>
    <script src="../ressources-app/js/scripts/forms/form-repeater.js"></script>
    
    
    <script>
	    $('#modifierProduit').on('click',function() {
	   		incrementer();
	   	});
	    
	    function incrementer(){
	    	nbrProprietes = document.getElementsByClassName("propriete").length;
	    	nbrOptions = document.getElementsByClassName("option").length;
	    	
	    	if(nbrProprietes == 0){
	    		window.alert("Vous devez ajouter au moins une Propriété");
	    	}else if(nbrOptions == 0){
	    		window.alert("Vous devez ajouter au moins une Option");
	    	}else{
	    		document.getElementById("nbrProprietes").value = nbrProprietes;
	        	document.getElementById("nbrOptions").value = nbrOptions;
	        	
	        	console.log("test");
		    	console.log(nbrOptions);
	        
	        	$('#formProduit').submit();
	        	console.log("test");
	    	}
	    }
	    
    
    </script>
    
	
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




