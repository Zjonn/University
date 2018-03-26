package core;

public class Mult extends BinOperator {
	public Mult(Exp w1, Exp w2) {
		this.w1 = w1;
		this.w2 = w2;
	}


	@Override
	public Exp derivative() {
		return new Add(new Mult(w1.derivative(),w2),new Mult(w1,w2.derivative()));
	}


	@Override
	protected String name() {
		return "*";
	}


	@Override
	protected int op(int x, int y) {
		return x*y;
	}
}
