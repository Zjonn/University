package gui;

import javax.swing.JPanel;
import javax.swing.SpringLayout;

import java.awt.Dialog;
import java.awt.Font;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;
import javax.swing.filechooser.FileFilter;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.File;

/**
 * Klasa rozszerzająca JPanel, udostępnia metody pozwalające ustalić scieżkę do
 * pliku z testami i prac_
 * 
 * @author Zjonn
 *
 */
public class InitMenu extends JPanel {
	/**
	 * 
	 */
	public File pracPath;
	public File testPath;

	private static final long serialVersionUID = -6293969444984684176L;
	private JTextField fldPrac;
	private JTextField fldTest;
	private JFrame frame;

	/**
	 * Tworzy panel dodatkowy
	 * @param frame Rodzic panlu
	 * @param f Czcionka której należy używać
	 */
	public InitMenu(JFrame frame, Font f) {
		this.frame = frame;
		setBorder(new TitledBorder(null, "Wybierz:", TitledBorder.LEADING, TitledBorder.TOP, null, null));
		SpringLayout springLayout = new SpringLayout();
		setLayout(springLayout);

		JButton btnPrac5 = new JButton("Program");
		btnPrac5.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				File output = openDialog(pracPath, ".exe");
				if (output != null) {
					pracPath = output;
					fldPrac.setText(output.toString());
				}
			}
		});
		btnPrac5.setFocusPainted(false);
		btnPrac5.setFont(f);
		springLayout.putConstraint(SpringLayout.NORTH, btnPrac5, 10, SpringLayout.NORTH, this);
		springLayout.putConstraint(SpringLayout.WEST, btnPrac5, 10, SpringLayout.WEST, this);
		springLayout.putConstraint(SpringLayout.EAST, btnPrac5, 129, SpringLayout.WEST, this);
		add(btnPrac5);

		JButton btnTestFile = new JButton("Plik z testami");
		btnTestFile.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				File output = openDialog(testPath, ".hs");
				if (output != null) {
					testPath = output;
					fldTest.setText(output.toString());
				}
			}
		});
		btnTestFile.setFocusPainted(false);
		btnTestFile.setFont(f);
		springLayout.putConstraint(SpringLayout.NORTH, btnTestFile, 6, SpringLayout.SOUTH, btnPrac5);
		springLayout.putConstraint(SpringLayout.WEST, btnTestFile, 10, SpringLayout.WEST, this);
		springLayout.putConstraint(SpringLayout.EAST, btnTestFile, 0, SpringLayout.EAST, btnPrac5);
		add(btnTestFile);

		fldPrac = new JTextField();
		fldPrac.setEditable(false);
		springLayout.putConstraint(SpringLayout.NORTH, fldPrac, 1, SpringLayout.NORTH, btnPrac5);
		springLayout.putConstraint(SpringLayout.SOUTH, fldPrac, -1, SpringLayout.SOUTH, btnPrac5);
		springLayout.putConstraint(SpringLayout.WEST, fldPrac, 6, SpringLayout.EAST, btnPrac5);
		springLayout.putConstraint(SpringLayout.EAST, fldPrac, -6, SpringLayout.EAST, this);
		add(fldPrac);
		fldPrac.setColumns(10);

		fldTest = new JTextField();
		fldTest.setEditable(false);
		springLayout.putConstraint(SpringLayout.NORTH, fldTest, 1, SpringLayout.NORTH, btnTestFile);
		springLayout.putConstraint(SpringLayout.SOUTH, fldTest, -1, SpringLayout.SOUTH, btnTestFile);
		springLayout.putConstraint(SpringLayout.WEST, fldTest, 6, SpringLayout.EAST, btnTestFile);
		springLayout.putConstraint(SpringLayout.EAST, fldTest, -6, SpringLayout.EAST, this);
		add(fldTest);
		fldTest.setColumns(10);
	}

	/**
	 * Tworzy okno dialogowe pozwalające wybrać katalog.
	 * 
	 * @param path
	 *            Scieżka startowa
	 * @param fileType
	 *            Oczekiwane rozszerzenie pliku
	 * @return Zwraca adres pliku
	 */
	private File openDialog(File path, String fileType) {
		Dialog d = new Dialog(frame);
		JFileChooser f = new JFileChooser();

		if (path == null)
			f.setCurrentDirectory(new File(System.getProperty("user.dir")));
		else
			f.setCurrentDirectory(path.getParentFile());

		f.setFileFilter(new FileFilter() {
			@Override
			public boolean accept(File arg0) {
				return arg0.isDirectory() || arg0.getName().endsWith(fileType);
			}

			@Override
			public String getDescription() {
				return "Oczekiwany jest plik z rozszerzeniem: " + fileType;
			}
		});
		f.showOpenDialog(d);

		return f.getSelectedFile();
	}
}
