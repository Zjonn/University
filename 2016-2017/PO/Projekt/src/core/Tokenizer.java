package core;

import java.util.regex.Matcher;

/**
 * Klasa pochodzi ze strony:
 * <a href="http://google.com">http://cogitolearning.co.uk/?p=525</a> Zajmuje
 * się zamianą tekstu na tokeny
 * 
 * @author cogitolearning
 *
 */
public class Tokenizer extends TokensWorker {

	public void tokenize(String str) {
		String s = str.trim();
		tokens.clear();
		while (!s.equals("")) {
			if (s.startsWith("\"")) {
				String tok = "";
				int pos = 0;
				char tmp;
				for (int i = 1; i < s.length(); i++) {
					if ((tmp = s.charAt(i)) != '\"') {
						tok += tmp;
					} else {
						pos = i + 1;
						break;
					}
				}
				s = s.substring(pos, s.length()).trim();
				tokens.add(new Token(-1, tok));
			} else {
				for (TokenInfo info : tokenInfos) {
					Matcher m = info.regex.matcher(s);
					if (m.find()) {
						String tok = m.group().trim();
						s = m.replaceFirst("").trim();
						tokens.add(new Token(info.token, tok));
						break;
					}
				}
			}
		}
	}
}
