package core;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JSpinner;
import javax.swing.SpinnerNumberModel;
import javax.swing.SpringLayout;
import javax.swing.border.LineBorder;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

public abstract class Pojazd implements Serializable, ChangeListener, ActionListener {

	private static final long serialVersionUID = 1L;
	//transient = nie serializuj
	transient private JFrame f;
	transient private JPanel p, colorP;
	transient private JSpinner R, G, B, s;
	transient private JComboBox<String> box;
	transient private JButton b;

	int waga = 50;

	Color color = Color.BLACK;

	String marka;
	//Scie�ka do pliku
	private String path;

	public Pojazd(String path) {
		init();
		this.path = path;
	}

	private void init() {
		f = new JFrame("Edytor");
		f.setSize(600, 400);
		//Ko�czy porgram po naci�ni�ciu krzyzyka
		f.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
		//Elementy interfejsu b�dziemy umieszcza� na JPanelu
		p = new JPanel();
		//Layout m�wi jak maj� by� uk�adane kontroli
		SpringLayout l = new SpringLayout();
		p.setLayout(l);
		edytor(l);
		f.add(p);
		f.setVisible(true);
	}
	/**Wymagana w zadaniu metoda*/
	public abstract String toString();
	/**Nazwa typu obiektu do wy�wietlenie*/
	abstract String className();
	/**Marki pojazd�w do wy�wietlenia*/
	abstract ArrayList<String> marki();
	/**JPanel kt�ry zostanie dodany do istniej�cego interfejsu*/
	abstract JPanel userPanel();
	/**Typ podklasy do serializacji*/
	abstract Object getObject();
	/**Warto�ci z nowych kontrolek nale�y przypisa� do zmiennych przed serializacj�*/
	abstract void commitData();
	//Metoda zajmuje si� budow� interfejsu
	private void edytor(SpringLayout l) {
		//Spiner do ustalenia wagi pojazdu
		s = new JSpinner(new SpinnerNumberModel(waga, 10, 50000, 50));
		//ComboBox do wyboru marek
		box = new JComboBox<String>();
		ArrayList<String> marki = marki();
		for (int i = 0; i < marki.size(); i++)
			box.addItem(marki.remove(i));
		if (marka != null)
			box.setSelectedItem(marka);
		//Spinery do opisu koloru w formacie RGB
		R = new JSpinner(new SpinnerNumberModel(color.getRed(), 0, 255, 3));
		G = new JSpinner(new SpinnerNumberModel(color.getGreen(), 0, 255, 3));
		B = new JSpinner(new SpinnerNumberModel(color.getBlue(), 0, 255, 3));
		//Listenery (s�uchacze?) zmian w powy�szych kontrolkach
		R.addChangeListener(this);
		G.addChangeListener(this);
		B.addChangeListener(this);
		//Wy�wietla aktualny kolor
		colorP = new JPanel();
		colorP.setBorder(new LineBorder(Color.BLACK));
		colorP.setBackground(new Color((int) R.getValue(), (int) G.getValue(), (int) B.getValue()));
		//Ka�d� kontrolke trzeba doda� do nadrz�dnego kontenera
		p.add(R);
		p.add(G);
		p.add(B);
		p.add(colorP);
		//Tablica JLabeli, czyli napis�w, wy�wietlanych na ekranie
		JLabel label[] = new JLabel[4];

		label[0] = new JLabel(className() + ":");
		label[1] = new JLabel("Waga(kg):");
		label[2] = new JLabel("Marka:");
		label[3] = new JLabel("Kolor(RGB):");
		//Ustawiay label[0] czcionk�
		label[0].setFont(new Font("Biting My Nails", Font.BOLD, 20));

		p.add(label[0]);
		p.add(label[1]);
		p.add(label[2]);
		p.add(label[3]);

		p.add(s);
		p.add(box);
		//Tworzymy przycisk
		b = new JButton("Save");
		b.addActionListener(this);
		p.add(b);
		//Odleg�o�� mi�dzy napisem a kontrolk�
		int space = 70;
		//Ustawiamy zale�no�ci mi�dzy pozycjami kontrolek (tylko dla SpringLayout)
		l.putConstraint(SpringLayout.WEST, label[0], 20, SpringLayout.WEST, p);
		l.putConstraint(SpringLayout.NORTH, label[0], 20, SpringLayout.WEST, p);

		l.putConstraint(SpringLayout.WEST, label[1], 20, SpringLayout.WEST, label[0]);
		l.putConstraint(SpringLayout.NORTH, label[1], 40, SpringLayout.WEST, label[0]);
		l.putConstraint(SpringLayout.WEST, s, space, SpringLayout.WEST, label[1]);
		l.putConstraint(SpringLayout.NORTH, s, 0, SpringLayout.NORTH, label[1]);

		l.putConstraint(SpringLayout.NORTH, label[2], 30, SpringLayout.NORTH, label[1]);
		l.putConstraint(SpringLayout.WEST, label[2], 0, SpringLayout.WEST, label[1]);
		l.putConstraint(SpringLayout.WEST, box, space, SpringLayout.WEST, label[2]);
		l.putConstraint(SpringLayout.NORTH, box, 0, SpringLayout.NORTH, label[2]);

		l.putConstraint(SpringLayout.NORTH, label[3], 30, SpringLayout.NORTH, label[2]);
		l.putConstraint(SpringLayout.WEST, label[3], 0, SpringLayout.WEST, label[2]);
		l.putConstraint(SpringLayout.WEST, R, space, SpringLayout.WEST, label[3]);
		l.putConstraint(SpringLayout.NORTH, R, 0, SpringLayout.NORTH, label[3]);
		l.putConstraint(SpringLayout.WEST, G, 1, SpringLayout.EAST, R);
		l.putConstraint(SpringLayout.NORTH, G, 0, SpringLayout.NORTH, label[3]);
		l.putConstraint(SpringLayout.WEST, B, 1, SpringLayout.EAST, G);
		l.putConstraint(SpringLayout.NORTH, B, 0, SpringLayout.NORTH, label[3]);

		l.putConstraint(SpringLayout.WEST, colorP, 5, SpringLayout.EAST, B);
		l.putConstraint(SpringLayout.NORTH, colorP, 0, SpringLayout.NORTH, label[3]);
		l.putConstraint(SpringLayout.EAST, colorP, 20, SpringLayout.WEST, colorP);
		l.putConstraint(SpringLayout.SOUTH, colorP, 20, SpringLayout.NORTH, colorP);
		//Sprawdzamy czy klasa podrz�dna chce doda� do interfejsu co� od siebie
		JPanel gotPanel = userPanel();
		if (gotPanel != null) {
			p.add(gotPanel);
			l.putConstraint(SpringLayout.NORTH, gotPanel, 30, SpringLayout.NORTH, label[3]);
			l.putConstraint(SpringLayout.WEST, gotPanel, 0, SpringLayout.WEST, label[3]);

			l.putConstraint(SpringLayout.NORTH, b, 5, SpringLayout.SOUTH, gotPanel);
			l.putConstraint(SpringLayout.WEST, b, 0, SpringLayout.WEST, gotPanel);
		} else {
			l.putConstraint(SpringLayout.NORTH, b, 5, SpringLayout.SOUTH, label[3]);
			l.putConstraint(SpringLayout.WEST, b, 1, SpringLayout.WEST, label[3]);
		}
	}
	//Interfejs ChangeEvent wymaga tej metody
	public void stateChanged(ChangeEvent e) {
		colorP.setBackground(new Color((int) R.getValue(), (int) G.getValue(), (int) B.getValue()));
	}
	//Nadpisujemy funkcj� deserialiacji
	private void readObject(ObjectInputStream ois) throws IOException, ClassNotFoundException {
		//Wywo�ujemy domy�ln� funkcje deserializacji
		ois.defaultReadObject();
		//Wywo�ujemy funkcje init ustawiaj�c� wszystkie kontrolki
		init();
	}
	//Interfejs ActionEvent wymaga tej metody
	public void actionPerformed(ActionEvent arg0) {
		waga = (int) s.getValue();
		marka = (String) box.getSelectedItem();
		color = new Color((int) R.getValue(), (int) G.getValue(), (int) B.getValue());
		commitData();
		IO io = new IO(path);
		//Po pomy�lnej serializacji przycisk zmienia kolor na zielony, wpp na czerwony
		if (io.write(getObject()))
			b.setBackground(Color.GREEN);
		else b.setBackground(Color.RED);
		//W�tek zmienia po +/- 1000ms kolor buttona z powrotem na domy�lny
		new Thread(new Runnable(){
			public void run() {
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}b.setBackground(null);	
			}			
		}).start();
	}

}
