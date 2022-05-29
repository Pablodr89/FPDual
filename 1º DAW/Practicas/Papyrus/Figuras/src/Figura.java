public abstract class Figura {

    protected int coor_x;
    protected int coor_y;
    protected double ancho;
    protected double alto;
    
    public Figura(double alto,double ancho){
        this.alto=alto;
        this.ancho=ancho;
    }
    public int getCoor_x() {
        return coor_x;
    }
    public void setCoor_x(int coor_x) {
        this.coor_x = coor_x;
    }
    public int getCoor_y() {
        return coor_y;
    }
    public void setCoor_y(int coor_y) {
        this.coor_y = coor_y;
    }
    public double getAncho() {
        return ancho;
    }
    public void setAncho(double ancho) {
        this.ancho = ancho;
    }
    public double getAlto() {
        return alto;
    }
    public void setAlto(double alto) {
        this.alto = alto;
    }
    abstract double area();
    abstract double perimetro();
}
