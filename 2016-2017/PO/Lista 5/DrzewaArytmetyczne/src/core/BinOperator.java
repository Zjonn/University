package core;

public abstract class BinOperator implements Exp {
	Exp w1, w2;

	protected abstract String name();

	protected abstract int op(int x, int y);

	public final int oblicz() {
		return op(w1.oblicz(), w2.oblicz());
	}

	@Override
	public final String toString() {
		return w1.toString() + " " + name() + " " + w2.toString();
	}
}
