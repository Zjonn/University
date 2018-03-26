package main;

import java.io.Serializable;

public class ListStruct<T> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	ListStruct<T> pNode;
	ListStruct<T> nNode; 
	T val;
	
	public ListStruct(T val,ListStruct<T> pNode,ListStruct<T> nNode){
		this.val = val;
		this.pNode = pNode;
		this.nNode = nNode;
	}
	
	public ListStruct<T> getpNode() {
		return pNode;
	}

	public void setpNode(ListStruct<T> pNode) {
		this.pNode = pNode;
	}

	public ListStruct<T> getnNode() {
		return nNode;
	}

	public void setnNode(ListStruct<T> nNode) {
		this.nNode = nNode;
	}

	public T getVal() {
		return val;
	}

	public void setVal(T val) {
		this.val = val;
	}
}
