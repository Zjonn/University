package core;

import java.util.Scanner;

public class Zmienna implements Exp {
	String s;

	public Zmienna(String s) {
		this.s = s;
	}

	public int oblicz() {
		System.out.print("Podaj wartoœæ zmiennej " + s + ": ");
		Scanner sr = new Scanner(System.in);
		int x = sr.nextInt();
		sr.close();
		return x;
	}

	@Override
	public String toString() {
		return s;
	}

	@Override
	public Exp derivative() {
		return new Stala(1);
	}
}
