package nttdata.javat1;

import nttdata.javat1.game.Ball;
/**
 * 
 * @author Pablo Dominguez Romero
 *
 */
public class T1MainPDR {
	/**
	 * 
	 * METODO PRINCIPAL
	 * 
	 * 
	 * @param args
	 */
	public static void main (String [] args) {
		
		//Creacion de objeto para lanzar el metodo para comenzar el juego
		Ball balls = new Ball();
		//Metodo que lanza la pelota y comiendo el juego
		balls.launchAndStart(balls.getHole(), balls.getRunway(), balls.getRebounds(), balls.getEnd());
		
	}
}
