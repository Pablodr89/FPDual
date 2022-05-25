package nttdata.javat1;

import nttdata.javat1.game.Ball;

public class T1MainPDR {

	public static void main (String [] args) {
		
		Ball balls = new Ball();
		
		balls.launchAndStart(balls.getHole(), balls.getRunway(), balls.getRebounds(), balls.getEnd());
		
	}
}
