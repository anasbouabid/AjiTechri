	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,600%7CIBM+Plex+Sans:300,400,500,600,700" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="../ressources-app/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="../ressources-app/vendors/css/charts/apexcharts.css">
    <link rel="stylesheet" type="text/css" href="../ressources-app/vendors/css/extensions/dragula.min.css">
    <link rel="stylesheet" type="text/css" href="../ressources-app/vendors/css/tables/datatable/datatables.min.css">
    <link rel="stylesheet" type="text/css" href="../ressources-app/vendors/css/pickers/daterange/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="../ressources-app/vendors/css/pickers/pickadate/pickadate.css">
	<link rel="stylesheet" type="text/css" href="../ressources-app/vendors/css/extensions/toastr.css">
	<link rel="stylesheet" type="text/css" href="../ressources-app/vendors/css/forms/select/select2.min.css">
    <link rel="stylesheet" type="text/css" href="../ressources-app/vendors/css/forms/spinner/jquery.bootstrap-touchspin.css">
	
                                           
    <link rel="stylesheet" type="text/css" href="../ressources-app/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../ressources-app/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="../ressources-app/css/colors.css">
    <link rel="stylesheet" type="text/css" href="../ressources-app/css/components.css">
    <link rel="stylesheet" type="text/css" href="../ressources-app/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="../ressources-app/css/themes/semi-dark-layout.css">
    <link rel="stylesheet" type="text/css" href="../ressources-app/css/plugins/extensions/toastr.css">
                                                    
    <link rel="stylesheet" type="text/css" href="../ressources-app/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="../ressources-app/css/pages/dashboard-analytics.css">

    <link rel="stylesheet" type="text/css" href="../ressources/css/style.css">
    
    
    <%@ include file="../../includes/taglibs.jsp" %>
	
	<c:if test="${ empty cookie.utilisateurId.getValue() || empty cookie.utilisateurNom.getValue() || empty cookie.utilisateurPrenom.getValue()}">
		<%
			String site = new String("/login");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site); 
		%>
	</c:if>
	
    
