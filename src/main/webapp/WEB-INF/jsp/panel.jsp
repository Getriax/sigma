<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html">
    <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <link rel="stylesheet" href='<c:url value="/static/css/admin.css"/>'>
        <style type="text/css">
        .row{
        	  width: 100%;
    height: 100%;
        }
        </style>
<title>Sigma - wszystko</title>
</head>
<body>

	
	<container class="container-flex">
            
            <section class="row no-gutters">
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
                            <a href="logout" class="btn btn-danger btn-block" role="button" aria-pressed="true"><strong>Wyloguj</strong></a>
                        </section>
                    </section>
                </header>
                <main class="col col-md-8">
                    <section id="top-row" class="row justify-content-center no-gutters">
                        <section class="col align-self-center text-center">
                            <h2>Panel administracyjny</h2>
                        </section> 
                    </section>
                    <section id="center-row" class="row justify-content-center no-gutters">
                        <section class="col align-self-center text-center">
                            <h1>Witamy w panelu administracyjnym</h1>
                        </section>   
                    </section>
                </main>
            </section>

        </container>
        
       
       
       
       <script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
</body>
</html>