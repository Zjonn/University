package core;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class IO {

	String path;

	public IO(String path) {
		this.path = path;
	}

	public Object read() {
		try {
			FileInputStream i = new FileInputStream(new File(path));
			ObjectInputStream itr = new ObjectInputStream(i);
			Object o = itr.readObject();
			itr.close();
			return o;
		} catch (FileNotFoundException e) {
			 e.printStackTrace();
		} catch (IOException e) {
			 e.printStackTrace();
		} catch (ClassNotFoundException e) {
			 e.printStackTrace();
		}
		return null;
	}

	public boolean write(Object o) {
		try {
			FileOutputStream out = new FileOutputStream(new File(path));
			ObjectOutputStream otr = new ObjectOutputStream(out);
			otr.writeObject(o);
			otr.close();
			return true;
		} catch (FileNotFoundException e) {
			 e.printStackTrace();
		} catch (IOException e) {
			 e.printStackTrace();
		}
		return false;
	}

}
