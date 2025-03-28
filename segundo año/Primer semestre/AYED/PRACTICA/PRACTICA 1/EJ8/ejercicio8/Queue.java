package tp1.ejercicio8;

import java.util.LinkedList;
import java.util.*;
import java.util.List;

public class Queue<T> extends Sequence {
	
private List<T> Queue = new ArrayList();

public Queue() {
	}

public void enqueue(T data) {
	Queue.add(data);
}
public T dequeue() {
	return this.Queue.remove(0);
}
public T head () {
	return this.Queue.getFirst();
}
public int size(){
	return Queue.size();
}
public boolean isEmpty() {
	return Queue.isEmpty();
	}
public String toString () {
	return Queue.toString();
}

}