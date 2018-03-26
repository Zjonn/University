package core;

public class Div extends BinOperator {
	public Div(Exp w1, Exp w2) {
		this.w1 = w1;
		this.w2 = w2;
	}

	@Override
	public Exp derivative() {
		return new Div(new Sub(new Mult(w1.derivative(), w2), new Mult(w1, w2.derivative())),
				new Mult(w2, w2));
	}

	@Override
	protected String name() {
		return "/";
	}

	@Override
	protected int op(int x, int y) throws ArithmeticException {
		if (y == 0)
			throw new ArithmeticException("Nie mo¿na dzieliæ przez zero!");
		return x / y;
	}
}
