<!DOCTYPE html>
<html class="loading" lang="fr" data-textdirection="ltr">

<head>
	<%@ include file="../includes/admin/head.jsp" %>
    <title>Dashboard - AjiTechri</title>
</head>


<body class="vertical-layout vertical-menu-modern boxicon-layout no-card-shadow 2-columns  navbar-sticky footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">



	<%@ include file="../includes/admin/header.jsp" %>  
	
	  

    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <!-- Dashboard Analytics Start -->
                <section id="dashboard-analytics">
                    <div class="row">
                        <!-- Website Analytics Starts-->
                        
                        <div class="col-12 dashboard-referral-impression">
                            <div class="row">
                            
                            	<div class="col-12">
                                    <div class="card">
                                        <div class="card-content">
                                            <div class="card-body text-center pb-2">
                                                <h2>${ stats.elementAt(2) } MAD</h2>
                                                <span class="text-muted">Total Revenu</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>   
                                
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-content">
                                            <div class="card-body text-center pb-2">
                                                <h2>${ stats.elementAt(3) } MAD</h2>
                                                <span class="text-muted">Total Revenu dernier mois</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
	                            <div class="col-12">
                                    <div class="card">
                                        <div class="card-content">
                                            <div class="card-body donut-chart-wrapper">
                                                <div id="donut-chart" class="d-flex justify-content-center"></div>
                                                <ul class="list-inline d-flex justify-content-around mb-0">
                                                    <li> <span class="bullet bullet-xs bullet-primary mr-50"></span>Hommes</li>
                                                    <li> <span class="bullet bullet-xs bullet-info mr-50"></span>Femmes</li>
                                                </ul>
                                            </div>
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


	
	<%@ include file="../includes/admin/scripts.jsp" %>
	
	
    <script>
    $(window).on("load", function () {

    	  var $primary = '#5A8DEE';
    	  var $success = '#39DA8A';
    	  var $danger = '#FF5B5C';
    	  var $warning = '#FDAC41';
    	  var $info = '#00CFDD';
    	  var $label_color = '#475f7b';
    	  var $primary_light = '#E2ECFF';
    	  var $danger_light = '#ffeed9';
    	  var $gray_light = '#828D99';
    	  var $sub_label_color = "#596778";
    	  var $radial_bg = "#e7edf3";


    	  

    	  
    	  
		  // Sexe stats
		  let nbrHomme = ${ stats.elementAt(0) };
		  let nbrFemme = ${ stats.elementAt(1) };
		  
		  var donutChartOption = {
		    chart: {
		      width: 300,
		      type: 'donut',
		    },
		    dataLabels: {
		      enabled: false
		    },
		    series: [nbrHomme, nbrFemme],
		    labels: ["Hommes", "Femmes"],
		    stroke: {
		      width: 0,
		      lineCap: 'round',
		    },
		    colors: [$primary, $info],
		    plotOptions: {
		      pie: {
		        donut: {
		          size: '75%',
		          labels: {
		            show: true,
		            name: {
		              show: true,
		              fontSize: '15px',
		              colors: $sub_label_color,
		              offsetY: 20,
		              fontFamily: 'IBM Plex Sans',
		            },
		            value: {
		              show: true,
		              fontSize: '26px',
		              fontFamily: 'Rubik',
		              color: $label_color,
		              offsetY: -20,
		              formatter: function (val) {
		                return val
		              }
		            },
		            total: {
		              show: true,
		              label: 'Sexe',
		              color: $gray_light,
		              formatter: function (w) {
		                return w.globals.seriesTotals.reduce(function (a, b) {
		                  return a + b
		                }, 0)
		              }
		            }
		          }
		        }
		      }
		    },
		    legend: {
		      show: false
		    }
		  }
	
		  var donutChart = new ApexCharts(
		    document.querySelector("#donut-chart"),
		    donutChartOption
		  );
		  
		  donutChart.render();
    	  
    	  
    	  
    	  
		
    	});
    </script>
    
    

</body>

</html>