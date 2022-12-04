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
<title>Cart</title>
</head>

<body>

	<nav class="navbar navbar-expand-lg bg-info">
		<div class="container-fluid">
			<a class="navbar-brand" href="/"><img
				src="/resources/img/livraria.png" alt="" class="responsive-img left"
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


	<div class="container-fluid d-flex justify-content-between">

		<div class="col-3">
			<a href="/"><i class="fa fa-arrow-left fa-3x" aria-hidden="true"></i></a>
		</div>
		<div class="col-3 justify-content-center align-items-center">
			<div class="card mt-4 p-3">
				<figure class="text-center">
					<blockquote class="blockquote">
						<p>Compra finalizada com sucesso.</p>
					</blockquote>
					<figcaption class="blockquote-footer">Agradecemos pela
						parceria e pela preferência! protocolo: ${referencia }</figcaption>
				</figure>
				<ol class="list-group list-group-numbered p-4">
					<c:forEach items="${pedidos}" var="liv">
						<li
							class="list-group-item d-flex justify-content-between align-items-start">
							<div class="ms-2 me-auto">
								<div class="fw-bold">${liv.titulo }</div>
								${liv.autor.nome}
							</div> <span class="badge bg-primary rounded-pill">${carrinho.getTotalPorLivro(liv)}
								x R$ ${liv.preco} -> R$ ${carrinho.getTotalPrecoPorLivro(liv) }</span>
						</li>
					</c:forEach>

				</ol>
				 
				<h5>
					Total: <small class="text-muted">R$ ${carrinho.getSubTotal()}</small>
				</h5>
			</div>
		</div>
		<div class="col-3 ">${carrinho.clear() }</div>

	</div>



	<script type="text/javascript" src="resources/js/script.js"></script>
</body>

</html>