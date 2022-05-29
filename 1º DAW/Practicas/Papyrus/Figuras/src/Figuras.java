public class Figuras {

    public static void main(String[] args) {
        
        Triangulo Tri=new Triangulo(13,15);
        System.out.println("Las medidas del triangulo son: \n"
                +"Alto: "+Tri.getAlto()+"\n"
                +"Ancho: "+Tri.getAncho()+"\n"
                +"Área: "+Tri.area()+"\n"
                +"Perímetro: "+Tri.perimetro()+"\n");
        
        Cuadrado Cua=new Cuadrado(20);
        System.out.println("Las medidas del cuadrado son: \n"
                +"Lado: "+Cua.getAncho()+"\n"
                +"Área: "+Cua.area()+"\n"
                +"Perímetro: "+Cua.perimetro()+"\n");
        
        Circulo Cir=new Circulo(15);
        System.out.println("Las medidas del círculo son: \n"
                +"Radio: "+Cir.getAncho()+"\n"
                +"Área: "+Cir.area()+"\n"
                +"Perímetro: "+Cir.perimetro()+"\n");
    }
}