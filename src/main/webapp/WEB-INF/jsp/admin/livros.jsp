<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<title>Livros</title>

</head>

<body>
	<jsp:include page="../shared/sidebar.jsp" />
	<div class="w3-container w3-display-middle">
		<c:choose>
			<c:when test="${msg != null}">
				<p class="alert alert-success" role="alert">${msg}</p>
			</c:when>
		</c:choose>
		<table class="w3-table-all">
			<thead class="">
				<th><a href="/admin/livro/create"><i
						class="fa fa-plus-circle fa-2x" aria-hidden="true"
						style="color: green;"></i></a></th>
				<th>Título</th>
				<th>Páginas</th>
				<th>Preço</th>
				<th>Destaque</th>
				<th>Ativo</th>
				<th>Autor</th>
				<th>Editora</th>
				<th>Categoria</th>
				<th>Foto</th>
				<th >#</th>

			</thead>
			<tbody>
				<c:forEach items="${livros}" var="liv">
					<tr>
						<td>${liv.id}</td>
						<td>${liv.titulo}</td>
						<td>${liv.paginas}</td>
						<td>${liv.preco}</td>
						<td><c:choose>
								<c:when test="${liv.destaque == true}">
									<i class="fa fa-check-square fa-2x" aria-hidden="true"
										style="color: green; display: flex; align-items: center; justify-content: center;"></i>
								</c:when>
								<c:otherwise>
									<i class="fa fa-window-close fa-2x" aria-hidden="true"
										style="color: red; display: flex; align-items: center; justify-content: center;"></i>
								</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${liv.ativo == true}">
									<i class="fa fa-check-square fa-2x" aria-hidden="true"
										style="color: green; display: flex; align-items: center; justify-content: center;"></i>
								</c:when>
								<c:otherwise>
									<i class="fa fa-window-close fa-2x" aria-hidden="true"
										style="color: red; display: flex; align-items: center; justify-content: center;"></i>
								</c:otherwise>
							</c:choose></td>


						<td>${liv.autor.nome}</td>
						<td>${liv.editora.descricao}</td>
						<td>${liv.categoria.descricao}</td>
						<td>não tem imagem</td>
						<td style="display: flex;"><a
							href="${s:mvcUrl('LC#edit').arg(0, liv.id).build()}"><i
								class="fa fa-edit fa-2x" aria-hidden="true" style="color: blue;"></i></a>
							<c:choose>
								<c:when test="${liv.destaque == true}">
									<a href="${s:mvcUrl('LC#destacar').arg(0, liv.id).build()}">
										<i class="fa fa-eye fa-2x" aria-hidden="true"></i>
									</a>

								</c:when>
								<c:otherwise>
									<a href="${s:mvcUrl('LC#destacar').arg(0, liv.id).build()}">
										<i class="fa fa-eye-slash fa-2x" aria-hidden="true"></i>
									</a>

								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${liv.ativo == true}">
									<a href="${s:mvcUrl('LC#ativar').arg(0, liv.id).build()}">
										<i class="fa fa-toggle-on fa-2x" aria-hidden="true"
										style="color: green;"></i>
									</a>

								</c:when>
								<c:otherwise>
									<a href="${s:mvcUrl('LC#ativar').arg(0, liv.id).build()}">
										<i class="fa fa-toggle-off fa-2x" aria-hidden="true"></i>
									</a>

								</c:otherwise>
							</c:choose>
							
							</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

	</div>
	<script type="text/javascript" src="/resources/js/script.js"></script>
</body>

</html>