package entity;

public class sc {
	public static void main(String[] args) {
		String a = "Hello";
		String b = "world";
		String x = "Hello" + b;
		String y = "HelloWorld";
		System.out.println(a == "Hello");
		System.out.println(b == "Hello");
		System.out.println(x == a+b);
		System.out.println(y == "Hello" + "World");
	}
}
