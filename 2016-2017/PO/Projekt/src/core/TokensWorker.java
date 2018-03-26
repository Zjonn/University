package core;

import java.util.LinkedList;
import java.util.regex.Pattern;

/**
 * Klasa abstrakcyjna udostępniająca metody dla klas pracujących na tokenach.
 * 
 * @author Zjonn
 *
 */
public abstract class TokensWorker {
	/**
	 * Możliwy token.
	 * 
	 * @author danie
	 *
	 */
	protected class TokenInfo {
		public final Pattern regex;
		public final int token;

		public TokenInfo(Pattern regex, int token) {
			this.regex = regex;
			this.token = token;
		}
	}

	/**
	 * Token.
	 * 
	 * @author danie
	 *
	 */
	public class Token {
		public final int token;
		public final String sequence;

		public Token(int token, String sequence) {
			this.token = token;
			this.sequence = sequence;
		}

	}

	protected LinkedList<TokenInfo> tokenInfos;
	protected LinkedList<Token> tokens;

	/**
	 * Inizjuje LinkedListy
	 */
	public TokensWorker() {
		tokenInfos = new LinkedList<TokenInfo>();
		tokens = new LinkedList<Token>();
	}

	/**
	 * Dodaje nowy możliwy token do listy tokenów.
	 * 
	 * @param regex
	 *            Token
	 * @param token
	 *            Numer tokenu
	 */
	public void add(String regex, int token) {
		tokenInfos.add(new TokenInfo(Pattern.compile("^(" + regex + ")"), token));
	}

	/**
	 * Funkcja tokenizująca podany napis.
	 * 
	 * @param str
	 *            napis do tokenizowania
	 */
	public abstract void tokenize(String str);

	/**
	 * 
	 * @return Lista tokenów
	 */
	public LinkedList<Token> getTokens() {
		return tokens;
	}

}
