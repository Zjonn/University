package core;

public class Core {

	public Core(String[] args) {
		if (args.length != 2) {
			printError();
			return;
		}
		IO io = new IO(args[0]);
		Pojazd p;
		
		switch (args[1].toLowerCase()) {
		case "samochod":	
			p = (Samochod) io.read();
			if (p == null)
				p = new Samochod(args[0]);
			break;
		case "tramwaj":
			p = (Tramwaj) io.read();
			if (p == null)
				p = new Tramwaj(args[0]);
			break;
		default:
			printError();
			return;
		}
	}

	public static void main(String[] args) {
		new Core(args);
	}

	private void printError() {
		System.err.println("Oczekiwane argumenty: nazwaPliku typObiektu");
	}

}
