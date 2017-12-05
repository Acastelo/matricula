<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/global.css" />

<style> 
body{ 
	background:#FFF;
	margin:0px;
	}
	 
div#menubar1{ 
	float: right; 
	padding: 24px;
	} 
div#menubar1 > a{ 
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px;
	background: #333;
	padding: 8px 24px;
	color:#FFF;
	margin-right: 3px;
	text-decoration:none;
	border-radius: 3px;
	transition: background 0.3s linear 0s, color 0.3s linear 0s; 
	}
div#menubar1 > a:hover{
	background: #FF8A00;
	color:#FFF; } 
	</style>  

</head>
<body>
	<c:import url="cabecalho.jsp" />
	<div class="main">
	
	
	</div>
	<c:import url="rodape.jsp" />
</body>
</html>