some() async {
  var list = [1, 2, 3, 4];

  // We are using these for loops for awaiting operations because simple forEach loop
  // doesn't support or wait for asynchronous operations

// ------------- Wrong Method ----------------------------------------------------------
  list.forEach((element) async {
    // This for loop will not wait for await
    // That means it will carry the program on the single thread
    await Future.delayed(Duration(seconds: 2)).then((value) {
      print(element);
    });
  });
// ---------------------------------------------------------------------------------------------

  // In this for loop you can use await keyword of the function only
  for (var val in list) {
    await Future.delayed(Duration(seconds: 2)).then((value) {
      print(val);
    });
  }

  // Correct Method
  //  Future For loop
  await Future.forEach(list, (int val) async {
    await Future.delayed(Duration(seconds: 2)).then((value) {
      print(val);
    });
  });

  print("Ex");
}
