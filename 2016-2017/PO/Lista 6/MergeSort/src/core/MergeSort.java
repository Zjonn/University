package core;

public class MergeSort {

	int[] an, bn;

	public int[] sort(int[] tab) {
		if (tab.length == 1)
			return tab;

		an = halve(0, tab.length / 2, tab);
		bn = halve(tab.length / 2, tab.length, tab);
		Thread t1 = null, t2 = null;
		if (an.length > 0)
			t1 = new Thread(new Runnable() {
				public void run() {
					// System.out.println(an.length + "thr");
					an = new MergeSort().sort(an);
				}
			});
		if (bn.length > 0)
			t2 = new Thread(new Runnable() {
				public void run() {
					bn = new MergeSort().sort(bn);
					// System.out.println("new");
				}
			});

		if (t1 != null)
			t1.start();
		if (t2 != null)
			t2.start();
		while (t1.isAlive() || t2.isAlive()) {
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return merge(an, bn);
	}

	public int[] merge(int[] a, int[] b) {
		int[] t = new int[a.length + b.length];
		int i = 0, j = 0;
		for (int k = 0; k < t.length; k++) {
			if (j < b.length && i < a.length && a[i] > b[j]) {
				t[k] = b[j];
				j++;
			} else if (j < b.length && i < a.length) {
				t[k] = a[i];
				i++;
			} else if (i == a.length && j < b.length) {
				t[k] = b[j];
				j++;
			} else if (j == b.length && i < a.length) {
				t[k] = a[i];
				i++;
			}
		}
		return t;
	}

	public int[] halve(int a, int b, int tab[]) {
		int[] newTab = new int[b - a];

		for (int i = 0; i < b - a; i++) {
			newTab[i] = tab[a + i];
			// System.out.println(tab[a + i] + ",");
		}
		return newTab;
	}

}
