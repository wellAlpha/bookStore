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
<title>BookStore</title>
</head>

<body>
	<jsp:include page="shared/sidebar.jsp" />



	<div clas="card-header">
		<div
			class="container-fluid d-flex align-items-center justify-content-center">
			<div class="col-4"></div>
			<div class="col-3">
				<form:form class="mt-2"
					action="${s:mvcUrl('HC#barraDeBusca').build()}" method="POST"
					modelAttribute="livro">
					<div class="input-group mb-3">
						<form:input class="form-control" style="width: 30%" type="text"
							path="titulo" method="POST" />

						<button type="submit" class="btn btn-outline-secondary">Buscar</button>
					</div>
				</form:form>
			</div>
			<div class="col-4 d-flex justify-content-end">
				<a href="/cart"><i class="fa fa-shopping-cart fa-3x" aria-hidden="true"></i></a>
			</div>

		</div>
		
	</div>
	<div class="card-body">
		<div style="display: flex; justify-content: space-around;">
			<c:forEach items="${livros}" var="liv">

				<div class="card border" style="width: 17rem; height: 5rem">
					<img src="${liv.pathFoto != null ? liv.pathFoto : "
						http://www.ccta.ufpb.br/labeet/contents/acervos/categorias/cordofones/udecra/sem-imagem.jpg"}" style="height: 18rem"
						class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">${liv.titulo }</h5>
						<p class="card-text">R$ ${liv.preco}</p>
						<p class="card-text">${liv.paginas}páginas</p>
						<p class="card-text">Autor: ${liv.autor.nome}}</p>
						<a href="${s:mvcUrl('HC#detalhesLivro').arg(0, liv.id).build()}"
							class="btn btn-primary">Adicionar ao carrinho</a>
					</div>
				</div>


			</c:forEach>

		</div>
	</div>



	<script type="text/javascript" src="resources/js/script.js"></script>
</body>

</html>