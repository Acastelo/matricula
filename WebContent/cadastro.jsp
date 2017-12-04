<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pré-Matrícula | Cadastro de Usuário</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/aplicacao.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/cadastro.css" />

</head>
<body>
<% session.invalidate(); %>
 <!--  	<c:import url="cabecalho.jsp" /> -->
	<div class="main">
		<!--WRAPPER-->
	<div id="wrapper">

		<!--CADASTRO FORM-->
		<form name="cadastro-form" class="cadastro-form" action="${pageContext.request.contextPath }/usuario"
			method="post">

			<!--HEADER-->
			<div class="header">
				<!--TITLE-->
				<h1>Cadastro de Matricula</h1>
				<!--END TITLE-->
				<!--DESCRIPTION-->
				
				<span>Realize sua pré-matrícula</span>
				<!--END DESCRIPTION-->
			</div>
			<!--END HEADER-->

			<!--CONTENT-->
			<div class="content">
				<div class="form-group">
				<input type="hidden" name="id" value="${usuario.id }" />
				</div>

				<div class="form-group">
				<input type="hidden" name="nivel" value="0" />
				</div>
		
				<div>
			    <label for="email">Nome</label>
				<input name="nome" id="nome" type="text" class="input nome"	placeholder="Informe seu nome" />
				</div>
				
				<div>
				<label for="email">E-mail</label>					
				<input name="login" id="login" type="text" class="input email"
					placeholder="Informe seu e-mail"  />
				</div>
					
				<div>
				<label for="senha">Digite a Senha  </label>					
				<input name="senha" id="senha" type="password" class="input password"
					placeholder="Digite uma senha"  />
				</div>
				
				<div>
				<label for="confirmarsenha">Confirme Senha</label>					
				<input name="confirmarsenha" type="password" id="confirmarsenha" class="input password"
					placeholder="Repita a senha"  />
				</div>
				<!--END PASSWORD-->
			</div>
			<!--END CONTENT-->

			<!--FOOTER-->
			<div class="footer">
				<!--LOGIN BUTTON-->
				<input type="submit" name="submit" value="Cadastrar" class="button" />
				<!--END LOGIN BUTTON-->
				<!--REGISTER BUTTON-->
				<a class="register" href="login.jsp">Voltar</a>
				<!--END REGISTER BUTTON-->
			</div>
			<!--END FOOTER-->

		</form>
		<!--END LOGIN FORM-->

	</div>
	<!--END WRAPPER-->
		
	</div>
<!-- 	<c:import url="rodape.jsp" />  -->
</body>
</html>