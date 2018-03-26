package core;

public class Main {
 
 	public static void main(String[] a){
 		Exp e = new Mult (new Add(new Stala(5), new Zmienna("x")), new Stala(5));
 		System.out.println(e.oblicz());
 	 	e = e.derivative();
 	 	System.out.println(e.toString());
 	 	
 	}
}

