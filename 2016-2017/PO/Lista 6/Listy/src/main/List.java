package main;

import java.io.Serializable;

public class List<T> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	ListStruct<T> list;

	public List() {
		list = new ListStruct<T>(null, list, list);
		list.setnNode(list);
		list.setpNode(list);
	}

	public void add(T val) {
		ListStruct<T> newList = new ListStruct<T>(val, list.pNode, list);
		list.pNode = newList;
	}

	public T removeFirst() {
		T val = list.pNode.val;
		list.pNode = list.pNode.pNode;
		return val;
	}

	public T removeLast() {
		T val = list.nNode.val;
		list.nNode = list.nNode.nNode;
		return val;
	}

}
