package core;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.Font;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.TreePath;

import core.SyntaxHighlighter.TokenColor;
import core.TokensWorker.Token;
import gui.FormattedText;
import gui.InitMenu;
import gui.TreeRender;
import io.Raport;
import io.ParseTests;
import io.TestInvoke;
import test.Test;
import test.TestPP;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.lang.reflect.InvocationTargetException;
import java.awt.Cursor;
import java.util.concurrent.atomic.AtomicReference;

/**
 * Program ma na celu ułatwienia sprawdzania poprawności testów z pracowni
 * haskellowych. Klasa główna.
 *
 * @author Zjonn
 */
public class EasyTests extends JFrame {

	/**
	 *
	 */
	private static final long serialVersionUID = -3532576998459969296L;

	private JProgressBar progTest;
	private JTextPane textPane;
	private InitMenu panel;
	private JTree tree;

	private FormattedText fmText;

	private Test tests[];

	private int allTests = 0;
	private int warnTests = 0;
	private int correctTests = 0;
	private int incorrectTests = 0;

	/**
	 * Uruchamia aplikacje.
	 *
	 * @param args
	 *            Argumenty wywołania aplikacji
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(() -> {
			try {
				UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
				EasyTests frame = new EasyTests();
				frame.setVisible(true);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
	}

	/**
	 * Inicjuje okno.
	 */
	public EasyTests() {
		setTitle("EasyTests");
		initFrame();
		fmText = new FormattedText(textPane);
	}

