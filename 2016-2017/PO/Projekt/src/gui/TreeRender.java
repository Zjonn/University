package gui;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Component;
import java.awt.Graphics;
import java.awt.Graphics2D;

import javax.swing.Icon;
import javax.swing.JTree;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeCellRenderer;

import test.Test;

/**
 * Klasa odpowiada za kolorowanie gałęzi w JTree
 * 
 * @author Zjonn
 *
 */
public class TreeRender extends DefaultTreeCellRenderer {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3023842096429079396L;

	/**
	 * Nadpisuje metodę odpowiedzialną za rysowanie jednego kompnentu drzewa.
	 */
	public Component getTreeCellRendererComponent(JTree tree, Object value, boolean selected, boolean expanded,
			boolean leaf, int row, boolean hasFocus) {
		super.getTreeCellRendererComponent(tree, value, selected, expanded, leaf, row, hasFocus);

		Test nodo = (Test)value;

		if (nodo.getChildCount() > 0) {
			try {
				if (!nodo.getUserObject().isOk())
					setIcon(new MissingIcon(Color.RED, Color.WHITE));
				else if (nodo.getUserObject().isCopy())
					setIcon(new MissingIcon(Color.ORANGE, Color.GREEN));
				else
					setIcon(new MissingIcon(Color.GREEN, Color.GREEN));
			} catch (ClassCastException e) {
			}
		}
		return this;
	}
}

/**
 * Klasa zwracają ikonę.
 * 
 * @author danie
 *
 */
class MissingIcon implements Icon {

	private int width = 16;
	private int height = 16;

	private Color bckC, strC;

	private BasicStroke stroke = new BasicStroke(2);

	/**
	 * Inicjuję kolory których używam przy rysowaniu.
	 * 
	 * @param c1
	 *            Tło
	 * @param c2
	 *            Kolor X-a
	 */
	public MissingIcon(Color c1, Color c2) {
		super();
		bckC = c1;
		strC = c2;
	}

	/**
	 * Rysuję ikonę o podanym kolorze
	 */
	public void paintIcon(Component c, Graphics g, int x, int y) {
		Graphics2D g2d = (Graphics2D) g.create();

		g2d.setColor(bckC);
		g2d.fillRect(x + 1, y + 1, width, height);

		g2d.setColor(Color.BLACK);
		g2d.drawRect(x, y, width, height - 1);

		g2d.setColor(strC);

		g2d.setStroke(stroke);
		g2d.drawLine(x + 5, y + 5, x + width - 5, y + height - 5);
		g2d.drawLine(x + 5, y + height - 5, x + width - 5, y + 5);

		g2d.dispose();
	}

	/**
	 * Zwraca szerokość ikony
	 */
	public int getIconWidth() {
		return width;
	}

	/**
	 * Zwraca wysokość ikony
	 */
	public int getIconHeight() {
		return height;
	}
}
