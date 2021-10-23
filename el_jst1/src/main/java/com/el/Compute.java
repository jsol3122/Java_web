package com.el;

public class Compute {
	public static int sum(String x, String y) { // 주소를 통해 받은 값은 문자열로 들어오기 때문
		return Integer.parseInt(x) + Integer.parseInt(y);
	}
	public static int mul(String x, String y) {
		return Integer.parseInt(x) * Integer.parseInt(y);
	}
}
