package nttdata.javat1.game;

public class Ball extends Game{
	
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
