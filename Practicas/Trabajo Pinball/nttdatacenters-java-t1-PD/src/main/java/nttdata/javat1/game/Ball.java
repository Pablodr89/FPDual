package nttdata.javat1.game;
/**
 * 
 * 
 * @author Pablo Dominguez Romero
 *
 */
public class Ball extends Game{
	//Variable para tener un numero de bolas disponibles
	protected int numBalls = 3;

	public Ball(int numBalls) {

		this.numBalls = numBalls;
	}
	
	public Ball() {

	}

	public int getNumBalls() {
		
		return numBalls;
	
	}

	public void setNumBalls(int numBalls) {
		
		this.numBalls = numBalls;
	
	}
	
	
}
