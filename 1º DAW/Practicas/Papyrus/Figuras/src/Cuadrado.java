public class Cuadrado extends Figura{
    
    public Cuadrado(double ancho){
        super(ancho,ancho);
    }
    @Override
    public double area(){
        double area=ancho*ancho;
        return area;
    }

    @Override
    public double perimetro() {
        double perimetro=ancho*4;
        return perimetro;
    }
}
