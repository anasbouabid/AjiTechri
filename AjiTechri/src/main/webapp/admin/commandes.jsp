<!DOCTYPE html>
<html class="loading" lang="fr" data-textdirection="ltr">

<head>
	<%@ include file="../includes/admin/head.jsp" %>
    <title>Commandes - AjiTechri</title>
    
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
                            <h5 class="content-header-title float-left pr-1 mb-0">Commandes</h5>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb p-0 mb-0">
                                    <li class="breadcrumb-item"><a href="/admin"><i class="bx bx-home-alt"></i></a></li>
                                    <li class="breadcrumb-item"><a href="/admin/commandes">Commandes</a></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="content-body">
                
                <section id="table-success">
                    <div class="card">
                        <div class="table-responsive">
                            <table id="table-extended-success" class="table mb-0">
                                <thead>
                                    <tr>
                                        <th>id</th>
                                        <th>Date</th>
                                        <th>Total</th>
                                        <th>Etat</th>
                                        <th>Utilisateur</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
									<c:if test="${ commandess.isEmpty() }">
										<tr>
											<td class="text-center" colspan=3>Pas de données disponibles</td>
										</tr>
									</c:if>
									
									<c:forEach items="${ commandes }" var="c">
										<tr>
	                                        <td class="text-bold-600"><c:out value="${ c.getIdCommande() }" /></td>
	                                        <td><c:out value="${ c.getDateCommande() }" /></td>
	                                        <td><c:out value="${ c.getTotal() }" /></td>
	                                        <td><c:out value="${ c.getEtat() }" /></td>
	                                        <td><c:out value="${ c.getUtilisateur() }" /></td>
	                                        <td>
	                                            <div class="dropdown">
	                                                <span class="bx bx-dots-vertical-rounded font-medium-3 dropdown-toggle nav-hide-arrow cursor-pointer" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="menu"></span>
	                                                <div class="dropdown-menu dropdown-menu-right">
	                                                    <button class="dropdown-item" data-toggle="modal" data-target="#formModifier${ c.getIdCommande() }"><i class="bx bx-edit-alt mr-1"></i> modifier</button>
	                                                </div>
	                                            </div>
	                                        </td>
                                    	</tr>
                                    	
                                    	
                                    	<div class="modal fade text-left" id="formModifier${ c.getIdCommande() }" tabindex="-1" role="dialog" aria-labelledby="modalLabel${ c.getIdCommande() }" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h4 class="modal-title" id="modalLabel${ c.getIdCommande() }">Modifier Commande </h4>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <i class="bx bx-x"></i>
                                                            </button>
                                                        </div>
                                                        <form action="" method="POST" novalidate>
                                                        	<input name="action" type="hidden" value="modifier">
                                                            <div class="modal-body">
                                                                <label>Id: </label>
                                                                <div class="form-group">
                                                                    <input type="text" name="id" placeholder="Id" value="${ c.getIdCommande() }" class="form-control" readonly="readonly" required>
                                                                </div>
                                                                <label>Etat: </label>
                                                                <div class="form-group">
                                                                    <select name="etat" class="custom-select" id="customSelect" required data-validation-required-message="Ce champ est requis">
				                                                        <option disabled value>Etat</option>
				                                                        <option ${ c.getEtat() == "En cours de traitement" ? "selected" : ""} value="En cours de traitement">En cours de traitement</option>
				                                                        <option ${ c.getEtat() == "Expédié" ? "selected" : ""} value="Expédié">Expédié</option>
				                                                    </select>
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
  
									</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>
                
            </div>
        </div>
    </div>


    	
	<%@ include file="../includes/admin/scripts.jsp" %>
	
	
    <script src="../ressources-app/js/scripts/forms/validation/form-validation.js"></script>
    <script src="../ressources-app/js/scripts/pages/table-extended.js"></script>
	<script src="../ressources-app/js/scripts/modal/components-modal.js"></script>
    
    
 
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




