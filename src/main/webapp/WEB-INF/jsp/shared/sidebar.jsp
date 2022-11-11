<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="w3-sidebar w3-bar-block w3-card w3-animate-left"
	style="display: none" id="leftMenu">
	<button onclick="closeLeftMenu()"
		class="w3-bar-item w3-button w3-large">Close &times;</button>
	<a href="/" class="w3-bar-item w3-button">
	<i class="fa fa-home"
		aria-hidden="true"></i> 
		<span>Home</span>
		</a> 
		<a href="/admin/categoria"
		class="w3-bar-item w3-button">
		<i class="fa fa-server"
		aria-hidden="true"></i> 
		<span>Categorias</span></a> 
		<a
		href="/admin/editora" class="w3-bar-item w3-button">
		<i
		class="fa fa-book" aria-hidden="true"></i> 
		<span>Editoras</span></a> 
		<a
		href="/admin/autor" class="w3-bar-item w3-button"><i
		class="fa fa-users" aria-hidden="true"></i> <span>Autores</span></a> 
		<ul style="list-style-type:nome">
			<c:forEach items="${autores}" var="autor">
				<a href="${s:mvcUrl('HC#buscarLivroPorAutor').arg(0, autor.id).build()}">
					<li>${autor.nome}</li>
				</a>
			</c:forEach>
		</ul> <i class="fa fa-address-book" aria-hidden="true"></i> <span>Livros</span>
		<a
		href="/admin/livro" class="w3-bar-item w3-button">
		
		</a>
</div>

<div class="w3-deep-purple">



	<button
		class="w3-button w3-deep-purple w3-xlarge w3-left w3-hover-none w3-hover-text-orange"
		onclick="openLeftMenu()">&#9776;</button>

	<div class="w3-container">
		<h1>BookStore</h1>

	</div>
</div>

