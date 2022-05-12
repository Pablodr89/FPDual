package logback;

import java.util.Random;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class App {
	
	private static final Logger LOG = LoggerFactory.getLogger(App.class);
	
    public static void main (String args[]) {
    	
    	LOG.info("Metodo main() | TRAZA INICIO");
    	
        int cuenta=numAle(1,300);
        int pago=numAle(cuenta,500);
        int vuelta=pago-cuenta;    
        int bimo[]={50,20,10,5,2,1};
        int n;
        
        System.out.println("¿Cuanto es la cuenta porfavor?: "+cuenta+" euros");
        System.out.println("Te doy: "+pago+" euros");
        System.out.println("¿Cuanto es la vuelta?: "+vuelta+" euros");
        System.out.println("¿Cuantos billetes y monedas de cada hay que devolver?");
        
        for(int i=0;i<bimo.length;i++){
           
        	n=vuelta/bimo[i];
            vuelta=(vuelta%bimo[i]);
            
            if(bimo[i]<5){
                    
            	System.out.println("Monedas de "+bimo[i]+": "+n+" monedas");
                
            }else{
            
            	System.out.println("Billetes de "+bimo[i]+": "+n+" billetes");
                
            }    
        }
            LOG.info("Metodo main() | TRAZA FIN");
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