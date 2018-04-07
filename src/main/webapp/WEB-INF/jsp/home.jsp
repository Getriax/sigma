<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<meta charset="utf-8">
<title>Sigma</title>
<!-- >link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous"-->
<link rel="stylesheet" href='<c:url value="/webjars/tether/1.4.0/css/tether.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/webjars/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/static/css/style.css"/>'>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style type="text/css">
#onas {
	max-height: 100vh;
	background: url(<c:url value="/static/img/top-glowna.jpg"/>)
		aliceblue no-repeat;
	background-size: cover;
    background-attachment: fixed;
}

</style>
</head>
<body data-spy="scroll" data-target="#scrollspy-nav" data-offset="100">
	<container class="container-fluid" id="cont"> <nav
		id="scrollspy-nav"
		class="navbar fixed-top navbar-toggleable-md navbar-light">
	<button class="navbar-toggler navbar-toggler-right mr-4" type="button"
		data-toggle="collapse" data-target="#navigation"
		aria-controls="navigation" aria-expanded="false"
		aria-label="Toggle navigation" onclick="navchg()">
		<span class="navbar-toggler-icon"></span>
	</button>
	<a class="navbar-brand" href="/sigma"><img
		src='<c:url value="/static/img/logo-nav.png"/>'
		class="img-fluid img-logo"></a>
	<div class="collapse navbar-collapse" id="navigation">
		<ul class="navbar-nav">
			<li class="nav-item nav-el"><a class="nav-link"
				id="link" href="#onas" onclick="linkKlik()">O nas <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item nav-el"><a class="nav-link" id="link-2"
				href="#oferta" onclick="linkKlik()">Oferta</a></li>
			<li class="nav-item nav-el"><a class="nav-link" id="link-3"
				href="#cennik" onclick="linkKlik()">Cennik</a></li>
			<li class="nav-item nav-el"><a class="nav-link" id="link-4"
				href="#kontakt" onclick="linkKlik()">Kontakt</a></li>
		</ul>
	</div>
	</nav> <!--<article data-spy="scroll" data-target="#scrollspy-nav" data-offset="0" style="width: 100%;height: 100%;">-->


	<!-- -------------------------------------------------------- O NAS ------------------------------------------------------------------ -->

	<section id="onas"
		class="row no-gutters justify-content-center text-center">
	<div class="col-12 align-self-center text-center" id="logo">
		<img src='<c:url value="/static/img/logo.png"/>'
			class="img-fluid my-img">
	</div>
	<div class="col-11 align-self-center pl-5 pr-5" id="us">
		<p>Firma SIGMA od 20 lat, z sukcesem prowadzi działaloność na rynku rolnym.</p><p class="m-0"> Naszą główną
		domeną jest zaopatrywanie rolników w <strong>nawozy sztuczne</strong>.</p><p class="m-0"> Współpracujemy z wiodącymi firmami z branży
		rolnej zarówno w kraju jak i za granicą.</p> <br/>
		<p>Dla gospodarstw domowych i rolnych oferujemy również wysokiej jakości <strong>węgiel</strong> z czołowych
		polskich kopalni.</p>
	</div>
	</section>
	<!-- ------------------------------------------------------------------- PRODUKTY KOMPUTER ------------------------------------------------------------------ -->
	<section id="oferta" class="row no-gutters justify-content-center hidden-md-down pt-3">
		<div class="row no-gutters justify-content-center" id="produkty-desktop">
			<div class="produkt-desktop col-md-3 mr-1 px-2">
				<div class="row no-gutters justify-content-center">
					<div class="col-md-12 car-img ">
						<div id="carouselExampleSlidesOnly" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner" role="listbox">
								<div class="carousel-item active justify-content-center">
									<img class="d-block img-fluid img-product-d"
										src='<c:url value="/static/img/sal.png"/>'>
								</div>
								<div class="carousel-item justify-content-center">
									<img class="d-block img-fluid img-product-d"
										src='<c:url value="/static/img/polifoska-6.png"/>'>
								</div>
								<div class="carousel-item justify-content-center">
									<img class="d-block img-fluid img-product-d"
										src='<c:url value="/static/img/wpa-mag.png"/>'>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 mt-1 text-center">
						<a href="nawozy" class="btn products-btn" role="button"><strong>Nawozy</strong></a>
					</div>
				</div>
			</div>
			<div class="produkt-desktop col-md-3 ml-1 mr-1 px-2" >
				<div class="row no-gutters justify-content-center">
					<div class="col-md-12 car-img">
						<div id="carouselExampleSlidesOnly" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner" role="listbox">
								<div class="carousel-item active justify-content-center">
									<img class="d-block img-fluid img-product-d"
										src='<c:url value="/static/img/ekogroszek.png"/>'>
								</div>
								<div class="carousel-item justify-content-center">
									<img class="d-block img-fluid img-product-d"
										src='<c:url value="/static/img/orzech.png"/>'>
								</div>
								<div class="carousel-item justify-content-center">
									<img class="d-block img-fluid img-product-d"
										src='<c:url value="/static/img/mial.png"/>'>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 mt-1 text-center">
						<a href="opal" class="btn products-btn" role="button"><strong>Opał</strong></a>
					</div>
				</div>
			</div>
			<div class="produkt-desktop col-md-3 ml-1 px-2">
				<div class="row no-gutters justify-content-center">
					<div class="col-md-12 car-img">
						<div id="carouselExampleSlidesOnly" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner" role="listbox">
								<div class="carousel-item active justify-content-center">
									<img class="d-block img-fluid img-product-d"
										src='<c:url value="/static/img/gaz.png"/>'>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 mt-1 text-center">
						<a href="inne" class="btn products-btn" role="button"><strong>Pozostałe</strong></a>
					</div>
				</div>
			</div>
		</div>

	</section>




	 <!-- -------------------------------------------------------- PRODUKTY MOBLINE ------------------------------------------------------------------ -->

	<section id="oferta" class="row no-gutters justify-content-center hidden-lg-up clearfix">
	<!-- --------------------------------------- NAWOZY ------------------------------------------------------------------ -->
	<div class="row no-gutters of-produkt mt-4" name="nawozy">

		<div class="col-sm-6 col-6 align-self-center pimages">
			<div id="carouselExampleSlidesOnly" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active justify-content-center">
						<img class="d-block img-fluid img-product"
							src='<c:url value="/static/img/sal.png"/>'>
					</div>
					<div class="carousel-item justify-content-center">
						<img class="d-block img-fluid img-product"
							src='<c:url value="/static/img/polifoska-6.png"/>'>
					</div>
					<div class="carousel-item justify-content-center">
						<img class="d-block img-fluid img-product"
							src='<c:url value="/static/img/wpa-mag.png"/>'>
					</div>
				</div>
			</div>
		</div>
		<div
			class="col-sm-6 col-6 text-center align-self-center">
				<h2>
					Nawozy
				<h2>
		</div>
	</div>

	<!-- --------------------------------------- OPAL ------------------------------------------------------------------ -->
	<div class="row no-gutters of-produkt mt-4" name="opal">

		<div class="col-sm-6 col-6 align-self-center pimages">
			<div id="carouselExampleSlidesOnly" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active justify-content-center">
						<img class="d-block img-fluid img-product"
							src='<c:url value="/static/img/ekogroszek.png"/>'>
					</div>
					<div class="carousel-item justify-content-center">
						<img class="d-block img-fluid img-product"
							src='<c:url value="/static/img/orzech.png"/>'>
					</div>
					<div class="carousel-item justify-content-center">
						<img class="d-block img-fluid img-product"
							src='<c:url value="/static/img/mial.png"/>'>
					</div>
				</div>
			</div>
		</div>
		<div
			class="col-sm-6 col-6 text-center align-self-center">
				<h2>
					Opal
				<h2>
		</div>
