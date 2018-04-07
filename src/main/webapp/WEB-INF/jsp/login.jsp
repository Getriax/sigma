<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html">
    <meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<link rel="stylesheet" href='<c:url value="/static/css/admin.css"/>'>
        
<title>Sigma - Admin login</title>
</head>
<body id="bgcol">
	
        <container class="container-flex">
            
            <section class="row justify-content-center no-gutters" id="main-row">
                	
                    
                   <section class="col col-md-6 align-self-center text-left">
                        
                    
                    <form class="form-inline" name='f' action="perform_login" method='POST'>
                        
                       <label class="sr-only" for="inlineFormInputGroup">Nazwa</label>
                      <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon">L</div>
                        <input type="text" class="form-control form-my" id="inlineFormInput" name="username" placeholder="Login">
                      </div>
                      <label class="sr-only" for="inlineFormInputGroup">Hasło</label>
                      <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon">P</div>
                        <input type="password" class="form-control form-my" id="inlineFormInputGroup" name="password" placeholder="Hasło">
                      </div>
                        <input type="hidden" name="${_csrf.parameterName}"
			             value="${_csrf.token}" />

                      <button type="submit" class="btn btn-primary">Loguj!</button>
                    </form>
                    <c:if test="${error}"> <label id="error"><strong>Podano złe dane logowania</strong></label> </c:if>
                    <c:if test="${logout}"> <label id="logout"><strong>Wylogowano pomyślnie</strong></label> </c:if>
                    </section>
                
                
            </section>
          

        </container>
        
       
       
       
       <script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
    </body>
</html>