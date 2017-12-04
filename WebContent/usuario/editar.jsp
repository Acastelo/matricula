<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!link rel="stylesheet" ref="${pageContext.request.contextPath }/css/aplicacao.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/global.css" />
	
<style> body{ background:#FFF; margin:0px; } div#menubar1{ float: right; padding: 24px; } div#menubar1 > a{ font-family:Arial, Helvetica, sans-serif; font-size:12px; background: #333; padding: 8px 24px; color:#FFF; margin-right: 3px; text-decoration:none; border-radius: 3px; transition: background 0.3s linear 0s, color 0.3s linear 0s; } div#menubar1 > a:hover{ background: #FF8A00; color:#FFF; } </style>
</head>
<body>
	<c:import url="cabecalho.jsp" />
	<div class="container">
		<div class="page-header">
			<h1>Edição de Usuário</h1>
		</div>
		<c:import url="_form.jsp" />
	</div>
	<c:import url="../rodape.jsp" />
</body>
</html>
