package io;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import test.Test;

/**
 * Klasa zajmuje się generowaniem raportów.
 * 
 * @author Zjonn
 *
 */
public class Raport {

	private String path;
	private final int LINE_MAX_LENGTH = 80;

	/**
	 * 
	 * @param path
	 *            Scieżka do miesjca w którym się znajdujemy.
	 */
	public Raport(String path) {
		this.path = path;
	}

	/**
	 * Zapisuje raport.
	 * 
	 * @param cT
	 *            Liczba poprawnych testów
	 * @param wT
	 *            Liczba niepoprawnych testów
	 * @param eT
	 *            Liczba testów z powtarząjącymi się nazwami
	 * @param aT
	 *            Liczba testów
	 * @param bad
	 *            Lista niepoprawnych testów
	 */
	public void writeRaport(int cT, int wT, int eT, int aT, Test[] bad) {
		File f;
		String nL = System.getProperty("line.separator");

		SimpleDateFormat sdt = new SimpleDateFormat("ddHHmm");
		Calendar calendar = Calendar.getInstance();

		if ((f = new File(path + sdt.format(calendar.getTime()) + ".txt")).exists()) {
			sdt = new SimpleDateFormat("ddHHmm");
			f = new File(path + sdt.format(calendar.getTime()) + ".txt");
		}
		try {
			f.createNewFile();
			Writer w = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(f), "UTF-8"));

			writeLine(w);

			writeText(w);

			writeLine(w);

			w.write("Nie ufać w 100% :D\n");

			writeLine(w);

			w.write("Liczba testów                      : " + aT + nL);
			w.write("Poprawne testy                     : " + cT + nL);
			w.write("Powtarzające się nazwy             : " + wT + nL);
			w.write("Błędne testy                       : " + eT + nL);

			writeLines(w);

			for (Test t : bad) {
				if (!t.isOk()) {

					writeLine(w);

					w.write("Test: \"" + t.getName() + "\" zawiódł.\n");
					w.write("Zwrócony wynik: \"" + t.getResult() + "\"." + nL);
					w.write("Oczekiwany wynik: \"" + t.getExpResult() + "\"" + nL);
					if (t.isFile())
						w.write("Ciało programu: \n" + t.getFileExpr() + "\n");
					else
						w.write("Ciało programu: \n" + t.getExpr() + "\n");

					writeLine(w);
				}
			}
			w.flush();
			w.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * Wypisuje LINE_MAX_LENGTH znaków '-'.
	 * 
	 * @param w
	 *            Writer którego użyć do wypisania
	 * @throws IOException
	 *             Zapis może się nie powieść
	 */
	private void writeLine(Writer w) throws IOException {
		for (int i = 0; i < LINE_MAX_LENGTH; i++) {
			w.write("-");
		}
		w.write(System.getProperty("line.separator"));
	}

	/**
	 * Wypisuje tekst otoczony '-'.
	 * 
	 * @param w
	 *            Writer którego użyć do wypisania
	 * @throws IOException
	 *             Zapis może się nie powieść
	 */
	private void writeText(Writer w) throws IOException {
		int ind = (LINE_MAX_LENGTH / 2) - ("RAPORT".length() / 2) - 1;

		for (int i = 0; i < LINE_MAX_LENGTH; i++) {
			if (i == ind) {
				w.write("RAPORT");
				i += "RAPORT".length();
			}
			w.write("-");
		}
		w.write(System.getProperty("line.separator"));
	}

	/**
	 * Wypisuje n lini znaków '-'.
	 * 
	 * @param w
	 *            Writer którego użyć do wypisania
	 * @throws IOException
	 *             Zapis może się nie powieść
	 */
	private void writeLines(Writer w) throws IOException {
		for (int n = 0; n < 2; n++) {
			for (int i = 0; i < LINE_MAX_LENGTH; i++) {
				w.write("-");
			}
			w.write(System.getProperty("line.separator"));
		}
	}
}
