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

<title>Livraria Recife</title>
</head>

<body>
	<!--  jsp:include page="shared/sidebar.jsp" -->

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
						placeholder="Busque aqui por título, autor ou editora"
						aria-label="Search" path="titulo" />
					<button class="btn btn-outline-success" type="submit">Buscar</button>
				</form:form>
				<div class=" col-2 d-flex justify-content-center">
					<div class="col-3"><a href="/cart"><i class="fa fa-shopping-cart fa-3x"
						aria-hidden="true"></i></a></div>
						<div class="col-3">
							<a href="/admin/categoria"><i class="fa fa-cog fa-3x" aria-hidden="true"></i></a>
						</div>
					
				</div>
			</div>
		</div>
	</nav>

	<br>
	<br>
	<br>
	<div id="carouselExampleControlsNoTouching" class="carousel slide"
		data-bs-touch="false">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="resources/slides/banner1.png" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="resources/slides/2.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="resources/slides/3.jpg" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControlsNoTouching"
			data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControlsNoTouching"
			data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<br>
	<br>
	<p>
	<h1>Os livros mais vendidos</h1>
	</p>
	<br>
	<div class="row">
		<div style="display: flex; margin-left: 1%">
			<c:forEach items="${livros}" var="liv">
			<div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-6">
				<div class="product-thumb transition">
					<div class="image">
						<a href="${s:mvcUrl('HC#detalhesLivro').arg(0, liv.id).build()}"><img
							width="200" height="200" loading="lazy"
							src="${liv.pathFoto}" class="img-responsive" /></a>
					</div>
					<br>
					<div class="caption">
						<h4 class="text-break">
							<a href="${s:mvcUrl('HC#detalhesLivro').arg(0, liv.id).build()}">${liv.titulo }</a>
						</h4>
						<h4 class="price">
							<b>R$${liv.preco}</b>
						</h4>
						<br>

					</div>
					<div class="button-group">

						<a href="${s:mvcUrl('SCC#cartAdd').arg(0, liv.id).build()}"  class="btn btn-light"type="button" onclick="cart.add('19248335');">
							<i class="fa fa-shopping-cart"></i> <span
								class="hidden-xs hidden-sm hidden-md">Comprar</span>
						</a>

						<button type="button" data-toggle="tooltip"
							title="Lista de desejos" onclick="wishlist.add('19248335');">
							<i class="fa fa-heart"></i>
						</button>
						<!--		
        <button type="button" data-toggle="tooltip" title="Comparar" onclick="compare.add('19248335');"><i class="fa fa-exchange"></i></button>
		-->
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
		
		
			<div class="button-group"></div>

			<script type="text/javascript">
				(function(srcjs) {
					window._edrone = window._edrone || {};
					_edrone.platform = "opencart"
					_edrone.version = "1.0.0"
					_edrone.action_type = "other"
					_edrone.app_id = "63480ff966c5d"
					var product_id = ''
					var url = _edrone.edrone_ajax_shop_url ? _edrone.edrone_ajax_shop_url
							: window.location.origin

					function fetchAPI(url, callback) {
						var request = new XMLHttpRequest();
						request.open('GET', url, true);
						request.onreadystatechange = function() {
							if (this.readyState === 4) {
								if (this.status >= 200 && this.status < 400) {
									callback(JSON.parse(this.responseText))
								}
							}
						};
						request.send();
						request = null;
					}

					window._edrone_send_handler = function() {
						_edrone.first_run = false;
						fetchAPI(
								url
										+ '/index.php?route=extension/module/edrone/getLogginUserDetails',
								function(data) {
									_edrone.email = data.email;
									_edrone.first_name = data.first_name;
									_edrone.last_name = data.last_name;
									_edrone.subscriber_status = data.subscriber_status === 1 ? data.subscriber_status
											: '';
									if (product_id && product_id !== '') {
										fetchAPI(
												url
														+ '/index.php?route=extension/module/edrone/getProductDetails&product_id='
														+ product_id,
												function(data) {
													_edrone.product_ids = data.product_id;
													_edrone.product_titles = data.product_title;
													_edrone.product_images = window.location.origin
															+ '/image/'
															+ data.product_image
													_edrone.product_urls = window.location.href;
													_edrone.product_category_ids = data.product_category_id
													_edrone.product_category_names = data.product_category_name
													_edrone.action_type = 'product_view';
													_edrone.init();

												})
									} else {
										_edrone.init();
									}
								})
					}
					var origOpen = XMLHttpRequest.prototype.open;
					XMLHttpRequest.prototype.open = function() {
						this
								.addEventListener(
										'load',
										function() {
											var self = this;
											if (typeof (self.responseURL) !== 'undefined'
													&& self.responseURL
															.indexOf('checkout/cart/add') !== -1) {
												if (product_id
														&& product_id !== '') {
													_edrone.action_type = 'add_to_cart'
													_edrone.init()
												}
											}
											if (typeof (self.responseURL) !== 'undefined'
													&& self.responseURL
															.indexOf('checkout/confirm') !== -1) {
												fetchAPI(
														url
																+ '/index.php?route=extension/module/edrone/getOrderDetails',
														function(data) {
															localStorage
																	.setItem(
																			'edrone_order',
																			JSON
																					.stringify(data))
															_edrone.action_type = 'order'
															_edrone.email = data.email
															_edrone.first_name = data.first_name
															_edrone.last_name = data.last_name
															_edrone.product_ids = data.product_ids;
															_edrone.product_counts = data.product_counts;
															_edrone.order_id = data.order_id;
															_edrone.country = data.country;
															_edrone.city = data.city;
															_edrone.base_currency = data.base_currency;
															_edrone.order_currency = data.order_currency;
															_edrone.base_payment_value = data.base_payment_value;
															_edrone.order_payment_value = data.order_payment_value;
														})
											}
										});
						origOpen.apply(this, arguments);
					};
					document.addEventListener("click", function(event) {
						var element = event.target
						if (element && element.id === "button-confirm") {
							_edrone.init();
						}
					});

					var doc = document.createElement("script");
					doc.type = "text/javascript";
					doc.async = true;
					doc.src = ("https:" == document.location.protocol ? "https:"
							: "http:")
							+ srcjs;
					var s = document.getElementsByTagName("script")[0];
					s.parentNode.insertBefore(doc, s);
				})("//d3bo67muzbfgtl.cloudfront.net/edrone_2_0.js");
			</script>

			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br>
			<div class="card-body">
				<div style="display: flex; justify-content: space-around;"></div>
			</div>
			<footer>
				<div class="container">
					<div class="row">
						<div class="col-sm-2">
							<h5>Informações</h5>
							<ul class="list-unstyled">
								<li><a href="https://leitura.com.br/quemsomos">Quem
										somos</a></li>
								<li><a
									href="https://leitura.com.br/index.php?route=information/information&amp;information_id=6">Prazos
										de entrega e procedimentos</a></li>
								<li><a
									href="https://leitura.com.br/index.php?route=information/information&amp;information_id=8">Segurança</a></li>
								<li><a
									href="https://leitura.com.br/index.php?route=information/information&amp;information_id=3">Política
										de privacidade</a></li>
								<li><a
									href="https://leitura.com.br/index.php?route=information/information&amp;information_id=5">Política
										de troca</a></li>
								<li><a
									href="https://leitura.com.br/index.php?route=information/information&amp;information_id=9">#Vem
										Para Livraria</a></li>
							</ul>
						</div>
						<div class="col-sm-2">
							<h5>Serviços ao cliente</h5>
							<ul class="list-unstyled">
								<li><a
									href="https://leitura.com.br/index.php?route=information/contact">Fale
										conosco</a></li>
								<!--
          <li><a href="https://leitura.com.br/index.php?route=account/return/add">Solicitar devolução</a></li>
		  -->
								<li><a
									href="https://leitura.com.br/index.php?route=information/sitemap">Mapa
										do site</a></li>
								<li><a target="_blank"
									href="https://institucional.leitura.com.br/lojas">Nossas
										lojas</a></li>
								<li><a target="_blank"
									href="https://institucional.leitura.com.br/eventos">Eventos</a></li>
								<li><a target="_blank"
									href="https://institucional.leitura.com.br/trabalhe-conosco">Trabalhe
										conosco</a></li>
								<li><a target="_blank"
									href="https://institucional.leitura.com.br/#3">Revista</a></li>
								<li><a target="_blank"
									href="https://sempreleitura.leitura.com.br">Sempre Leitura</a></li>
							</ul>
						</div>
						<div class="col-sm-2">
							<h5>Fale conosco</h5>
							<ul class="list-unstyled">
								<li><img width="15" height="14" style="margin-right: 5px;"
									src="image/etc/telephone.png"><a class="nolink">(19)
										3208-1068</a></li>
								<li><img width="15" height="14" style="margin-right: 5px;"
									src="image/etc/whatsapp.png"><a target="_blank"
									href="https://api.whatsapp.com/send?phone=5519989494465">(19)
										98949-4465</a></li>
								<li><img width="15" height="14" style="margin-right: 5px;"
									src="image/etc/mail.png"><a class="nolink">sac@leitura.com.br</a></li>
								<li><a class="nolink">De segunda a sexta-feira, das 8
										às 17h (exceto feriados).</a></li>
							</ul>
						</div>
						<div class="col-sm-2">
							<h5>Minha conta</h5>
							<ul class="list-unstyled">
								<li><a
									href="https://leitura.com.br/index.php?route=account/account">Minha
										conta</a></li>
								<li><a
									href="https://leitura.com.br/index.php?route=account/order">Histórico
										de pedidos</a></li>
								<li><a
									href="https://leitura.com.br/index.php?route=account/wishlist">Lista
										de desejos</a></li>
								<li><a
									href="https://leitura.com.br/index.php?route=account/newsletter">Informativo</a></li>
							</ul>
						</div>
						
				</div>
				<div class="footer-text">
					<p style="text-align: center;">
						www.leitura.com.br<br /> Nosso site é um marketplace e os preços
						podem variar entre as lojas. Os preços e condições de pagamento
						são exclusivos para compras via internet, podendo variar nas lojas
						físicas. <br /> Caso os produtos apresentem divergências de
						valores, o preço válido é o do carrinho de compras. Vendas
						sujeitas a análise e confirmação de dados. <br /> Leitura
						Pontocom LTDA | CNPJ: 31.394.722/0001-00 | 2021 - Todos os
						direitos reservados.
					</p>
				</div>
			</footer>



			<script type="text/javascript" src="resources/js/script.js"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
				crossorigin="anonymous"></script>
</body>

</html>