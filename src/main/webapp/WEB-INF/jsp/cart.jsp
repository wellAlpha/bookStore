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
	<!--<jsp:include page="shared/sidebar.jsp" />-->




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
				<div class="card p-3">
					<p class="card-text">
						<small class="text-muted">
							Subtotal: R$ ${carrinho.getSubTotal()}</small>
					</p>
					<button class="btn btn-primary">Finalizar Compra</button>
				</div>
			</div>
		</div>

	</div>



	<script type="text/javascript" src="resources/js/script.js"></script>
</body>

</html>