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
				src="resources/img/livraria.png" alt="" class="responsive-img left"
				style="max-height: 100px;"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Editora</a>
						<ul class="dropdown-menu">
							<c:forEach items="${editoras}" var="editora">
								<li><a class="dropdown-item"
									href="${s:mvcUrl('HC#buscarLivroPorEditora').arg(0, editora.id).build()}">${editora.descricao}</a></li>
							</c:forEach>

						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Categoria</a>
						<ul class="dropdown-menu">
							<c:forEach items="${categorias}" var="cat">
								<li><a class="dropdown-item"
									href="${s:mvcUrl('HC#buscarLivroPorCategoria').arg(0, cat.id).build()}">${cat.descricao}</a></li>
							</c:forEach>

						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Autor</a>
						<ul class="dropdown-menu">
							<c:forEach items="${autores}" var="autor">
								<li><a class="dropdown-item"
									href="${s:mvcUrl('HC#buscarLivroPorAutor').arg(0, autor.id).build()}">${autor.nome}</a></li>
							</c:forEach>

						</ul></li>
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
		<div class="col-3 justify-content-center">
			<h3 class="display-4">
				Pedidos <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
			</h3>
			<c:forEach items="${books}" var="liv">
				<div class="card mb-3">
					<div class="row g-0">
						<div class="col-md-4">
							<img class="img-fluid rounded-start h-100"
								src="${liv.pathFoto != null ? liv.pathFoto 
								: 
								"http://www.ccta.ufpb.br/labeet/contents/acervos/categorias/cordofones/udecra/sem-imagem.jpg"}"
								>
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">${liv.titulo }</h5>
								<p class="card-text">R$ ${liv.preco}</p>
								<p class="card-text">
									<small class="text-muted">${liv.autor.nome}</small>
								</p>
								<div class="d-flex justify-content-end">
									<div>
										<form:form servletRelativeAction="/cart/livro/update"
											method="post">
											<input type="hidden" name="livroId" value="${liv.id}">
											<input class="w-25 border border-primary text-center"
												id="quantidade" type="number"
												value="${carrinho.getTotalPorLivro(liv)}" min="1"
												name="quantidade">
											<button type="submit" class="fa fa-wrench" aria-hidden="true">
											</button>
										</form:form>
										<p class="card-text">
											<small class="text-muted">R$
												${carrinho.getTotalPrecoPorLivro(liv)}</small>
										</p>
									</div>
									<a href="${s:mvcUrl('SCC#remove').arg(0, liv.id).build()}"><i
										class="fa fa-trash fa" aria-hidden="true"></i></a>

								</div>
							</div>
						</div>
					</div>
				</div>


			</c:forEach>
		</div>
		<div class="col-3 ">
			<div class="row m-2 ">


				<c:choose>
					<c:when test="${books.size() == 0}">

					</c:when>
					<c:otherwise>
						<div class="card p-3">
							<p class="card-text">
								<small class="text-muted"> Subtotal: R$
									${carrinho.getSubTotal()}</small>
							</p>
							<a class="btn btn-primary"
								href="${s:mvcUrl('SCC#finalizacao').build()}">Finalizar
								Compra</a>
						</div>
					</c:otherwise>
				</c:choose>

			</div>
		</div>

	</div>



	<script type="text/javascript" src="resources/js/script.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>

</html>