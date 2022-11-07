<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<title>Livros</title>
</head>

<body>
	<jsp:include page="../shared/sidebar.jsp" />
	<div class="w3-container w3-display-middle w3-section">
		<c:choose>
			<c:when test="${liv != null}">
				<div class="w3-container w3-section">
					<div class="w3-card w3-margin-top">
						<form:form class="w3-container"
							action="${s:mvcUrl('LC#editPost').build()}"
							method="POST" modelAttribute="livro" enctype="multipart/form-data">

							<form:input type="hidden" path="id" value="${liv.id}" />
							<div class="w3-row w3-margin">
								<label class="w3-text-red"><b>Título</b></label>
								<form:input class="w3-input w3-border" value="${liv.titulo}"
									type="text" path="titulo" />
								<form:errors path="titulo" />
							</div>
							<div class="w3-row w3-margin">
								<label class="w3-text-red"><b>Páginas</b></label>
								<form:input class="w3-input w3-border" value="${liv.paginas}"
									type="number" path="paginas" />
								<form:errors path="paginas" />
							</div>
							<div class="w3-row w3-margin">
								<label class="w3-text-red"><b>Preço</b></label>
								<form:input class="w3-input w3-border" value="${liv.preco}"
									min="1" step="any" type="number" path="preco" />
								<form:errors path="preco" />
							</div>

							<div class="w3-row w3-margin">
								<div class="w3-col m4 l3">
									<label class="w3-text-red"><b>Categorias</b></label>
									<form:select path="categoria" class="custom-select"
										style="width:100px;">
										<form:option value=""> --SELECT--</form:option>
										<form:options items="${categorias}" value="${liv.categoria}"
											itemLabel="descricao"></form:options>
									</form:select>
									<p>
										<form:errors path="categoria" />
									</p>
								</div>

								<div class="w3-col m4 l3">
									<label class="w3-text-red"><b>Editoras</b></label>
									<form:select path="editora" class="custom-select"
										style="width:100px;">
										<form:option value=""> --SELECT--</form:option>
										<form:options items="${editoras}" itemLabel="descricao"></form:options>
									</form:select>
									<form:errors path="editora" />
								</div>


								<div class="w3-col m4 l3">
									<label class="w3-text-red"><b>Autores</b></label>
									<form:select path="autor" class="custom-select"
										style="width:100px;">
										<form:option value=""> --SELECT--</form:option>
										<form:options items="${autores}" itemLabel="nome"></form:options>
									</form:select>
									<form:errors path="autor" />
								</div>
								<div class="w3-row m4 l3">
									<input type="file" name="file" />
								</div>
							</div>

							<button class="w3-btn w3-red w3-margin-bottom">Salvar</button>

						</form:form>
					</div>
				</div>

			</c:when>
			<c:otherwise>
				<div class="w3-container w3-section">
					<div class="w3-card w3-margin-top">
						<form:form class="w3-container w3-margin"
							action="${s:mvcUrl('LC#create').build()}" method="POST"
							modelAttribute="livro" enctype="multipart/form-data">
							<div class="w3-row w3-margin">
								<label class="w3-text-red"><b>Título</b></label>
								<form:input class="w3-input w3-border" value="${liv.titulo}"
									type="text" path="titulo" />
								<form:errors path="titulo" />
							</div>
							<div class="w3-row w3-margin">
								<label class="w3-text-red"><b>Páginas</b></label>
								<form:input class="w3-input w3-border" value="${liv.paginas}"
									type="number" path="paginas" />
								<form:errors path="paginas" />
							</div>
							<div class="w3-row w3-margin">
								<label class="w3-text-red"><b>Preço</b></label>
								<form:input class="w3-input w3-border" min="1" step="any"
									type="number" path="preco" />
								<form:errors path="preco" />
							</div>

							<div class="w3-row w3-margin">
								<div class="w3-col m4 l3">
									<label class="w3-text-red"><b>Categorias</b></label>
									<form:select path="categoria" class="custom-select"
										style="width:100px;">
										<form:option value=""> --SELECT--</form:option>
										<form:options items="${categorias}" itemLabel="descricao"></form:options>
									</form:select>
									<p>
										<form:errors path="categoria" />
									</p>
								</div>

								<div class="w3-col m4 l3">
									<label class="w3-text-red"><b>Editoras</b></label>
									<form:select path="editora" class="custom-select"
										style="width:100px;">
										<form:option value=""> --SELECT--</form:option>
										<form:options items="${editoras}" itemLabel="descricao"></form:options>
									</form:select>
									<form:errors path="editora" />
								</div>


								<div class="w3-col m4 l3">
									<label class="w3-text-red"><b>Autores</b></label>
									<form:select path="autor" class="custom-select"
										style="width:100px;">
										<form:option value=""> --SELECT--</form:option>
										<form:options items="${autores}" itemLabel="nome"></form:options>
									</form:select>
									<form:errors path="autor" />
								</div>
								<div class="w3-row m4 l3">
									<input type="file" name="file" />
								</div>
							</div>

							<button class="w3-btn w3-red w3-margin-bottom">Salvar</button>

						</form:form>
					</div>

				</div>
			</c:otherwise>
		</c:choose>


	</div>

	<script type="text/javascript" src="/resources/js/script.js"></script>
</body>

</html>