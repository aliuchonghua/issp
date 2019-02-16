package com.util.test;

import com.jfinal.kit.PathKit;

public class Test {
	public static void main(String[] args) {
		System.out.println(PathKit.getRootClassPath());
		System.out.println(System.getProperty("user.dir"));
	}
}
