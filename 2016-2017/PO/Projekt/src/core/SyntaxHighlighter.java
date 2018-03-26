package core;

import java.awt.Color;
import java.util.LinkedList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Klasa kolorująca składnie.
 * 
 * @author Zjonn
 *
 */
public class SyntaxHighlighter extends TokensWorker {

	/**
	 * Możliwy token wraz z kolorem
	 * 
	 * @author Zjonn
	 *
	 */
	protected class TokenInfoColor extends TokenInfo {
		public final Color c;

		public TokenInfoColor(Pattern regex, int token, Color c) {
			super(regex, token);
			this.c = c;
		}

		public TokenInfoColor(Pattern regex, int token) {
			super(regex, token);
			this.c = Color.BLACK;
		}

	}

	/**
	 * Token + jego kolor
	 * 
	 * @author Zjonn
	 *
	 */
	public class TokenColor extends Token {
		public final Color c;

		public TokenColor(int token, String sequence, Color c) {
			super(token, sequence);
			this.c = c;
		}

		public TokenColor(int token, String sequence) {
			super(token, sequence);
			this.c = Color.BLACK;
		}

	}

	public SyntaxHighlighter() {
		tokenInfos = new LinkedList<TokenInfo>();
		tokens = new LinkedList<Token>();
		add("\\s", -1);
	}

	/**
	 * Dodaje nowy możliwy token do listy tokenów, dodatkowo pozwala na
	 * kolorowanie.
	 * 
	 * @param regex
	 *            Token
	 * @param token
	 *            Numer tokenu
	 * @param c
	 *            Kolor tokenu
	 */
	public void add(String regex, int token, Color c) {
		tokenInfos.add(new TokenInfoColor(Pattern.compile("^(" + regex + ")"), token, c));
	}

	@Override
	public void add(String regex, int token) {
		tokenInfos.add(new TokenInfoColor(Pattern.compile("^(" + regex + ")"), token));
	}

	@Override
	public void tokenize(String str) {
		String s = str;
		tokens.clear();
		while (!s.equals("")) {
			for (TokenInfo info : tokenInfos) {
				Matcher m = info.regex.matcher(s);
				if (m.find()) {
					String tok = m.group();
					s = m.replaceFirst("");
					tokens.add(new TokenColor(info.token, tok, ((TokenInfoColor) info).c));
					break;
				}
			}
		}
	}
}
