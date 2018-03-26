package test;

import java.awt.Color;
import java.awt.Point;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.LinkedList;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import core.SyntaxHighlighter;
import core.TokensWorker.Token;

public class TestPP implements Test {

	private Point error;
	private String result;
	private String expr;
	private String fileExpr;
	private String expResult;
	private String name;
	private LinkedList<String> input;
	private LinkedList<Token> exprColorized;

	private boolean isOk = false;
	private boolean isCopy = false;
	private boolean isType = false;
	private boolean isFile = false;

	public TestPP() {
	}

	public TestPP(LinkedList<Token> testTok) {
		input = new LinkedList<String>();
		name = "undefined";
		expr = "";
		fileExpr = "";
		expResult = "";
		init(testTok);
	}

	private void init(LinkedList<Token> testTok) {
		int i = 0;
		loop: for (Token t : testTok) {
			if (i == 0) {
				name = t.sequence;
				i++;
			} else {
				switch (t.sequence) {
				case "SrcFile":
					isFile = true;
					break;
				case "TypeError":
					isType = true;
					expResult = "TypeCheck";
					break loop;
				case "Value":
				case "Eval":
					break;
				case "++":
					i--;
					break;
				case "[":
					i++;
					break;
				case "]":
					i++;
					break;
				case ",":
				case ")":
				case "(":
				case "SrcString":
					break;
				default:
					if (i == 1) {
						expr += t.sequence;
						i++;
					} else if (i == 3) {
						input.add(t.sequence);
					} else if (i == 4) {
						expResult = t.sequence;
						i++;
					}
				}
			}
		}
		if (isType)
			input.add("TypeCheck nie posiada inputu");
	}

	private void colorizeExpr() {
		SyntaxHighlighter synx = new SyntaxHighlighter();
		synx.add("if|then|else|elif", 1, new Color(0, 255, 0));
		synx.add("bool|int|unit|list", 4, new Color(255, 64, 0));
		synx.add("let|in|put", 2, new Color(255, 0, 191));
		synx.add("match|with|\\|", 2, new Color(213, 88, 118));
		synx.add("fun|fn", 3, new Color(255, 64, 0));
		synx.add("\\->|fst|snd", 5, new Color(0, 64, 255));
		synx.add(">|,|:|\\+|\\-|\\*|=|<|>", 5);
		synx.add("and|div|false|true|not|or|mod", 6);
		synx.add("\\(|\\)|\\[|\\]", 7);
		synx.add("-?[0-9]+|[0-9]+", 7, new Color(153, 102, 255));
		synx.add("[a-zA-Z][a-zA-Z0-9_]*", 8);
		synx.add("\\_", 9);
		if (isFile)
			synx.tokenize(fileExpr.replaceAll("\\_", ""));
		else
			synx.tokenize(expr.replaceAll("\\_", ""));
		exprColorized = synx.getTokens();
	}

	public void readExprFromFile(String path) {
		Scanner s = null;
		try {
			s = new Scanner(new File(path));
			String tmp = "";
			while (s.hasNextLine())
				tmp += s.nextLine().replaceAll("	", "  ") + "\n";
			fileExpr = tmp;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public LinkedList<String> getInputValues() {
		return input;
	}

	public String[] getTokens() {
		return new String[] { "Test", "SrcString|SrcFile", "Eval|Value|RuntimeError|TypeCheck", "\\(|\\)|\\[|\\]",
				",|\\+\\+", "-?[0-9]+|[0-9]+", "[a-zA-Z][a-zA-Z0-9_]*" };
	}

	public String getExpResult() {
		return expResult;
	}

	public String getPattern() {
		return "tests\\s*=\\s*\\[\\s*(.*)\\s*\\]";
	}

	public Point getErrorPos() {
		return error;
	}

	public String getResult() {
		if (isType && !isOk)
			return result;
		return result;
	}

	public void setResult(String result) {
		boolean ok = true;
		if (result.contains("Value")) {
			if (isType)
				ok = false;
			this.result = result.substring(result.indexOf("Value") + 5, result.length()).replaceAll("\\(|\\)", "")
					.trim();
		} else if (result.contains("Prac5.exe invoke ERROR")) {
			this.result = "Prac5.exe invoke ERROR";
		} else if (result.contains("oes not exist")) {
			this.result = "Does not exist";
		} else if (result.contains("RuntimeError")) {
			this.result = result.substring(result.indexOf("RuntimeError"), result.length());
		} else if (result.contains("):unexpected)")) {
			this.result = result.substring(result.indexOf("):") + 2, result.length());
		} else {
			int i = 0;
			if ((i = result.indexOf("):")) != 0)
				this.result = result.substring(i + 2, result.length());
			else
				this.result = result;
		}

		if (ok && isCorrectReturn(this.result))
			isOk = true;
		else {
			isOk = false;
			String pattern = ".*\\(line (\\d+), column (\\d+)\\):";
			Pattern p = Pattern.compile(pattern);
			Matcher m = p.matcher(result);
			if (m.find())
				error = new Point(Integer.parseInt(m.group(1)), Integer.parseInt(m.group(2)));
		}
		colorizeExpr();
	}

	public String getName() {
		return name;
	}

	private boolean isCorrectReturn(String currentOut) {
		if (isType && !currentOut.startsWith("unexpected"))
			return true;
		else if (getExpResult().equals(currentOut)) {
			return true;
		}
		return false;
	}

	@Override
	public String toString() {
		return name;
	}

	@Override
	public boolean isCopy() {
		// TODO Auto-generated method stub
		return isCopy;
	}

	@Override
	public void setCopy(boolean isCopy) {
		// TODO Auto-generated method stub
		this.isCopy = isCopy;
	}

	@Override
	public boolean isOk() {
		// TODO Auto-generated method stub
		return isOk;
	}

	@Override
	public boolean isFile() {
		// TODO Auto-generated method stub
		return isFile;
	}

	@Override
	public boolean isType() {
		// TODO Auto-generated method stub
		return isType;
	}

	@Override
	public String getExpr() {
		// TODO Auto-generated method stub
		return expr;
	}

	@Override
	public String getFileExpr() {
		// TODO Auto-generated method stub
		return fileExpr;
	}

	@Override
	public LinkedList<Token> getColorizedExpr() {
		// TODO Auto-generated method stub
		return exprColorized;
	}

}
