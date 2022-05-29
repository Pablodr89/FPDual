package Figuras;

import importedTypes.primitivetype.Integer;
import importedTypes.primitivetype.Double;

public abstract class Figura {

	protected Integer coor_x;
	protected Double alto;
	protected Double ancho;
	protected Integer coor_y;
	/**
	 * 
	 * @param alto 
	 * @param ancho 
	 */
	public void Figura(Double alto, Double ancho) {
		null
	 } 
	/**
	 * 
	 * @return 
	 */
	public Integer getCoor_x() {
	 	 return coor_x; 
	}
	/**
	 * 
	 * @param coor_x 
	 */
	public void setCoor_x(Integer coor_x) { 
		 this.coor_x = coor_x; 
	}
	/**
	 * 
	 * @return 
	 */
	public Double getAlto() {
	 	 return alto; 
	}
	/**
	 * 
	 * @param alto 
	 */
	public void setAlto(Double alto) { 
		 this.alto = alto; 
	}
	/**
	 * 
	 * @return 
	 */
	public Double getAncho() {
	 	 return ancho; 
	}
	/**
	 * 
	 * @param ancho 
	 */
	public void setAncho(Double ancho) { 
		 this.ancho = ancho; 
	}
	/**
	 * 
	 * @return 
	 */
	public Integer getCoor_y() {
	 	 return coor_y; 
	}
	/**
	 * 
	 * @param coor_y 
	 */
	public void setCoor_y(Integer coor_y) { 
		 this.coor_y = coor_y; 
	}
	/**
	 * 
	 * @return 
	 */
	abstract Double perimetro();
	/**
	 * 
	 * @return 
	 */
	abstract Double area();
}
