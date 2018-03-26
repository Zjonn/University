package io;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.LinkedList;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import core.Tokenizer;
import core.TokensWorker.Token;
import test.Test;
import test.TestPP;

/**
 * Klasa zajmuje się czytaniem pliku {Imie}{Nazwisko}Tests.hs.
 * 
 * @author Zjonn
 *
 */
public class ParseTests {
	Scanner s;
	Tokenizer t;
	String testsPattern, testStart;

	/**
	 * Ustawiam scieżkę do testów oraz tokeny jakich mogę się spodziewać.
	 * 
	 * @param s
	 *            Scieżka do testów
	 * @param test
	 *            "Pust" obiekt z test
	 */
	public ParseTests(String s, Test test) {
		t = new Tokenizer();
		testStart = test.getTokens()[0];
		testsPattern = test.getPattern();
		initTokenizer(test.getTokens());
		try {
			this.s = new Scanner(new File(s));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Wpisuję możliwe tokeny do listy tokenów.
	 * 
	 * @param tok
	 *            Lista tokenów
	 */
	private void initTokenizer(String[] tok) {
		int i = 0;
		for (String s : tok) {
			t.add(s, i);
			i++;
		}
	}

	/**
	 * Parsuję plik z testami.
	 * 
	 * @return Lista testów
	 */
	public Test[] parse() {
		String str = "";
		while (s.hasNextLine()) {
			str += readLine(s);
		}

		Pattern r = Pattern.compile(testsPattern);
		Matcher m = r.matcher(str);

		if (m.find()) {
			str = m.group(1);
		}

		t.tokenize(str);

		Test[] tests = new Test[countTests(t.getTokens())];
		LinkedList<Token> tokList = new LinkedList<Token>();
		int i = -1;
		for (Token tok : t.getTokens()) {
			if (i == -1) {
				i++;
				continue;
			}
			if (tok.sequence.equals(testStart)) {
				// Aby używać innego testu należy zmienić tą linijkę
				tests[i] = new TestPP(tokList);
				tokList = new LinkedList<Token>();
				i++;
			} else {
				tokList.add(tok);
			}
		}
		tests[i] = new TestPP(tokList);
		return tests;
	}

	/**
	 * Zlicza liczbę testów.
	 * 
	 * @param tokens
	 *            Lista tokenów
	 * @return Liczba testów
	 */
	private int countTests(LinkedList<Token> tokens) {
		int i = 0;
		for (Token t : tokens) {
			if (t.sequence.equals(testStart))
				i++;
		}
		return i;
	}

	/**
	 * Czyta linie tekstu i usuwa komentarze haskellowe postaci --.
	 * 
	 * @param sr
	 *            Obiekt scanner
	 * @return Tekst bez ewentualnych komentarzy
	 */
	private String readLine(Scanner sr) {
		String s1 = "", s2 = sr.nextLine();
		int com = 0;
		for (int i = 0; i < s2.length(); i++) {
			char tmp;
			if ((tmp = s2.charAt(i)) == '-') {
				com++;
				if (com == 2)
					break;
			} else {
				if (com == 1)
					s1 += "-";
				s1 += tmp;
				com = 0;
			}
		}
		return s1;
	}
}
