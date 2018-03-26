package core;

import java.util.ArrayList;

import javax.swing.JPanel;

public class Tramwaj extends Pojazd {
	
	private static final long serialVersionUID = 8025506901130148511L;

	public Tramwaj(String path) {
		super(path);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return null;
	}

	@Override
	ArrayList<String> marki() {
		ArrayList<String> s = new ArrayList<String>();
		s.add("105N");
		s.add("Ugears");
		s.add("Solaris");
		return s;
	}

	@Override
	String className() {
		return "Tramwaj";
	}

	@Override
	JPanel userPanel() {
		return null;
	}

	@Override
	void commitData() {

	}
	
	Object getObject() {
		return this;
	}
}
