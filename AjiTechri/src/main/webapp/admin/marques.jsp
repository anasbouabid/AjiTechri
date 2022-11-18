<!DOCTYPE html>
<html class="loading" lang="fr" data-textdirection="ltr">

<head>
	<%@ include file="../includes/admin/head.jsp" %>
    <title>Marques - AjiTechri</title>
    
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
                            <h5 class="content-header-title float-left pr-1 mb-0">Marques</h5>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb p-0 mb-0">
                                    <li class="breadcrumb-item"><a href="/admin"><i class="bx bx-home-alt"></i></a></li>
                                    <li class="breadcrumb-item"><a href="/admin/marques">Marques</a></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="content-body">
                
				<section class="simple-validation">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Ajouter une marque</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <form method="POST" action="" class="form-horizontal" novalidate enctype="multipart/form-data">
                                        	<input name="action" type="hidden" value="ajouter">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <input type="text" name="nom" class="form-control" placeholder="Marque" required data-validation-required-message="Ce champ est requis">
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                        	<fieldset class="form-group">
			                                                    <div class="custom-file">
			                                                        <input name="image" type="file" class="custom-file-input" id="inputGroupFile01"  accept="image/png, image/jpg, image/jpeg" required data-validation-required-message="Ce champ est requis">
			                                                        <label class="custom-file-label" for="inputGroupFile01">Choisissez une image</label>
			                                                    </div>
			                                                </fieldset>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                			<button type="submit" class="btn btn-primary">Ajouter</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                
                
                <section id="table-success">
                    <div class="card">
                        <div class="table-responsive">
                            <table id="table-extended-success" class="table mb-0">
                                <thead>
                                    <tr>
                                        <th>id</th>
                                        <th>Marque</th>
                                        <th>Logo</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
									<c:if test="${ marques.isEmpty() }">
										<tr>
											<td class="text-center" colspan=3>Pas de données disponibles</td>
										</tr>
									</c:if>
									
									<c:forEach items="${ marques }" var="m">
										<tr>
	                                        <td class="text-bold-600"><c:out value="${ m.getIdMarque() }" /></td>
	                                        <td><c:out value="${ m.getNom() }" /></td>
	                                        <td><img class="round" height="40" src="../${ m.getImage() != null ? m.getImage(): 'uploads/avatars/default.png' }" alt="logo"></td>
	                                        <td>
	                                            <div class="dropdown">
	                                                <span class="bx bx-dots-vertical-rounded font-medium-3 dropdown-toggle nav-hide-arrow cursor-pointer" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="menu"></span>
	                                                <div class="dropdown-menu dropdown-menu-right">
	                                                    <button class="dropdown-item" data-toggle="modal" data-target="#formModifier${ m.getIdMarque() }"><i class="bx bx-edit-alt mr-1"></i> modifier</button>
	                                                    
	                                                    <form action="" method="POST" onsubmit="return confirm('Êtes-vous sûr de bien vouloir supprimer cet élément?');">
	                                                    	<input name="action" type="hidden" value="supprimer">
	                                                    	<input name="id" type="hidden" value="${ m.getIdMarque() }">
	                                                    	<button type="submit" class="dropdown-item"><i class="bx bx-trash mr-1"></i> supprimer</button>
	                                                    </form>
	                                                </div>
	                                            </div>
	                                        </td>
                                    	</tr>
                                    	
                                    	
                                    	<div class="modal fade text-left" id="formModifier${ m.getIdMarque() }" tabindex="-1" role="dialog" aria-labelledby="modalLabel${ m.getIdMarque() }" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h4 class="modal-title" id="modalLabel${ m.getIdMarque() }">Modifer Marque </h4>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <i class="bx bx-x"></i>
                                                            </button>
                                                        </div>
                                                        <form action="" method="POST" novalidate enctype="multipart/form-data">
                                                        	<input name="action" type="hidden" value="modifier">
                                                            <div class="modal-body">
                                                                <label>Id: </label>
                                                                <div class="form-group">
                                                                    <input type="text" name="id" placeholder="Id" value="${ m.getIdMarque() }" class="form-control" readonly="readonly" required>
                                                                </div>
                                                                <label>Marque: </label>
                                                                <div class="form-group">
                                                                    <input type="text" name="nom" placeholder="Marque" value="${ m.getNom() }" class="form-control" required>
                                                                </div>
                                                                
                                                                <label>Logo: (<em>Laissez vide si vous ne voulez pas la changer</em>)</label>
                                                                <div class="form-group">
			                                                    	<div class="custom-file">
				                                                        <input name="image" type="file" class="custom-file-input" id="inputGroupFile01"  accept="image/png, image/jpg, image/jpeg" required data-validation-required-message="Ce champ est requis">
				                                                        <label class="custom-file-label" for="inputGroupFile01">Choisissez une image</label>
				                                                    </div>
			                                                    </div>
			                                                    <div class="form-group">
			                                                        <div class="controls">
			                                                        	<img  height="40" src="../../${ m.getImage() != null ? m.getImage(): 'uploads/avatars/default.png' }" alt="logo" />
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