</div>
	<!-- --------------------------------------- INNE ------------------------------------------------------------------ -->
	<div class="row no-gutters of-produkt mt-4" name="inne">

		<div class="col-sm-6 col-6 align-self-center pimages">
			<div id="carouselExampleSlidesOnly" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active justify-content-center">
						<img class="d-block img-fluid img-product"
							src='<c:url value="/static/img/gaz.png"/>'>
					</div>
				</div>
			</div>
		</div>
		<div
			class="col-sm-6 col-6 text-center align-self-center">
				<h2>
					Pozostałe
				<h2>
		</div>
	</div>	
	</section>
	<!-- -------------------------------------------------------- CENNIK ------------------------------------------------------------------ -->
	<section id="cennik" class="row no-gutters d-flex justify-content-center">
	<div class="hidden-md-down col-md-4 col-lg-4 text-center align-self-center">
		<h3>Masz pytanie?</h3>
		<p>
			Wyślij nam zapytanie za pomocą formularza.
		</p>
		<P>
			Możesz się również skontaktować z nami telefonicznie.
		</P>
	</div>
	<div class="col-10 col-sm-9 col-md-7 col-lg-6 text-center align-self-center" id="msg-form">

			<form action="/wiadomosc" method="GET" id="message">

					<p class="formularz">Imie i nazwisko</p>
					<div class="form-group has-warning zap" id="imieDiv">
						<input type="text" name="imie"
							class="form-control form-control-warning zap" id="imie"
							onchange="checkImie()" onfocusout="chcekBeforeSubmit()">
					</div>
					<p class="formularz">Email</p>
					<div class="form-group has-warning zap" id="emailDiv">
						<input type="text" name="email"
							class="form-control form-control-warning zap" id="email"
							onchange="checkEmail()" onfocusout="chcekBeforeSubmit()">
					</div>
					<p class="formularz">Zapytanie</p>
					<div class="form-group zap">
						<textarea name="text" class="form-control zap" id="text"
							onfocusout="chcekBeforeSubmit()"></textarea>
					</div>
					<div class="form-group zap">
						<input type="button" value="Wyślij"
							class="btn btn-secondary disabled zap mt-3" onclick="send()" id="sub">
					</div>

			</form>

	</div>
	</section>
	 <!-- -------------------------------------------------------- KONTAKT ------------------------------------------------------------------ -->

	<section id="kontakt" class="row no-gutters justify-content-center">
	<div class="col-lg-5 col-md-12 col-12 col-sm-12 mb-2" id="mapa"></div>
	<div class="col-lg-4 offset-lg-1 col-md-12 col-12 col-sm-12 align-self-center">
		<div class="row no-gutters justify-content-center">
			<div
				class="col-lg-12 col-md-6 col-6 sol-sm-6 align-self-center text-center">
				<h4><strong>Dane kontaktowe</strong></h4>
				<p>SIGMA</p>
				<p><strong>Ulica</strong> Kolejowa 4</p>
				<p>89-400 Sępólno Krajeńskie</p>
				<p><strong>NIP</strong> : 555 109 94 16</p>
			</div>
			<div
				class="col-lg-12 col-md-6 col-6 col-sm-6 align-self-center text-center">

				<p><strong>Tel. kom. 1</strong> : +48 609 028 018 </p>
				<p><strong>Tel. kom. 2</strong> : +48 609 028 016</p>
				<p><strong>Tel. biuro</strong> : 52 388 19 50</p>
				<p><strong>E-mail</strong> : sigma.sigma@wp.pl</p>
			</div>
		</div>
	</div>
	</section> <!-- -------------------------------------------------------- STOPKA ------------------------------------------------------------------ -->

	<section class="row no-gutters" id="footer-home">

			<div class="col-6 text-left align-self-center"><p class="ml-1">&copy Sigma Sławomir Strawa</p></div>
			<div class="col-6 text-right align-self-center"><p class="small"> autor: <strong>s.nikodem@wp.pl</strong></p></div>


	</section>
</container>




	<script src='<c:url value="/webjars/jquery/3.2.1/jquery.min.js"/>'></script>
	<script src='<c:url value="/webjars/tether/1.4.0/js/tether.min.js"/>'></script>
	<script src='<c:url value="/webjars/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"/>'></script>
	<script src='<c:url value="/static/js/main.js"/>'></script>
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBh_PUKSWGzID4pyxOReX_9e8NaM7PaIi8&sensor=false"></script>


</body>
</html>
