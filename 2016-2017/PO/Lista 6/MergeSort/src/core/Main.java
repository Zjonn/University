package core;

public class Main {

	public static void main(String[] args) {
		MergeSort s = new MergeSort();
		int[] tab = {4,77,12,14,23};
		int[] t = s.sort(tab);
		System.out.println(t.length);
		for(int i = 0;i<t.length;i++){
			System.out.print(t[i] + ",");
		}
		
	}

}
