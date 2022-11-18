<%@ include file="includes/taglibs.jsp" %>
 
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">

<head>
	<%@ include file="includes/admin/auth-head.jsp" %>
    <title>Inscription - AjiTechri</title>
    

</head>


<body class="horizontal-layout horizontal-menu navbar-sticky 1-column   footer-static bg-full-screen-image  blank-page blank-page" data-open="hover" data-menu="horizontal-menu" data-col="1-column">
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <section class="row flexbox-container">
                    <div class="col-xl-8 col-10">
                        <div class="card bg-authentication mb-0">
                            <div class="row m-0">
                                <div class="col-md-6 col-12 px-0">
                                    <div class="card disable-rounded-right mb-0 p-2 h-100 d-flex justify-content-center">
                                        <div class="card-header pb-1">
                                            <div class="card-title">
                                                <h4 class="text-center mb-2">Inscription</h4>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <p> <small> Veuillez entrer vos coordonn�es pour vous inscrire et faire partie de notre grande communaut�</small>
                                            </p>
                                        </div>
                                        <div class="card-content">
                                            <div class="card-body">
                                                <form action="" method="post">
                                                    <div class="form-row">
                                                        <div class="form-group col-md-6 mb-50">
                                                            <label for="nom">Nom</label>
                                                            <input type="text" class="form-control" name="nom" id="nom" placeholder="Nom" required>
                                                        </div>
                                                        <div class="form-group col-md-6 mb-50">
                                                            <label for="prenom">Prenom</label>
                                                            <input type="text" class="form-control" name="prenom" id="prenom" placeholder="Prenom" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group mb-50">
                                                        <label class="text-bold-600" for="email">ADRESSE E-MAIL</label>
                                                        <input type="email" class="form-control" name="email" id="email" placeholder="Email" required></div>
                                                    <div class="form-group mb-2">
                                                        <label class="text-bold-600" for="mdp">Mot de passe</label>
                                                        <input type="password" class="form-control" name="mdp" id="mdp" placeholder="Mot de passe" required>
                                                    </div>
                                                    <p class="text-danger">
                                                		<c:out value="${ errMsg }"></c:out>
                                                	</p>
                                                    <button type="submit" class="btn btn-primary glow position-relative w-100">S'INSCRIRE<i id="icon-arrow" class="bx bx-right-arrow-alt"></i></button>
                                                </form>
                                                <hr>
                                                <div class="text-center"><small class="mr-25">Vous avez deja un compte?</small><a href="login"><small>S'identifier</small> </a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 d-md-block d-none text-center align-self-center p-3">
                                    <img class="img-fluid" src="ressources-app/images/pages/register.png" alt="branding logo">
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
    


    <%@ include file="includes/admin/auth-scripts.jsp" %>

</body>

</html>