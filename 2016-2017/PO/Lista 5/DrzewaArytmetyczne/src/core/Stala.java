package core;

public class Stala implements Exp {
	int val;

	public Stala(int a) {
		val = a;
	}

	public int oblicz() {
		return val;
	}

	public String toString() {
		return Integer.toString(val);
	}

	@Override
	public Exp derivative() {
		return new Stala(0);
	}
}
