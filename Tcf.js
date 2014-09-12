try {
	try {
		throw new Error("Foo");
	}
	catch (ex) {
		print("Inner Catch");
		throw ex;
	}
	finally {
		print("Inner Finally");
	}
}
catch (ex) {
	print("Outter Catch");
}
finally {
	print("Outter Finally");
}