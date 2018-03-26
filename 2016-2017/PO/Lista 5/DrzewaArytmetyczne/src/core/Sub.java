package core;

public class Sub extends BinOperator {
	public Sub(Exp w1, Exp w2) {
		this.w1 = w1;
		this.w2 = w2;
	}

	@Override
	public Exp derivative() {
		return new Sub(w1.derivative(), w2.derivative());
	}

	@Override
	protected String name() {
		return "-";
	}

	@Override
	protected int op(int x, int y) {
		return x - y;
	}
}
