package io;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.Scanner;

import javax.swing.JFrame;

import test.Test;

/**
 * Klasa zajmuje się uruchamianiem pliku .exe
 * 
 * @author Zjonn
 *
 */
public class TestInvoke extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5414740381509535178L;
	String testPath, pracPath;

	/**
	 * Ustawia scieżki do testów i pliku prac_
	 * 
	 * @param testPath
	 *            Ścieżka do testów
	 * @param pracPath
	 *            Ścieżka do pliku prac_.exe
	 */
	public TestInvoke(String testPath, String pracPath) {
		this.testPath = testPath;
		this.pracPath = pracPath;
	}

	/**
	 * Uruchamia prac_.exe dla podanego testu
	 * 
	 * @param t
	 *            Test który zostanie podany do wykonania
	 * @return Wynik który zwrócił prac_.exe
	 */
	public String run(Test t) {
		String file = "", returnStr = "";

		Scanner scan = null;
		Scanner serr = null;

		InputStream is;
		InputStream ir;

		File f = null;
		Process p;

		try {
			if (t.isFile())
				file = testPath + "\\" + t.getExpr();
			else {
				f = new File(testPath + "\\TestETZ");
				if (!f.exists())
					f.createNewFile();
				FileWriter w = new FileWriter(f);
				w.write(t.getExpr());
				w.close();
				file = testPath + "\\TestETZ";
			}
			p = new ProcessBuilder(pracPath, file).start();

			
			ir = p.getErrorStream();
			is = p.getInputStream();

			OutputStream os = p.getOutputStream();
			scan = new Scanner(is);
			serr = new Scanner(ir);

			if (!t.isType()) {
				BufferedWriter fw = new BufferedWriter(new OutputStreamWriter(os));
				for (String num : t.getInputValues()) {
					fw.write(num);
					fw.write(System.getProperty("line.separator"));
					fw.flush();
				}
				fw.close();
			}
			p.waitFor();

			returnStr = getOutput(scan) + getOutput(serr);
			scan.close();
			serr.close();
		} catch (IOException e) {
			returnStr = "Prac5.exe invoke ERROR";
		} catch (InterruptedException e) {
			e.printStackTrace();
		} finally {
			if (!t.isFile())
				f.delete();
		}
		return returnStr;
	}

	/**
	 * Zczytuje dane z danego Scannera.
	 * 
	 * @param s
	 *            Scanner z którego mam przczytać wynik
	 * @return Przeczytany wynik
	 */
	private String getOutput(Scanner s) {
		String str = "";
		while (s.hasNextLine()) {
			str += s.nextLine();
		}
		return str;
	}

}
