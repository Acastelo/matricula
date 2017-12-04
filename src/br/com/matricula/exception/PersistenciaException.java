package br.com.matricula.exception;
/**
 * 
 * Classe respons�vel por encapsular todas exce��es dos banco de dados
 *
 */

public class PersistenciaException extends Exception{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public PersistenciaException(String erro) {
		super(erro);
	}
	
	public PersistenciaException(Exception e) {
		super(e);
	}
	
	public PersistenciaException(String erro, Exception e) {
		super(erro, e);
	}
}
