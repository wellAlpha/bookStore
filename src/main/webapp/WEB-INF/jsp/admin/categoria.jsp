<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<title>BookStore-Categoria</title>
</head>

<body>
	<jsp:include page="../shared/sidebar.jsp" />
	<div class="w3-container w3-display-middle">
		<table class="w3-table-all">
			<thead class="">
				<th>Id</th>
				<th>Descrição</th>
				<th>Estado</th>
			</thead>
			<tbody>
				<c:forEach items="${categorias}" var="cat">
					<tr>
						<td>${cat.id}</td>
						<td>${cat.descricao}</td>
						<td>
							<c:choose>
								<c:when test="${cat.ativo == true}">
									<p>
										<i class="bi bi-check-lg"></i>
									</p>
								</c:when>
								<c:otherwise>
									<p>								
										<i class="bi bi-x-lg"></i>
									</p>
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