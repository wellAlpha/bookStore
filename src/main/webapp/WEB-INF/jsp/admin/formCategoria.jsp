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
<title>Categoria</title>
</head>

<body>
	<jsp:include page="../shared/sidebar.jsp" />
	<div class="w3-container w3-display-middle">
		<c:choose>
			<c:when test="${cat != null}">
				<form:form class="w3-container"
					action="${s:mvcUrl('CC#editCategoriaPost').build()}"
					method="POST" modelAttribute="categoria">
					<form:input type="hidden" path="id" value="${cat.id}" />
					<label class="w3-text-red"><b>Descrição</b></label>
					<form:input class="w3-input w3-border" value="${cat.descricao}" type="text" path="descricao" />

					<form:errors path="descricao" />

					<button class="w3-btn w3-red">Salvar</button>

				</form:form>
			</c:when>
			<c:otherwise>
				<form:form class="w3-container"
					action="${s:mvcUrl('CC#createCategoriaPost').build()}"
					method="POST" modelAttribute="categoria">
					<label class="w3-text-red"><b>Descrição</b></label>
					<form:input class="w3-input w3-border" type="text" path="descricao" />

					<form:errors path="descricao" />

					<button class="w3-btn w3-red">Salvar</button>

				</form:form>
         	</c:otherwise>
		</c:choose>
		

	</div>
	
	<script type="text/javascript" src="/resources/js/script.js"></script>
</body>

</html>