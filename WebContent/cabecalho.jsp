<div class="cabecalho">
	<div class="logo">
		<img alt="Logo da Aplicacao" src="images/preMatricula.png" />
	</div>

	<div id="menubar1">
	<a href="${pageContext.request.contextPath }/index.jsp">Home</a>
		<a href="${pageContext.request.contextPath }/usuario?acao=listar">Usuário</a>
		<a href="${pageContext.request.contextPath }/index.jsp">Matricula</a>
		<a href="${pageContext.request.contextPath }/logout.jsp">Sair</a>
	</div>
	
	<div class="boasVindas">
	 Bem-vindo(a), <b style="color: gray">${sessionScope.login}</b>!  
	</div>
</div>