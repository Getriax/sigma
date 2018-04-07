<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html">
	<meta charset="utf-8">
<title>${title.toUpperCase()}</title>
	<link rel="stylesheet" href='<c:url value="/webjars/tether/1.4.0/css/tether.min.css"/>'>
	<link rel="stylesheet" href='<c:url value="/webjars/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"/>'>
	<link rel="stylesheet" href='<c:url value="/static/css/style.css"/>'>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">  
</head>
<body id="bgcont" onload="onLoad()" onresize="onLoad()">
<!-- ---------------------------------------------------------------- Skrypt do zarzadzadnia pozycja drop-down -------------------------------------- -->		
        <script>
        	function onLoad() {
        		if ($(document).width() < 992)
        		{
        			 $("#drop").removeClass("dropdown-menu-right");
                     $("#drop").addClass("dropdown-menu");
        		}
        		else {
                    $("#drop").addClass("dropdown-menu-right");
        		}
			}
        	
            function produkt(url)
            {
                location.href = url;
            }
        </script>

        <container class="container-fluid">
		
            <nav id="scrollspy-nav" class="navbar fixed-top navbar-toggleable-md navbar-light">
                <button class="navbar-toggler navbar-toggler-right mr-4" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                 <a class="navbar-brand" href="sigma"><img src='<c:url value="/static/img/logo-nav.png"/>' class="img-fluid img-logo"></a>
              <div class="collapse navbar-collapse" id="navigation">
                <ul class="navbar-nav">
                  <li class="nav-item nav-el">
                    <a class="nav-link <c:if test="${productId == 1}">active</c:if>" id="link"  href="nawozy">Nawozy <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item nav-el">
                    <a class="nav-link <c:if test="${productId == 2}">active</c:if>" id="link-2" href="opal">Opał</a>
                  </li>
                  <li class="nav-item nav-el">
                    <a class="nav-link <c:if test="${productId == 3}">active</c:if>" id="link-3" href="inne">Inne</a>
                  </li>                                 
                </ul>
				  <!-- If fertilizer show filters -->
                <c:if test="${productId == 1}">
                	<div class="dropdown ml-auto">
	                    <a class="btn btn-secondary dropdown-toggle mr-10" href="https://example.com" id="sort" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        Filtrowanie
	                    </a>
	                    <div class="dropdown-menu dropdown-menu-right" id="drop" aria-labelledby="sort">
	                    <c:forEach items="${groups}" var="group">
	                    
	                    <a class="dropdown-item" href="${sort}${group.id}">${group.name}</a>
	                    
	                    </c:forEach>
	                    
	                     <a class="dropdown-item" href="${title}"><strong>Wszystkie</strong></a>
	                    
	                    </div>
                	</div>
                </c:if>
                
              </div>
                  
                 
            </nav>

  
  
  <!-- -------------------------------------------------------- PRODUKTY ------------------------------------------------------------------ -->
  
  			      
            <c:forEach items="${items}" var="item" varStatus="i">
            
            <div class="row no-gutters justify-content-center <c:if test='${i.index == 0}'>padding-element</c:if> <c:if test='${i.index == items.size() - 1}'>border-b</c:if> element">
<!-- ---------------------------------------------------------------- zdjece pzredmiotu -------------------------------------- -->            
                <div class="col-3 col-sm-3 col-md-3 image-products text-center"> <img src="/static/img/${imgs[i.index]}" class="img-fluid img"> </div>
<!-- ---------------------------------------------------------------- nazwa i grupa przedmiotu -------------------------------------- -->
                <div class="col-6 col-sm-6 col-md-6 name align-self-center text-center">
                    <div class="row no-gutters">
                        <div class="col-12 name"><h2><a href="${link}-${item.id}">${item.name}</a></h2></div>
                        <div class="col-12 group"><h4>
                        	<c:if test="${not empty gname}">${gname}</c:if>
							<c:if test="${empty gname}">${item.group.name}</c:if>
                        </h4></div>
                    </div>
                </div>
                 <div class="col-3 col-sm-3 col-md-3 sklad text-center">
<!-- ---------------------------------------------------------------- Sklad nawozu -------------------------------------- -->                  
                  <c:if test="${productId == 1}">
                 	
                 		 <div class="row no-gutters justify-content-center sklad-section-50">
                 		 	<c:if test="${item.n > 0}">
		                         <div class="col-3 col-sm-3 col-md-2 mr-1 pt-2 skladnik-50 align-self-center">
		                           <p class="lg"><strong>N</strong> ${item.n}%</p>
		                         </div>
	                         </c:if>
	                         <c:if test="${item.p > 0}">
		                         <div class="col-3 col-sm-3 col-md-2 mr-1 pt-2 skladnik-50 align-self-center">
		                           <p class="lg"><strong>P</strong> ${item.p}%</p>
		                         </div>
	                         </c:if>
	                         <c:if test="${item.k > 0}">
		                         <div class="col-3 col-sm-3 col-md-2 mr-1 pt-2 skladnik-50 align-self-center">
		                           <p class="lg"><strong>K</strong> ${item.k}%</p>
		                         </div>
	                         </c:if>
	                     </div>
	                     <div class="row no-gutters justify-content-center sklad-section-50">
	                         <c:if test="${item.mg > 0}">
		                         <div class="col-3 col-sm-3 col-md-2 mr-1 pt-2 skladnik-50 align-self-center">
		                           <p class="lg"><strong>Mg</strong> ${item.mg}%</p>
		                         </div>
	                         </c:if>
	                         <c:if test="${item.ca > 0}">
		                         <div class="col-3 col-sm-3 col-md-2 mr-1 pt-2 skladnik-50 align-self-center">
		                           <p class="lg"><strong>Ca</strong> ${item.ca}%</p>
		                         </div>
	                         </c:if>
	                         <c:if test="${item.s > 0}">
		                         <div class="col-3 col-sm-3 col-md-2 mr-1 pt-2 skladnik-50 align-self-center">
		                           <p class="lg"><strong>S</strong> ${item.s}%</p>
		                         </div>
	                         </c:if>
	                     </div>
                 	
                  </c:if>
<!-- ---------------------------------------------------------------- J/kg -------------------------------------- -->                  
                   <c:if test="${productId == 2}">
                   
                   		<div class="row no-gutters justify-content-center sklad-section-50">
                 		 	<c:if test="${item.j > 0}">
		                         <div class="col-3 col-sm-3 col-md-2 mr-1 pt-2 skladnik-50 align-self-center">
		                           <p class="lg">${item.j} J/kg</p> 
		                         </div>
	                         </c:if>

	                     </div>
                   
                   </c:if>
                 </div>
            </div>
            
            </c:forEach>
              
              
    
    
    </container>




	<script src='<c:url value="/webjars/jquery/3.2.1/jquery.min.js"/>'></script>
	<script src='<c:url value="/webjars/tether/1.4.0/js/tether.min.js"/>'></script>
	<script src='<c:url value="/webjars/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"/>'></script>
</body>
</html>