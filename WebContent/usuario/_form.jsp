<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="well bs-component">
	

	<form class="form-horizontal"
		action="${pageContext.request.contextPath }/usuario" method="post">
		
		<table cellpadding="5">
		
			<div class="form-group">
				<input type="hidden" name="id" value="${usuario.id }" />
			</div>
			
			<tr>
				<td><label>Nome:</label></td> 
				<td><input type="text" name="nome" maxlenght="45" value="${usuario.nome }"  /></td>
			</tr>
	       		
			<tr>
				<td><label>Usuário:</label></td>
				<td><input type="text" name="login" maxlenght="11" value="${usuario.login }" /></td>
			</tr>
			
			<tr>
				<td><label>Senha:</label></td> 
				<td><input type="password" name="senha"	 /></td>
			</tr>
			<tr>
				<td><label>Nível de Acesso:</label></td> 
				<td><select class="form-control"
					name="nivel">
					<option value="1">Administrador</option>
					<option value="2">Usuário</option>
				</select></td>
			</tr>	
			
			<tr>
			    <td><a href="${pageContext.request.contextPath }/usuario?acao=listar"">Retornar</a></td>>			
				<td><button type="submit" class="btn btn-info">Gravar</button></td>
			</tr>
			
		</table>		
		
	</form>
</div>