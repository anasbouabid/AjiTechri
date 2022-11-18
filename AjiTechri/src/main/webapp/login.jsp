 <!DOCTYPE html>
<html class="loading" lang="fr" data-textdirection="ltr">

<head>
	<%@ include file="includes/admin/auth-head.jsp" %>
	<%@ include file="includes/taglibs.jsp" %>
	
    <title>Login - AjiTechri</title>

</head>


<body class="horizontal-layout horizontal-menu navbar-sticky 1-column   footer-static bg-full-screen-image  blank-page blank-page" data-open="hover" data-menu="horizontal-menu" data-col="1-column">
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <section id="auth-login" class="row flexbox-container">
                <div class="col-xl-8 col-11">
                    <div class="card bg-authentication mb-0">
                        <div class="row m-0">
                            <div class="col-md-6 col-12 px-0">
                                <div class="card disable-rounded-right mb-0 p-2 h-100 d-flex justify-content-center">
                                    <div class="card-header pb-1">
                                        <div class="card-title">
                                            <h4 class="text-center mb-2">Bienvenue</h4>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <form action="login" method="post">
                                                <div class="form-group mb-50">
                                                    <label class="text-bold-600" for="inputEmail">Email</label>
                                                    <input type="email" class="form-control" name="email" id="inputEmail" placeholder="Email" required></div>
                                                <div class="form-group">
                                                    <label class="text-bold-600" for="inputMDP">Mot de passe</label>
                                                    <input type="password" class="form-control" name="mdp" id="inputMDP" placeholder="Mot de passe" required>
                                                </div>
                                                
                                                <p class="text-danger">
                                                	<c:out value="${ errMsg }"></c:out>
                                                </p>
                                                <button type="submit" class="btn btn-primary glow w-100 position-relative">Connexion<i id="icon-arrow" class="bx bx-right-arrow-alt"></i></button>
                                            </form>
                                            <hr>
                                            <div class="text-center"><small class="mr-25">Vous n'avez pas de compte ?</small><a href="register"><small>S'inscrire</small></a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 d-md-block d-none text-center align-self-center p-3">
                                <div class="card-content">
                                    <img class="img-fluid" src="ressources-app/images/pages/login.png" alt="branding logo">
                                </div>
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