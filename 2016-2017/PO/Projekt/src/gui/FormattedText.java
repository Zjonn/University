package gui;

import java.awt.Color;

import javax.swing.JTextPane;
import javax.swing.text.AttributeSet;
import javax.swing.text.SimpleAttributeSet;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyleContext;

/**
 * Klasa zajmuje się wypisywaniem pokolorowanego testu.
 * 
 * @author Zjonn
 *
 */
public class FormattedText {

	private JTextPane textPanel;

	public FormattedText(JTextPane textPanel) {
		this.textPanel = textPanel;
	}

	public void print(String msg, Color c) {
		printText(msg, c, false, false);
	}

	public void printc(String msg, Color c) {
		printText(msg, c, false, true);
	}

	public void println(String msg, Color c) {
		printText(msg, c, true, false);
	}

	public void printcln(String msg, Color c) {
		printText(msg, c, true, true);
	}

	public void clear() {
		printText("", Color.black, false, true);
	}

	public void clearnl() {
		printText("", Color.black, true, true);
	}

	/**
	 * Funkcja wykonująca operacje na panelu.
	 * 
	 * @param msg
	 *            Tekst
	 * @param c
	 *            Kolor tesktu
	 * @param newLine
	 *            Czy nowa inia
	 * @param clearPanel
	 *            Czy nadpisać poprzedni tekst
	 */
	private void printText(String msg, Color c, boolean newLine, boolean clearPanel) {
		setAttributes(c);

		if (!clearPanel) {
			int l = textPanel.getDocument().getLength();
			textPanel.setCaretPosition(l);
		} else if (clearPanel) {
			if (newLine)
				textPanel.setText(msg + "\n");
			else
				textPanel.setText(msg);
		} else {
			if (newLine)
				textPanel.replaceSelection(msg + "\n");
			else
				textPanel.replaceSelection(msg);
		}
	}

	private void setAttributes(Color c) {
		StyleContext sc = StyleContext.getDefaultStyleContext();
		AttributeSet attrSet = sc.addAttribute(SimpleAttributeSet.EMPTY, StyleConstants.Foreground, c);

		attrSet = sc.addAttribute(attrSet, StyleConstants.FontFamily, "Verdana");
		attrSet = sc.addAttribute(attrSet, StyleConstants.Alignment, StyleConstants.ALIGN_JUSTIFIED);

		textPanel.setCharacterAttributes(attrSet, false);
	}
}
