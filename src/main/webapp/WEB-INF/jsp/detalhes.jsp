<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<title>Detalhe Livro</title>
</head>

<body>
	<!--  jsp:include page="shared/sidebar.jsp" -->

	<nav class="navbar navbar-expand-lg bg-info">
		<div class="container-fluid">
			<a class="navbar-brand" href="/"><img
				src="/resources/img/livraria.png" alt="class=" responsive-img
				left"
				style="max-height: 100px;"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					
				</ul>
				<form:form class="d-flex" role="search"
					action="${s:mvcUrl('HC#barraDeBusca').build()}" method="POST"
					modelAttribute="livro">
					<form:input class="form-control me-2" type="search"
						placeholder="Search" aria-label="Search" path="titulo" />
					<button class="btn btn-outline-success" type="submit">Buscar</button>
				</form:form>
				<div class=" col-2 d-flex justify-content-center">
					<a href="/cart"><i class="fa fa-shopping-cart fa-3x"
						aria-hidden="true"></i></a>
				</div>

			</div>
		</div>
	</nav>

	<br>
	<br>
	<br>

	<div class="row">
		<div class="col"></div>
		<div class="col">
			<div class="card mb-3" style="max-width: 540px;">
				<div class="row g-0">
					<div class="col-md-4">
						<img class="img-fluid rounded-start"
							src="/${livro.pathFoto}" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title text-wrap">${livro.titulo}</h5>
							<p class="card-text text-truncate">De modo geral, buscamos a ajuda de um
								terapeuta para melhor compreender as angústias, os medos, a
								culpa ou quaisquer outros sentimentos que nos causam desconforto
								e sofrimento. Mas quantos de nós já paramos para perguntar: o
								terapeuta está imune à gama de questões que ele auxilia seus
								pacientes a dirimir e superar, dia após dia? A autora
								best-seller e terapeuta Lori Gottlieb nos mostra que a resposta
								a essa pergunta traz revelações surpreendentes. Quando ela se vê
								emocionalmente incapaz de gerenciar uma situação que perturba
								sua vida, uma amiga lhe faz uma sugestão: talvez você deva
								conversar com alguém. Combinando histórias reunidas a partir de
								sua rica trajetória como terapeuta (distribuídas entre quatro
								personagens inesquecíveis) à sua própria experiência como
								paciente, Lori nos oferece um relato afetuoso, leve e comovente
								sobre a universalidade de nossas perguntas e ansiedades, e joga
								luz sobre o que há de mais misterioso em nós, afirmando nossa
								capacidade de mudar nossas vidas. Uma jornada emocionante de
								autodescoberta, uma homenagem à natureza humana e um lembrete
								sobre a importância de sermos ouvidos, mas também de sabermos
								ouvir. Um livro sobre a importância dos encontros, dos afetos e
								da coragem de todos os que partimos para a aventura do
								autoconhecimento.</p>
								<p class="card-text">R$ ${{livro.preco}}</p>
							<p class="card-text">
								<a href="${s:mvcUrl('SCC#cartAdd').arg(0, livro.id).build()}"
									class="btn btn-primary">Adicionar ao carrinho</a>
							</p>
						</div>
					</div>
				</div>
			</div>

			<div clas="card-header">
				<div
					class="container-fluid d-flex align-items-center justify-content-center">
					<div class="col-4"></div>
					<div class="col-3"></div>


				</div>

			</div>
			<div class="card-body">
				<div style="display: flex; justify-content: space-around;"></div>
			</div>
		</div>
		<div class="col"></div>
	</div>



	<script type="text/javascript" src="/resources/js/script.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>

</html>