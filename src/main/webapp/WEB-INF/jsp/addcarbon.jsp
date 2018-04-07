<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <link rel="stylesheet" href='<c:url value="/static/css/admin.css"/>'>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Dodaj opał</title>
</head>
<body>
	<!-- 
	<form:form modelAttribute="carbon" action="perform-opal" method="POST" enctype="multipart/form-data">
		Nazwa: <form:input path="name" type="text"/> <br/>
		Opis: <form:input path="description" type="text"/> <br/>
		Zdjecie główne: <input type="file" name="file"/> <br/>
		Zdjecia <input type="file" name="files" multiple="multiple"/> <br/>
		Grupa: <form:select items="${groups}" path="group.id" itemValue="id" itemLabel="name"></form:select> <br/>
		J/kg: <form:input path="j" type="text"/> <br/>
		<form:hidden path="id"/>
		<form:hidden path="mainImg"/>
		<form:hidden path="imgs"/>
		<input type="submit" value="dodaj"/>
	</form:form>
	<c:forEach items="${carbon.imgs}" var="img">
		${img} <a href="carbon-img-usun?file=${img}&id=${carbon.id}">Usun</a><br/>
	</c:forEach>
	-->
	<script type="text/javascript">
		function submi() {
			if (document.getElementById('req').value != "")
				document.getElementById('sub').submit();
			else
				{
				document.getElementById('req').style.borderColor = "red";
				document.getElementById('req').style.borderWidth = 3 + "px";
				}
				
		}
	</script>
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
                           
                                
                           <div class="row justify-content-center no-gutters hthree">
                            <a href="panel-opal" class="btn btn-primary btn-block" role="button" aria-pressed="true"><strong>Powrót</strong></a>
                            <button onclick="submi()" class="btn btn-success btn-block" aria-pressed="true"><strong>${button}</strong></button>
                        	</div>
                        	<c:if test="${not empty mainimg}">
                        		<div class="row justify-content-center no-gutters hseven">
                           		<div class="col-md-12 hthree">
                           			<br/>
                                   <img src="data:image/jpeg;base64,${mainimg}" class="img-fluid hseven	">
                               </div>
                               </div>
                           </c:if>
                        	
                        </section>
                    </section>
                </header>
                <main class="col col-md-8">
                    <section id="top-row" class="row justify-content-center no-gutters">
                        <section class="col align-self-center text-center">
                            <h2>Dodaj opał</h2>
                        </section> 
                    </section>
                   
                    <section id="center-row" class="row justify-content-center no-gutters">
                         

                            <div class="row no-gutters" id="forms">
                             <div class="col-md-6 align-self-top">
                              <form:form modelAttribute="carbon" id="sub" action="perform-opal" method="POST" enctype="multipart/form-data">
                                 <table class="table table-hover">
                                  <tbody>
                                    <tr>
                                        <td> <form:input id="req" path="name" type="text" required="required" placeholder="Nazwa" class="form-control form-my"/>
                                        	<c:if test="${pageContext.request.method=='POST'}"><form:errors path="name" /></c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                         <td> <p>Zdjęcie główne</p> <input type="file" name="file"></td>
                                    </tr>
                                    <tr>
                                         <td> <p>Pozostałe zdjęcia</p> <input type="file" name="files" multiple="multiple"></td>
                                    </tr>
                                    <tr>
                                         <td> <form:select items="${groups}" path="group.id" itemValue="id" itemLabel="name"></form:select></td>
                                    </tr>
                                    <tr>
                                        <td>                                        
                                        <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                       			 		<div class="input-group-addon">J/Kg</div>
                                    	<form:input type="number" path="j" placeholder="J/Kg" class="form-control form-my form-my"/>
                      					</div>
                                        </td>
                                    </tr>
                                  </tbody>
                                </table>
                                
                             </div>
                             <div class="col-md-6 align-self-top">
                                 <form:textarea path="description" class="form-control" id="texta" rows="17" placeholder="Opis"/>
                             </div>
                             </div>
			                             	<form:hidden path="id"/>
											<form:hidden path="mainImg"/>
											<form:hidden path="imgs"/>
                          		 </form:form>
                           
                           <div class="row no-gutters justify-content-left" id="pictures">
                           
                           <c:if test="${not empty imgs}">
                               <div class="col-md-12 align-self-center scrollx">
                               			<c:forEach items="${imgs}" var="img" varStatus="i">
											
											<img src="data:image/jpeg;base64,${img}" onclick="location.href='opal-img-usun?file=${imgn[i.index]}&id=${carbon.id}'" class="img-fluid myimg" onmouseover="this.src='<c:url value="/static/img/x.png"/>'" onmouseout="this.src='data:image/jpeg;base64,${img}'">
										</c:forEach>
                                   
                               </div>
                           </c:if>
                           </div>  
                    </section>
                       
                </section>
             </main>
          

        </container>
        
       
       
       
       <script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>	
		
</body>
</html>