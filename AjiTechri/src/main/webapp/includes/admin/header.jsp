<div class="header-navbar-shadow"></div>
    <nav class="header-navbar main-header-navbar navbar-expand-lg navbar navbar-with-menu fixed-top ">
        <div class="navbar-wrapper">
            <div class="navbar-container content">
                <div class="navbar-collapse" id="navbar-mobile">
                    <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
                        <ul class="nav navbar-nav">
                            <li class="nav-item mobile-menu d-xl-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ficon bx bx-menu"></i></a></li>
                        </ul>
                    </div>
                    <ul class="nav navbar-nav float-right">
                        <li class="dropdown dropdown-language nav-item">
                        	<a class="dropdown-toggle nav-link" id="dropdown-flag" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="flag-icon flag-icon-fr"></i><span class="selected-language">Français</span></a>
                            
                        </li>
                        <li class="nav-item d-none d-lg-block"><a class="nav-link nav-link-expand"><i class="ficon bx bx-fullscreen"></i></a></li>
                        
                        <li class="dropdown dropdown-user nav-item">
                        	<a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                <div class="user-nav d-sm-flex d-none">
	                                <span class="user-name">${ utilisateur }</span>
	                                <span class="user-status text-muted">${ utilisateur.getPrivilege() }</span>
                                </div>
                                <span>
                                	<img class="round" src="../${ utilisateur.getPhoto() != null ? utilisateur.getPhoto(): 'uploads/avatars/default.png' }" alt="avatar" height="40" width="40">
                               	</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right pb-0">
                            	<a class="dropdown-item" href="/profile"><i class="bx bx-user mr-50"></i>Profile</a>
                            	<div class="dropdown-divider mb-0"></div>
                            	<a class="dropdown-item" href="/home"><i class="bx bx-home mr-50"></i>Accueil</a>
                            	<div class="dropdown-divider mb-0"></div>
                                <a class="dropdown-item" href="/logout"><i class="bx bx-power-off mr-50"></i> Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>




    <div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
        <div class="navbar-header">
            <ul class="nav navbar-nav flex-row">
                <li class="nav-item mr-auto">
                	<a class="navbar-brand" href="/admin">
                        <div class="brand-logo"><img class="logo" src="../ressources-app/images/logo/logo.png" /></div>
                        <h2 class="brand-text mb-0">AjiTechri</h2>
                    </a></li>
                <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="bx bx-x d-block d-xl-none font-medium-4 primary toggle-icon"></i><i class="toggle-icon bx bx-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary" data-ticon="bx-disc"></i></a></li>
            </ul>
        </div>
        <div class="shadow-bottom"></div>
        <div class="main-menu-content">
            <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation" data-icon-style="">
                <li class=" nav-item"><a href="/admin"><i class="bx bx-home-alt"></i><span class="menu-title" data-i18n="Dashboard">Dashboard</span></a></li>
                <li class=" nav-item"><a href="/admin/utilisateurs"><i class="bx bx-user"></i><span class="menu-title" >Utilisateurs</span></a></li>
                <li class=" nav-item"><a href="/admin/categories"><i class="bx bxs-categories"></i><span class="menu-title" >Catégories</span></a></li>
                <li class=" nav-item"><a href="/admin/fournisseurs"><i class="bx bx-truck"></i><span class="menu-title" >Fournisseurs</span></a></li>
                <li class=" nav-item"><a href="/admin/marques"><i class="bx bxl-apple"></i><span class="menu-title" >Marques</span></a></li>
                <li class=" nav-item"><a href="#"><i class="bx bx-shopping-bag"></i><span class="menu-title">Produits</span></a>
                    <ul class="menu-content">
                        <li><a href="/admin/produits"><i class="bx bx-right-arrow-alt"></i><span class="menu-item">Liste Des Produits</span></a></li>
                        <li><a href="/admin/produits_ajouter"><i class="bx bx-right-arrow-alt"></i><span class="menu-item">Ajouter Un Produit</span></a></li>
                        
                    </ul>
                </li>
                <li class=" nav-item"><a href="/admin/commandes"><i class="bx bx-credit-card"></i><span class="menu-title" >Commandes</span></a></li>
            </ul>
        </div>
    </div>
