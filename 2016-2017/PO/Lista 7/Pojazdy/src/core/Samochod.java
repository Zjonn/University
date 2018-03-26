package core;

import java.util.ArrayList;

import javax.swing.JPanel;

public class Samochod extends Pojazd {
	
	private static final long serialVersionUID = 5700451802138027716L;

	public Samochod(String path) {
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
		s.add("Mercedes");
		s.add("Avia");
		s.add("Autosan");
		return s;
	}

	@Override
	String className() {
		return "Samochód";
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
