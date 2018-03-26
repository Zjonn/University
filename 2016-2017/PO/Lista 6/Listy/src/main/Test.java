package main;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class Test {

	public static void main(String[] args) {
		List<Integer> l = new List<Integer>();
		l.add(5);
		l.add(7);
		System.out.println(l.removeFirst());
		
		
		try {
			FileOutputStream s = new FileOutputStream(new File("test.txt"));
			ObjectOutputStream str = new ObjectOutputStream(s);
			str.writeObject(l);
			str.close();
			
			FileInputStream i = new FileInputStream(new File("test.txt"));
			ObjectInputStream itr = new ObjectInputStream(i);
			itr.readObject();
			itr.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
