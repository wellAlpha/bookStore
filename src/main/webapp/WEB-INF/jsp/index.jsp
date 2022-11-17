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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>BookStore</title>
</head>

<body>
	<jsp:include page="shared/sidebar.jsp" />
	
	<div class="w3-block w3-center w3-margin">
		<form:form action="${s:mvcUrl('HC#barraDeBusca').build()}" method="POST" modelAttribute="livro">
		<form:input class="w3-input w3-border w3-right" style="width: 30%"
			type="text" path="titulo" method="POST" />

		<button type="submit" class="w3-btn w3-blue  w3-right">Buscar</button>
		</form:form>
	</div>
	<div class="w3-container w3-display-middle">
		<div style="display: flex; justify-content: space-between;">
		
			<c:forEach items="${livros}" var="liv">
				<div class="w3-card-4 w3-margin">
					<img src="${liv.pathFoto}" width="200px" height="200px"> </img>
					<div class="w3-container w3-center margin: 3%;">
						<p>título: ${liv.titulo }</p>
						<p>R$ ${liv.preco}</p>
						<p>páginas: ${liv.paginas}</p>
						<p>autor: ${liv.autor.nome}</p>
					</div>
				</div>
			</c:forEach>
			 
		</div>
	</div>


	<script type="text/javascript" src="resources/js/script.js"></script>
</body>

</html>