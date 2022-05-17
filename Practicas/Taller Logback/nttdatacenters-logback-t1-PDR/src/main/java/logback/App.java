package logback;

import java.util.Random;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class App {
	
	private static final Logger LOG = LoggerFactory.getLogger(App.class);
	
    public static void main (String args[]) {
    	
    	for (int i=0; i<5000; i++) {
    		
	    	LOG.info("Metodo MAIN() | TRAZA INICIO");
	    	
	        int cuenta=numAle(1,300);
	        int pago=numAle(cuenta,500);
	        int vuelta=pago-cuenta;    
	        int bimo[]={50,20,10,5,2,1};
	        int n;
        
	        System.out.println("¿Cuanto es la cuenta porfavor?: " + cuenta + " euros");
	        System.out.println("Te doy: " + pago + " euros");
	        System.out.println("¿Cuanto es la vuelta?: " + vuelta + " euros");
	        System.out.println("¿Cuantos billetes y monedas de cada hay que devolver?");
	        
	        for(int j=0;j<bimo.length;j++){
	           
	        	n=vuelta/bimo[j];
	            vuelta=(vuelta%bimo[j]);
	            
	            if(bimo[j]<5){
	                    
	            	System.out.println("Monedas de " + bimo[j] + ": " + n + " monedas");
	                
	            }else{
	            
	            	System.out.println("Billetes de " + bimo[j] + ": " + n + " billetes");
	                
	            }    
	        }
	        LOG.info("Metodo MAIN() | TRAZA FIN");
        }
    }
    public static int numAle(int desde,int hasta){
    
    	LOG.info("Metodo numAle() | TRAZA INICIO");
    	
    	final Random r = new Random();
    	int randomNum = r.nextInt(desde,hasta);
    	LOG.debug("Numero: {}",randomNum);
    	
    	LOG.info("Metodo numAle() | TRAZA FIN");
    	
        return randomNum;
        }

}