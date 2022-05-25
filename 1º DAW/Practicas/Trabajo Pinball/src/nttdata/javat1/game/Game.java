package nttdata.javat1.game;

import java.util.ArrayList;
import java.util.Scanner;

abstract class Game {

	protected int hole = 200;
	protected int rebounds = 150;
	protected int runway = 100;
	protected String end = "GAME OVER";
	
	
	public Game(int hole, int runway, int rebounds) {
		
		this.hole = hole;
		this.runway = runway;
		this.rebounds = rebounds;
	}
	
	public Game() {
		
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

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void launchAndStart(int hole, int rebounds, int runway, String end) {
		
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
				
				option = (int) Math.floor((int) 4 * Math.random());
								
				if (option == 0) {
					
					points += (int) options.get(option);
					
					System.out.println("BLOP");
					
				} else if (option == 1) {
					
					points += (int) options.get(option);
					
					System.out.println("PLIM");
					
				} else if (option == 2) {
					
					points += (int) options.get(option);
					
					System.out.println("PLASH");
					
				} else {
					
					System.out.println("OOHHHHHH\n");
					
				}
				
			}while (option != 3);
			
			balls.numBalls -= 1;
			
			if (balls.numBalls == 0) {
				
				System.out.println(end + "\n");
				
			} else {
				
				System.out.println("Te quedan: " + balls.numBalls + " bolas\n");

			}	
		}
		
		System.out.println("Tu puntuacion final es: " + points + " puntos\n");
	}
}
