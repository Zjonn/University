package test;

import java.awt.Point;
import java.util.LinkedList;

import core.TokensWorker.Token;

/**
 * Implementując ten interfejs oraz zmieniając jedną linijkę w parseTest można
 * dodać obsługę innych testów.
 * 
 * @author Zjonn
 *
 */

public interface Test {
	/**
	 * @return Miejsce błedu
	 */
	Point getErrorPos();

	/**
	 * 
	 * @return Ciało funkcji | Nazwa pliku z testem
	 */
	String getExpr();

	/**
	 * 
	 * @return Wynik działania pliku prac
	 */
	String getResult();

	/**
	 * 
	 * @return Jeśli test był zdefiniowany w oddzielnym pliku zwraca ciało
	 *         funkcji tam zapisane
	 */
	String getFileExpr();

	/**
	 * 
	 * @return Oczekiwany wynik
	 */
	String getExpResult();

	/**
	 * 
	 * @return Budowa leksykalna testów
	 */
	String getPattern();

	/**
	 * 
	 * @return Nazwa testu
	 */
	@Override
	String toString();

	/**
	 * 
	 * @return Nazwa testu
	 */
	String getName();

	/**
	 * 
	 * @return Budowa leksykalna testu
	 */
	String[] getTokens();

	/**
	 * 
	 * @return Wartości dla których funkcja ma być wywołana
	 */
	LinkedList<String> getInputValues();

	/**
	 * 
	 * @return Lista tokenów z kolorem poszczególnych fragmentów funkcji
	 */
	LinkedList<Token> getColorizedExpr();

	/**
	 * 
	 * @return Czy ciało funkcji zapisane jest w pliku
	 */
	boolean isFile();

	/**
	 * 
	 * @return Czy typ testu to typeCheck
	 */
	boolean isType();

	/**
	 * 
	 * @return Czy inna funkcja ma tą samą nazwę
	 */
	boolean isCopy();

	/**
	 * 
	 * @return Czy test zwrócił oczekiwany wynik
	 */
	boolean isOk();

	/**
	 * Funkcja czyta ciało funkcji z pliku.
	 * 
	 * @param path
	 *            testu
	 */
	void readExprFromFile(String path);

	/**
	 * Funkcja parsuje wynik zwrócony przez prac_.
	 * 
	 * @param result
	 *            wynik działania prac_
	 */
	void setResult(String result);

	/**
	 * Pozwala oznaczyć test jako skopiowany.
	 * 
	 * @param isCopy
	 *            czyKopia
	 */
	void setCopy(boolean isCopy);
}
