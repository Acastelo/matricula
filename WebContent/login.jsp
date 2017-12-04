<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pré-Matrícula | Login</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/login.css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.min.js">
</script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/login.js">
</script>

<script language="javascript">
function PrimeiroFocus()
{
  document.login-form.login.focus();
  document.login-form.login.select();
}
</script>
<script>
	function validacao(id){
		var elem = document.getElementById(id);
		if (elem.checkvalidity(id))
			elem.style.borderColor = "blue";
		else		
			elem.style.borderColor ="red";
	}
	
</script>

</head>
<body onLoad="PrimeiroFocus">

	<!--WRAPPER-->
	<div id="wrapper">

		<!--SLIDE-IN ICONS-->
		<div class="user-icon"></div>
		<div class="pass-icon"></div>
		<!--END SLIDE-IN ICONS-->

		<!--LOGIN FORM-->
		<form name="login-form" class="login-form" action="${pageContext.request.contextPath }/login"
			method="post">

			<!--HEADER-->
			<div class="header">
				<!--TITLE-->
				<h1>Sistema de Matricula</h1>
				<!--END TITLE-->
				<!--DESCRIPTION-->
				<span>Realize sua pré-matrícula</span>
				<!--END DESCRIPTION-->
			</div>
			<!--END HEADER-->

			<!--CONTENT-->
			<div class="content">
				<!--USERNAME-->
				<input name="login" type="text" class="input username" 
					placeholder="Email" onfocus="this.value=''" onimput="validacao('input username') " title="test" required 
					pattern="([A-Za-z ]{5,20})" maxlength="20" />
				<!--END USERNAME-->
				<!--PASSWORD-->
				<input name="senha" type="password" class="input password"
					placeholder="Senha" onfocus="this.value=''" onimput="validacao('input password') " required 
					 maxlength="30" />
				<!--END PASSWORD-->
			</div>
			<!--END CONTENT-->

			<!--FOOTER-->
			<div class="footer">
				<!--LOGIN BUTTON-->
				<input type="submit" name="submit" value="Login" class="button" />
				<!--END LOGIN BUTTON-->
				<!--REGISTER BUTTON-->
				<a class="register" href="cadastro.jsp" >Cadastre-se</a>
				<!--END REGISTER BUTTON-->
			</div>
			<!--END FOOTER-->

		</form>
		<!--END LOGIN FORM-->

	</div>
	<!--END WRAPPER-->

	<!--GRADIENT-->
	<div class="gradient"></div>
	<!--END GRADIENT-->



</body>
</html>