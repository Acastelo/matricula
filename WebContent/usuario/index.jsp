<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!link rel="stylesheet"	href="${pageContext.request.contextPath }/css/aplicacao.css" />
<!link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/global.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/custom.css"  media="screen"/> 

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.js">
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery_002.js">
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery_003.js">
</script>

<style> body{ background:#FFF; margin:0px; } div#menubar1{ float: right; padding: 24px; } div#menubar1 > a{ font-family:Arial, Helvetica, sans-serif; font-size:12px; background: #333; padding: 8px 24px; color:#FFF; margin-right: 3px; text-decoration:none; border-radius: 3px; transition: background 0.3s linear 0s, color 0.3s linear 0s; } div#menubar1 > a:hover{ background: #FF8A00; color:#FFF; } </style>

</head>
<body>
	<c:import url="cabecalho.jsp" />
	<div class="main">
		<div class="page-header">
			<h1>Usuários Cadastrados</h1>
		</div>		
		
		<!table summary="Tabela de dados fictícios" cellspacing="0">
		<table width="100%" border="1" cellspacing="0" cellpadding="5">
			<thead>
				<tr>
				    <th><input value="1" id="marcar-todos" name="marcar-todos" type="checkbox"></th>
					<th class="header">#</th>
					<th class="header">Nome</th>
					<th class="header">Usuário</th>
					<th class="header">Ações</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${usuarios }" var="usuario">
					<tr>
					    
					    <td><input value=${usuario.id } name="marcar[]" type="checkbox"></td>
						<td>${usuario.id }</td>
						<td>${usuario.nome }</td>
						<td>${usuario.login }</td>
						
						  
						<td><a
							href="${pageContext.request.contextPath }/usuario?acao=editar&id=${usuario.id}">
							<img src="images/edit.png" height="16" width="16"></a>
							
						   <a
							href="${pageContext.request.contextPath }/usuario?acao=apagar&id=${usuario.id}">
							<img src="images/delete.png" height="16" width="16"></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
    <div style="top: 467px; position: absolute;" id="pager" class="pager">
    	<form>
				<span>
					Exibir <select class="pagesize">
							<option selected="selected" value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
					</select> registros
				</span>

				<img src="images/first.png" class="first">
    		<img src="images/prev.png" class="prev">
    		<input value="3/3" class="pagedisplay" type="text">
    		<img src="images/next.png" class="next">
    		<img src="images/last.png" class="last">
    	</form>
    </div>
    
    <script>
    $(function(){
      
      $('table > tbody > tr:odd').addClass('odd');
      
      $('table > tbody > tr').hover(function(){
        $(this).toggleClass('hover');
      });
      
      $('#marcar-todos').click(function(){
        $('table > tbody > tr > td > :checkbox')
          .attr('checked', $(this).is(':checked'))
          .trigger('change');
      });
      
      $('table > tbody > tr > td > :checkbox').bind('click change', function(){
        var tr = $(this).parent().parent();
        if($(this).is(':checked')) $(tr).addClass('selected');
        else $(tr).removeClass('selected');
      });
      
      $('form').submit(function(e){ e.preventDefault(); });
      
      $('#pesquisar').keydown(function(){
        var encontrou = false;
        var termo = $(this).val().toLowerCase();
        $('table > tbody > tr').each(function(){
          $(this).find('td').each(function(){
            if($(this).text().toLowerCase().indexOf(termo) > -1) encontrou = true;
          });
          if(!encontrou) $(this).hide();
          else $(this).show();
          encontrou = false;
        });
      });
      
      $("table") 
        .tablesorter({
          dateFormat: 'uk',
          headers: {
            0: {
              sorter: false
            },
            5: {
              sorter: false
            }
          }
        }) 
        .tablesorterPager({container: $("#pager")})
        .bind('sortEnd', function(){
          $('table > tbody > tr').removeClass('odd');
          $('table > tbody > tr:odd').addClass('odd');
        });
      
    });
    </script>  
  
	
	<c:import url="../rodape.jsp" />
</body>
</html>
