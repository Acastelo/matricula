package br.com.matricula.exception;

public class ControllerException extends Exception{
	
	private static final long serialVersionUID = 1L;

		public ControllerException(Exception e) {
			super(e);
		}
		
}
