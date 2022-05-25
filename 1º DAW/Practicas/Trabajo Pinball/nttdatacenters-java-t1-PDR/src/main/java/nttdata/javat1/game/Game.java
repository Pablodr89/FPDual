package nttdata.javat1.game;

import java.util.ArrayList;
import java.util.Scanner;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * 
 * 
 * @author Pablo Dominguez Romero
 *
 */
abstract class Game {

	private static final Logger LOG = LoggerFactory.getLogger(Game.class);
	//Variables 
	protected int hole = 200;
	protected int rebounds = 150;
	protected int runway = 100;
	protected String end = "GAME OVER";
	
	
	protected Game(int hole, int runway, int rebounds) {
		
		this.hole = hole;
		this.runway = runway;
		this.rebounds = rebounds;
	}
	
	protected Game() {
		
	}

	public int getHole() {
		
		return hole;
	}
	
	public void setHole(int hole) {
		
		this.hole = hole;
	}
	
	public int getRunway() {
		
		return runway;
	}
	
	public void setRunway(int runway) {
		
		this.runway = runway;
	}
	
	public int getRebounds() {
		
		return rebounds;
		
	}
	public void setRebounds(int rebounds) {
		
		this.rebounds = rebounds;
		
	}
	
	public String getEnd() {
		
		return end;
	
	}

	public void setEnd(String end) {
		
		this.end = end;
	
	}
	/**
	 * 
	 * @param hole
	 * @param rebounds
	 * @param runway
	 * @param end
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void launchAndStart(int hole, int rebounds, int runway, String end) {
		//Variables
		Ball balls = new Ball();
		ArrayList options = new ArrayList();
		options.add(hole);
		options.add(rebounds);
		options.add(runway);
		options.add(end);
		int points = 0;
		int option;
		String launch = "";
		
		System.out.println("Empieza el juego, lance la bola pulsando L\n");
		//Bucle para comenzar el juego al pulsar solo la letra L
		while (!launch.equalsIgnoreCase("l")) {
			
			@SuppressWarnings("resource")
			Scanner sc = new Scanner(System.in);
			
			launch = sc.nextLine();
			
			if (!launch.equalsIgnoreCase("l")) {
			
				System.out.println("Pulse L para comenzar por favor\n");
				
			}
			
			System.out.println("Te quedan: " + balls.numBalls + " bolas\n");
		}
		
		System.out.println("PUMM\n");
		
		for (int i = 0; i<3; i++) {
			
			do {
				/*Random para elegir que acciones hace la bola, tiene una probabilidad de 15% de que salga game over, si sale mayor
				de 15 vuelve hacer otro random para elegir la accion de la bola que no sea game over, así el juego dura un poco mas*/
				option = ((int) Math.floor((int) (100 * Math.random())+1) >= 15) ? (int) Math.floor((int) (3 * Math.random())) : 3;
				LOG.debug("Numero : {}", option );
					//Controla, dependiendo de la posicion que coja, que puntuacion toca o si la bola se pierde
					switch (option) {
					case 0:// Opcion
						points += (int) options.get(option);
						System.out.println("BLOP (Agujero)");
						break;
					case 1:
						points += (int) options.get(option);
						System.out.println("PLIM (Rebote)");
						break;
					case 2:
						points += (int) options.get(option);
						System.out.println("PLASH (Pasarela)");
						break;
					case 3:
						System.out.println("OOHHHHHH\n");
						break;
					}
			}while (option != 3);

			balls.numBalls -= 1;
			
			if (balls.numBalls == 0) {
				
				System.out.println(end + "\n");
				
			} else {
				
				System.out.println("Te quedan: " + balls.numBalls + " bolas\n");
				
				System.out.println("PUMM\n");

			}	
		}
		//Termina el juego y printa la puntuacion final
		System.out.println("Tu puntuacion final es: " + points + " puntos\n");
	}
}
