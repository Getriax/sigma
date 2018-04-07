<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html">
	<meta charset="utf-8">
<title>${title.toUpperCase()}</title>
    <link rel="stylesheet" href='<c:url value="/webjars/tether/1.4.0/css/tether.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/webjars/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/static/css/style.css"/>'>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=yes">
</head>
<body id="bgcont">
<!-- ---------------------------------------------------------------- Skrypt zarzadzajacy wyswietlaniem zdjec -------------------------------------- -->
	<script>
		function setActive(elemenet) {
			var srcs = new Array();
			$(".active-images").removeClass("active-pic");
			$(elemenet).addClass("active-pic");
		}
		function setActiveSlide(number) {
			var currentIndex = $(".carousel-item.active").index();
			$(".active-images").removeClass("active-pic");
			if (currentIndex == 0 && number == -1)
				$(".active-images").eq($(".active-images").length - 1)
						.addClass("active-pic");
			else if (currentIndex == $(".active-images").length - 1
					&& number == 1)
				$(".active-images").eq(0).addClass("active-pic");
			else
				$(".active-images").eq(currentIndex + number).addClass(
						"active-pic");
		}
	</script>
	<container class="container-fluid" id="cont">
		<nav
		id="scrollspy-nav"
		class="navbar fixed-top navbar-toggleable-md navbar-light">
	<button class="navbar-toggler navbar-toggler-right mr-4" type="button"
		data-toggle="collapse" data-target="#navigation"
		aria-controls="navigation" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<a class="navbar-brand" href="sigma"><img
		src='<c:url value="/static/img/logo-nav.png"/>'
		class="img-fluid img-logo"></a>
	<div class="collapse navbar-collapse" id="navigation">
		<ul class="navbar-nav">
			<li class="nav-item nav-el" id="onas"><a
				class="nav-link <c:if test="${productId == 1}">active</c:if>"
				id="link" href="nawozy">Nawozy <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item nav-el"><a
				class="nav-link <c:if test="${productId == 2}">active</c:if>"
				id="link-2" href="opal">Opał</a></li>
			<li class="nav-item nav-el"><a
				class="nav-link <c:if test="${productId == 3}">active</c:if>"
				id="link-3" href="inne">Inne</a></li>
		</ul>
	</div>
	</nav>

	<div class="container" id="main">
		<div class="row no-gutters justify-content-center" id="main-row">
			<div class="col-12 col-sm-12 col-md-12 col-lg-6 h-100">
<!-- ---------------------------------------------------------------- Nazwa przedmiotu -------------------------------------- -->			
				<div id="nazwa"
					class="row no-gutters justify-content-center text-center">
					<h2>${item.name}</h2>
				</div>


<!-- ---------------------------------------------------------------- Sklad nawozu -------------------------------------- -->
				<c:if test="${productId == 1}">
					<div
						class="row no-gutters justify-content-center text-center dodatkowe">
						<c:if test="${item.n > 0}">
							<div
								class="col-3 col-sm-3 col-md-2 mr-1 pt-2 skladnik-50 align-self-center">
								<p class="lg">N ${item.n}%</p>
							</div>
						</c:if>
						<c:if test="${item.p > 0}">
							<div
								class="col-3 col-sm-3 col-md-2 mr-1 pt-2 skladnik-50 align-self-center">
								<p class="lg">P ${item.p}%</p>
							</div>
						</c:if>
						<c:if test="${item.s > 0}">
							<div
								class="col-3 col-sm-3 col-md-2 mr-1 pt-2 skladnik-50 align-self-center">
								<p class="lg">S ${item.s}%</p>
							</div>
						</c:if>
					</div>
					<div
						class="row no-gutters justify-content-center text-center dodatkowe">
						<c:if test="${item.k > 0}">
							<div
								class="col-3 col-sm-3 col-md-2 mr-1 pt-2 skladnik-50 align-self-center">
								<p class="lg">K ${item.k}%</p>
							</div>
						</c:if>
						<c:if test="${item.mg > 0}">
							<div
								class="col-3 col-sm-3 col-md-2 mr-1 pt-2 skladnik-50 align-self-center">
								<p class="lg">Mg ${item.mg}%</p>
							</div>
						</c:if>
						<c:if test="${item.ca > 0}">
							<div
								class="col-3 col-sm-3 col-md-2 mr-1 pt-2 skladnik-50 align-self-center">
								<p class="lg">Ca ${item.ca}%</p>
							</div>
						</c:if>
					</div>

				</c:if>
