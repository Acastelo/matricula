<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="cabecalho">
	<div class="logo">
		<img alt="Logo da Aplicacao" src="images/preMatricula.png" />
	</div>
	
	<div id="menubar1">
	
	<c:if test="${param.acao=='listar'}">
		<a href="${pageContext.request.contextPath }/usuario?acao=incluir">Novo</a>
		<a href="${pageContext.request.contextPath }/index.jsp">Sair</a>							
	</c:if>

    <c:if test="${param.acao=='incluir'}">
    	<a href="${pageContext.request.contextPath }/usuario?acao=listar">Retornar</a>
	</c:if>

   <c:if test="${param.acao=='editar'}">
    	<a href="${pageContext.request.contextPath }/usuario?acao=listar">Retornar</a>
	</c:if>
	
	</div>
							
	<div class="boasVindas">
	 
	Bem-vindo(a), <b style="color: gray">${sessionScope.login}</b>!  
	</div>
</div>