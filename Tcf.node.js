try {
	try {
		throw new Error("Foo");
	}
	catch (ex) {
		console.log("Inner Catch");
		throw ex;
	}
	finally {
		console.log("Inner Finally");
	}
}
catch (ex) {
	console.log("Outer Catch");
}
finally {
	console.log("Outer Finally");
}