<!-- ---------------------------------------------------------------- J/kg -------------------------------------- -->				
				<c:if test="${productId == 2}">

					<div
						class="row no-gutters justify-content-center text-center dodatkowe">
						<c:if test="${item.j > 0}">
							<div
								class="col-3 col-sm-3 col-md-2 mr-1 pt-2 skladnik-50 align-self-center">
								<p class="lg">${item.j}J/kg</p>
							</div>
						</c:if>

					</div>

				</c:if>
<!-- ---------------------------------------------------------------- Opis przedmiotu -------------------------------------- -->
				<div id="opis"
					class="row no-gutters justify-content-center text-center">
					<p>${item.description}</p>
				</div>
			</div>
			<div class="col-12 col-sm-12 col-md-12 col-lg-6 h-100 pt-3">
<!-- ---------------------------------------------------------------- Carusel zdjec -------------------------------------- -->			
				<div class="row no-gutters justify-content-center" id="slider">
					<div id="carouselIndicators" class="carousel slide"
						data-ride="carousel" data-interval="0">
						<div class="carousel-inner" role="listbox">
							<c:if test="${not empty mainimg}">
								<div class="carousel-item active">
									<img class="d-block img-fluid col-img"
										src="/static/img/${mainimg}" alt="First slide">
								</div>
							</c:if>
							<c:forEach items="${imgs}" var="img">
								<div class="carousel-item">
									<img class="d-block img-fluid col-img"
										src="/static/img/${img}">
								</div>
							</c:forEach>
						</div>
						<a class="carousel-control-prev" href="#carouselIndicators"
							onclick="setActiveSlide(-1)" role="button" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselIndicators"
							onclick="setActiveSlide(1)" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<div class="row no-gutters justify-content-center" id="preview">
<!-- ---------------------------------------------------------------- Preview zdjec mniej niz 4 -------------------------------------- -->
					<c:if test="${imgs.size() < 5}">
						<c:if test="${not empty mainimg}">
							<div class="col-md-2 col-sm-2 col-3 align-self-center pic"
								data-target="#carouselIndicators" data-slide-to="0">
								<img src="/static/img/${mainimg}"
									class="d-block img-fluid img-prev-2 active-images active-pic"
									onclick="setActive(this)">
							</div>
						</c:if>
						<c:forEach items="${imgs}" var="img" varStatus="i">
							<div class="col-md-2 col-sm-2 col-3 align-self-center pic"
								data-target="#carouselIndicators" data-slide-to="${i.index + 1}">
								<img src="/static/img/${img}"
									class="d-block img-fluid img-prev-2 active-images"
									onclick="setActive(this)">
							</div>
						</c:forEach>
					</c:if>
<!-- ---------------------------------------------------------------- Preview zdjec wiecej niz 4 -------------------------------------- -->
					<c:if test="${imgs.size() > 4}">
						<div class="col-12 scrollx">
							<c:if test="${not empty mainimg}">
								<img src="/static/img/${mainimg}"
									class="img-fluid img-prev active-pic active-images"
									onclick="setActive(this)" data-target="#carouselIndicators"
									data-slide-to="0">
							</c:if>
							<c:forEach items="${imgs}" var="img" varStatus="i">
								<img src="/static/img/${img}"
									class="img-fluid img-prev active-pic active-images"
									onclick="setActive(this)" data-target="#carouselIndicators"
									<c:if test="${not empty mainimg}"> data-slide-to="${i.index + 1}" </c:if>
									<c:if test="${empty mainimg}"> data-slide-to="${i.index}" </c:if>>
							</c:forEach>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>




	</container>


    <script src='<c:url value="/webjars/jquery/3.2.1/jquery.min.js"/>'></script>
    <script src='<c:url value="/webjars/tether/1.4.0/js/tether.min.js"/>'></script>
    <script src='<c:url value="/webjars/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"/>'></script>

</body>
</html>