	/**
	 * Tworzy okno aplikacji.
	 */
	private void initFrame() {
		setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		setBounds(100, 100, 650, 500);
		JPanel contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(new BoxLayout(contentPane, BoxLayout.Y_AXIS));

		String fontName = "Microsoft YaHei Light";
		Font f = new Font(fontName, Font.PLAIN, 13);

		panel = new InitMenu(this, f);
		panel.setPreferredSize(new Dimension(10, 100));
		panel.setMaximumSize(new Dimension(32767, 250));
		contentPane.add(panel);

		JPanel panel_1 = new JPanel();
		contentPane.add(panel_1);
		SpringLayout sl_panel_1 = new SpringLayout();
		panel_1.setLayout(sl_panel_1);

		JButton btnRetract = new JButton("");
		btnRetract.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				panel.setVisible(!panel.isVisible());
			}
		});
		sl_panel_1.putConstraint(SpringLayout.NORTH, btnRetract, 0, SpringLayout.NORTH, panel_1);
		sl_panel_1.putConstraint(SpringLayout.WEST, btnRetract, 0, SpringLayout.WEST, panel_1);
		sl_panel_1.putConstraint(SpringLayout.SOUTH, btnRetract, 26, SpringLayout.NORTH, panel_1);
		sl_panel_1.putConstraint(SpringLayout.EAST, btnRetract, 8, SpringLayout.WEST, panel_1);
		btnRetract.setFocusPainted(false);
		panel_1.add(btnRetract);

		JButton btnTest = new JButton("Testuj");
		btnTest.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				checkTests();
			}
		});
		btnTest.setFocusPainted(false);
		btnTest.setFont(f);
		sl_panel_1.putConstraint(SpringLayout.NORTH, btnTest, 0, SpringLayout.NORTH, btnRetract);
		sl_panel_1.putConstraint(SpringLayout.WEST, btnTest, 6, SpringLayout.EAST, btnRetract);
		sl_panel_1.putConstraint(SpringLayout.SOUTH, btnTest, 26, SpringLayout.NORTH, panel_1);
		sl_panel_1.putConstraint(SpringLayout.EAST, btnTest, 110, SpringLayout.EAST, btnRetract);
		panel_1.add(btnTest);

		progTest = new JProgressBar();
		progTest.setStringPainted(true);
		progTest.setCursor(Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR));
		sl_panel_1.putConstraint(SpringLayout.NORTH, progTest, 0, SpringLayout.NORTH, btnRetract);
		sl_panel_1.putConstraint(SpringLayout.SOUTH, progTest, 26, SpringLayout.NORTH, btnRetract);
		sl_panel_1.putConstraint(SpringLayout.EAST, progTest, 0, SpringLayout.EAST, panel_1);
		progTest.setFont(f);
		progTest.setForeground(Color.RED);
		panel_1.add(progTest);

		JButton btnNRaport = new JButton("Raport\r\n");
		btnNRaport.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				Raport r = new Raport("raport");
				if (tests != null)
					r.writeRaport(correctTests, warnTests, incorrectTests, allTests, tests);
			}
		});
		btnNRaport.setFocusPainted(false);
		btnNRaport.setFont(f);
		sl_panel_1.putConstraint(SpringLayout.WEST, progTest, 6, SpringLayout.EAST, btnNRaport);
		sl_panel_1.putConstraint(SpringLayout.EAST, btnNRaport, 110, SpringLayout.EAST, btnTest);
		sl_panel_1.putConstraint(SpringLayout.NORTH, btnNRaport, 0, SpringLayout.NORTH, panel_1);
		sl_panel_1.putConstraint(SpringLayout.WEST, btnNRaport, 6, SpringLayout.EAST, btnTest);
		sl_panel_1.putConstraint(SpringLayout.SOUTH, btnNRaport, 0, SpringLayout.SOUTH, btnRetract);
		panel_1.add(btnNRaport);

		JScrollPane scrollPane = new JScrollPane();
		sl_panel_1.putConstraint(SpringLayout.NORTH, scrollPane, 6, SpringLayout.SOUTH, btnRetract);
		sl_panel_1.putConstraint(SpringLayout.WEST, scrollPane, 0, SpringLayout.WEST, panel_1);
		sl_panel_1.putConstraint(SpringLayout.SOUTH, scrollPane, 0, SpringLayout.SOUTH, panel_1);
		sl_panel_1.putConstraint(SpringLayout.EAST, scrollPane, 0, SpringLayout.EAST, btnNRaport);
		panel_1.add(scrollPane);

		tree = new JTree();
		tree.setCellRenderer(new TreeRender());
		tree.setFont(new Font(fontName, Font.PLAIN, 14));
		tree.addTreeSelectionListener(e -> changeTreeValue());
		tree.setModel(new DefaultTreeModel(new DefaultMutableTreeNode("Tests") {
			private static final long serialVersionUID = 2490034931622891683L;

			{
				add(new DefaultMutableTreeNode("empty"));
			}
		}));
		scrollPane.setViewportView(tree);

		JScrollPane scrollPane_1 = new JScrollPane();
		sl_panel_1.putConstraint(SpringLayout.NORTH, scrollPane_1, 6, SpringLayout.SOUTH, progTest);
		sl_panel_1.putConstraint(SpringLayout.WEST, scrollPane_1, 0, SpringLayout.WEST, progTest);
		sl_panel_1.putConstraint(SpringLayout.SOUTH, scrollPane_1, 0, SpringLayout.SOUTH, scrollPane);
		sl_panel_1.putConstraint(SpringLayout.EAST, scrollPane_1, 0, SpringLayout.EAST, progTest);
		panel_1.add(scrollPane_1);

		textPane = new JTextPane();
		textPane.setFont(new Font(fontName, Font.PLAIN, 14));
		scrollPane_1.setViewportView(textPane);
	}

	/**
	 * Metoda czyta plik z testami użytkownika, następnie go parsuje i dzieli na
	 * testy. Podzielone testy przekazuje programowi prac_.exe, a następnie wynik
	 * działania prograu jest parsowany. Na podstawie otrzymanej odpowiedzi ustala
	 * które testy są poprawne, w przypadku błędu zapisywana jest pozycja błedu.
	 */
	private void checkTests() {
		new Thread(this::run).start();
	}

	/**
	 * W zależności od zaznaczonej gałęzi drzewa wypisywana jest inna wartość w
	 * JtextPanelu.
	 */
	private void changeTreeValue() {
		DefaultMutableTreeNode node = (DefaultMutableTreeNode) tree.getLastSelectedPathComponent();
		if (node != null) {
			if (node.isLeaf() && !node.isRoot()) {
				AtomicReference<Test> t = new AtomicReference<>(
						(Test) ((DefaultMutableTreeNode) node.getParent()).getUserObject());

				switch ((String) node.getUserObject()) {
				case "wynik":
					if (t.get().isOk())
						fmText.printcln(t.get().getResult(), Color.BLACK);
					else {
						fmText.printcln("Oczekiwany wynik testu:", Color.BLACK);
						fmText.println("  " + t.get().getExpResult(), Color.GREEN);
						fmText.println("Program zwrócił:", Color.BLACK);
						fmText.println("  " + t.get().getResult(), Color.RED);
					}
					break;
				case "input":
					textPane.setText("");
					for (String s : t.get().getInputValues())
						fmText.println(s, Color.BLACK);
					break;
				case "program":
					String expr;
					if (t.get().isFile())
						expr = t.get().getFileExpr();
					else
						expr = t.get().getExpr();

					if (t.get().isOk()) {
						if (t.get().getColorizedExpr() != null) {
							fmText.clear();
							for (Token tok : t.get().getColorizedExpr())
								fmText.print(tok.sequence, ((TokenColor) tok).c);
						} else
							fmText.printcln(t.get().getExpr(), Color.BLACK);
					} else if (t.get().getErrorPos() != null) {
						StringBuilder s1 = new StringBuilder();
						StringBuilder s2 = new StringBuilder();
						StringBuilder s3 = new StringBuilder();
						int line = t.get().getErrorPos().x, column = t.get().getErrorPos().y;
						int nLine = 1, nColumn = 1;
						int str = 1;
						for (int i = 0; i < expr.length(); i++) {
							if (expr.charAt(i) == '\n')
								nLine++;
							else if (expr.charAt(i) == ' ' && str == 2)
								str = 3;
							if (line == nLine) {
								if (nColumn == column) {
									str = 2;
								}
								nColumn++;
							}
							switch (str) {
							case 1:
								s1.append(expr.charAt(i));
								break;
							case 2:
								s2.append(expr.charAt(i));
								break;
							case 3:
								s3.append(expr.charAt(i));
								break;
							}

						}
						fmText.printc(s1.toString(), Color.BLACK);
						fmText.print(s2.toString(), Color.RED);
						fmText.print(s3.toString(), Color.BLACK);
					} else {
						fmText.printcln(expr, Color.BLACK);
					}
					break;
				}
			} else if (node.isRoot()) {
				fmText.printcln("Rezultaty:", Color.BLACK);
				fmText.println("	Liczba testów: " + allTests, Color.darkGray);
				fmText.println("	Poprawne   : " + correctTests, Color.GREEN);
				fmText.println("	Kopie nazw : " + warnTests, Color.ORANGE);
				fmText.println("	Błędne     : " + incorrectTests, Color.RED);
			}
		}
	}

	/**
	 * Funkcja dla bezpieczeństwa czyści model drzewa oraz informcje na temat
	 * poprawności testów.
	 *
	 * @param t
	 *            Drzewo do wyczyszczenia
	 */
	private void clean(JTree t) {
		t.setModel(new DefaultTreeModel(new DefaultMutableTreeNode("Tests") {
			private static final long serialVersionUID = 9060762018576613279L;
		}));
		allTests = 0;
		warnTests = 0;
		correctTests = 0;
		incorrectTests = 0;
	}

	/**
	 * Funkcja oznacza skopiowane testy.
	 *
	 * @param t
	 *            Lista testów do sprawdzenia
	 */
	private void markCopy(Test[] t) {
		for (int i = 0; i < t.length - 1; i++) {
			for (int j = i + 1; j < t.length; j++) {
				if (t[i].getName().equals(t[j].getName())) {
					t[i].setCopy(true);
					t[j].setCopy(true);
				}
			}
		}
	}

	private void run() {
		TestInvoke c = new TestInvoke(panel.testPath.getParent(), panel.pracPath.toString());
		ParseTests r = null;
		final ParseTests[] rTab = { r };
		Runnable runnable = () -> rTab[0] = new ParseTests(panel.testPath.toString(), new TestPP());

		Thread td = new Thread(runnable);
		td.start();

		try {
			Thread.sleep(50);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		td.interrupt();
		// if(r == null)
		System.out.print("Wątek zabity " + r);
		clean(tree);

		tests = r.parse();
		final int[] i = new int[1];
		markCopy(tests);

		for (Test t : tests) {
			allTests++;

			if (t.isFile())
				t.readExprFromFile(panel.testPath.getParent() + "\\" + t.getExpr());

			t.setResult(c.run(t));
			if (t.isCopy() && t.isOk())
				warnTests++;
			else if (t.isOk())
				correctTests++;
			else
				incorrectTests++;

			DefaultTreeModel model = (DefaultTreeModel) tree.getModel();
			DefaultMutableTreeNode root = (DefaultMutableTreeNode) model.getRoot();
			DefaultMutableTreeNode tname = new DefaultMutableTreeNode(t);

			model.insertNodeInto(tname, root, root.getChildCount());
			tname.add(new DefaultMutableTreeNode("program"));
			tname.add(new DefaultMutableTreeNode("input"));
			tname.add(new DefaultMutableTreeNode("wynik"));

			try {
				SwingUtilities.invokeAndWait(() -> progTest.setValue((i[0] + 1) * 100 / (tests.length)));
			} catch (InvocationTargetException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			} catch (InterruptedException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			i[0]++;
		}
		tree.expandPath(new TreePath(tree.getModel().getRoot()));
		tree.setSelectionPath(new TreePath(tree.getModel().getRoot()));
	}
}
