public class Circulo extends Figura{

    private double pi=3.14;
    
    public Circulo(double ancho){
        super(ancho/2,ancho/2);
    }
    @Override
    public double area() {
        double area=ancho*ancho*pi;
        return area;
    }

    @Override
    public double perimetro() {
        double perimetro=2*ancho*pi;
        return perimetro;
    }
}
