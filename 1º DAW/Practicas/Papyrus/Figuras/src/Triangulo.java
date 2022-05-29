public class Triangulo extends Figura {
    
    public Triangulo(double alto,double ancho){
        super(alto,ancho);
    }
    @Override
    public double area() {
        double area=(alto*ancho)/2;
        return area;
    }

    @Override
    public double perimetro() {
        double perimetro=3*ancho;
        return perimetro;
    }
}
