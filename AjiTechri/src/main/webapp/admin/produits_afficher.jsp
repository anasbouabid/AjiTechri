<!DOCTYPE html>
<html class="loading" lang="fr" data-textdirection="ltr">

<head>
	<%@ include file="../includes/admin/head.jsp" %>
    <title>Produits - AjiTechri</title>
    
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
                        <div class="col-8">
                            <h5 class="content-header-title float-left pr-1 mb-0">Produits</h5>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb p-0 mb-0">
                                    <li class="breadcrumb-item"><a href="/admin"><i class="bx bx-home-alt"></i></a></li>
                                    <li class="breadcrumb-item"><a href="/admin/produits">Produits</a></li>
                                </ol>
                            </div>
                        </div>
                        
                        <div class="col-4">
                          	<a href="/admin/produits_ajouter" class="btn btn-primary float-right">Ajouter</a>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <div class="content-body">
                
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
                                                        <th>Image</th>
                                                        <th>Designation</th>
                                                        <th>Taux TVA</th>
                                                        <th>Taux Reduction</th>
                                                        <th>Categorie</th>
                                                        <th>Fournisseur</th>
                                                        <th>Marque</th>
                                                        <th>Date Ajout</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
	                                                <c:forEach items="${ produits }" var="p">
		                                                <tr>
	                                                        <td>${ p.getIdProduit() }</td>
	                                                        <td><a href="/admin/produit?id=${ p.getIdProduit() }"><img class="round" width="40" height="40" src="../${ p.getImage() != null ? p.getImage(): 'uploads/produits/default.png' }" alt="produit"></a></td>
	                                                        <td>${ p.getDesignation() }</td>
	                                                        <td>${ p.getTauxTva() }</td>
	                                                        <td>${ p.getTauxReduction() }</td>
	                                                        <td>${ p.getCategorie() }</td>
	                                                        <td>${ p.getFournisseur() }</td>
	                                                        <td>${ p.getMarque() }</td>
	                                                        <td>${ p.getDateAjout() }</td>
															<td>
																<div class="dropdown">
																	<span class="bx bx-dots-vertical-rounded font-medium-3 dropdown-toggle nav-hide-arrow cursor-pointer" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="menu"></span>
																	<div class="dropdown-menu dropdown-menu-right">
																		<a href="/admin/produit?id=${ p.getIdProduit() }" class="dropdown-item"><i class="bx bx-edit-alt mr-1"></i> modifier</a>
																		
																		<form action="" method="POST" onsubmit="return confirm('Êtes-vous sûr de bien vouloir supprimer cet élément?');">
																			<input name="action" type="hidden" value="supprimer">
																			<input name="id" type="hidden" value="${ p.getIdProduit() }">
																			<button type="submit" class="dropdown-item"><i class="bx bx-trash mr-1"></i> supprimer</button>
																		</form>
																	</div>
																</div>
															</td>				
	                                                    </tr>
	                                                </c:forEach>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Image</th>
                                                        <th>Designation</th>
                                                        <th>Taux TVA</th>
                                                        <th>Taux Reduction</th>
                                                        <th>Categorie</th>
                                                        <th>Fournisseur</th>
                                                        <th>Marque</th>
                                                        <th>Date Ajout</th>
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
	

    
    
    
</body>

</html>




