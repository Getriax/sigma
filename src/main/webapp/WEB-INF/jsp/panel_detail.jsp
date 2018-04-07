<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html">
    <meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <link rel="stylesheet" href='<c:url value="/static/css/admin.css"/>'>
<title>Sigma - Admin - ${title}</title>
</head>
<body>
	
	<!-- 	<c:if test="${(empty items) && (not empty fertilizers) || (not empty carbons) || (not empty products)}">
			Nawozy <br/>
			<c:forEach items="${fertilizers}" var="fer" varStatus="i">
				${i.index} ${fer.name} <a href="nawoz-${fer.id}">Edytuj</a><br/>
			</c:forEach>
			Opał <br/>
				<c:forEach items="${carbons}" var="car" varStatus="i">
				${i.index} ${car.name} <a href="nawoz-${car.id}">Edytuj</a> <br/>
			</c:forEach>
			Inne <br/>
			<c:forEach items="${products}" var="pro" varStatus="i">
				${i.index} ${pro.name}  <a href="nawoz-${pro.id}">Edytuj</a> <br/>
			</c:forEach>
		</c:if>
		<c:if test="${(not empty items) || (empty fertilizers) && (empty carbons) && (empty products)}">
			${title} <br/>
			<c:forEach items="${items}" var="item" varStatus="i">
				${i.index + 1} ${item.name} <a href="${edit}-${item.id}">Edytuj</a> <a href="${delete}-${item.id}">Usuń</a> <br/>
			</c:forEach>
			<a href="${link}">Dodaj</a>
		</c:if> -->
		
		<container class="container-flex">
            
            <section class="row no-gutters scroll">
                <header class="col-md-4"> 
                    <section class="row justify-content-center no-gutters" id="top-row">
                        <section class="col align-self-center text-center">
                            <h2>Nawigacja</h2>
                        </section>                        
                    </section>
                    <section class="row justify-content-center no-gutters" id="center-row">
                        <section class="col align-self-top text-center mgn">
                                   <br/>
                            <a href="panel-nawozy" class="btn btn-default btn-block my-btn z-depth-5" role="button" aria-pressed="true"><strong>Nawozy</strong></a>
                            <a href="panel-opal" class="btn btn-default btn-block my-btn" role="button" aria-pressed="true"><strong>Opał</strong></a>
                            <a href="panel-produkty" class="btn btn-default btn-block my-btn" role="button" aria-pressed="true"><strong>Inne</strong></a>                                                                   
                            <a href="${link}" class="btn btn-success btn-block" role="button" aria-pressed="true"><strong>${dodaj}</strong></a>                                      
                            <a href="logout" class="btn btn-danger btn-block" role="button" aria-pressed="true"><strong>Wyloguj</strong></a>
                        
                        </section>
                    </section>
                </header>
                <main class="col col-md-8">
                    <section id="top-row" class="row justify-content-center no-gutters">
                        <section class="col align-self-center text-center">
                            <h2>${title.toUpperCase()}</h2>
                        </section> 
                    </section>
                    <section id="center-row" class="row justify-content-left no-gutters scroll">
                         	
                         
                            <section class="row no-gutters nav-list">
                              <section class="col col-md-1 text-center align-self-top element"><h2><strong>#</strong></h2></section>
                              <section class="col col-md-2 text-center align-self-top element"><h2><strong>Nazwa</strong></h2></section>

                              <section class="col col-md-2 text-center align-self-top element">
                                  
                                 <div class="dropdown">
                                      <button class="btn drop-down dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <h3><strong>Grupa</strong></h3>
                                      </button>
                                      <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                        <c:forEach items="${groups}" var="group">
											<a class="dropdown-item" href="${page}${group.id}" role="button">${group.name}</a>
										</c:forEach>
                                      </div>
                                    </div>
                                  
                            </section>
                              <section class="col col-md-2 text-center align-self-top element"><h2><strong>Zdjęcie</strong></h2></section>
                              
                              <section class="col col-md-2 text-center align-self-top element">
                                <h2><strong>Edytuj</strong></h2>
                              </section>
                              <section class="col col-md-2 text-center align-self-top">
                                <h2><strong>Usuń</strong></h2>
                                </section>
                              
                        
                         
                        <c:forEach items="${items}" var="item" varStatus="i">
						<!--  	${i.index + 1} ${item.name} <a href="${edit}-${item.id}">Edytuj</a> <a href="${delete}-${item.id}">Usuń</a> <br/> -->
						
                             <section class="row no-gutters list">
                              <section class="col-md-1 text-center align-self-center element"><h3><strong>${i.index + 1}</strong></h3></section>
                              <section class="col-md-2 text-center align-self-center element"><h3 class="small"><strong>${item.name}</strong></h3></section>

                              <section class="col-md-2 text-center align-self-center element"><h3 class="small"><strong>                              
                                
								<c:if test="${not empty gname}">${gname}</c:if>
								<c:if test="${empty gname}">${item.group.name}</c:if>
																
                              </strong></h3></section>
                              <section class="col-md-2 text-center align-self-center"><img src="data:image/jpeg;base64,${imgs[i.index]}" class="img-fluid rounded img"></section>
                              
                              <section class="col-md-2 text-center align-self-center mgn">
                                <a href="${edit}-${item.id}" class="btn btn-success btn-block" role="button" aria-pressed="true"><strong>Edytuj</strong></a>
                              </section>
                              <section class="col-md-2 text-center align-self-center">
                                <a class="btn btn-danger btn-block" role="button" href="${delete}-${item.id}" aria-pressed="true"><strong>Usuń</strong></a>
                              </section>
                              </section>
                         </c:forEach>
                              
                             
                        </section>
                       </section>
                    </section>
                </main>
          

        </container>
        
       
       
       
       <script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
</body>
</html>