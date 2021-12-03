// Some understandings of Future
methodWithAsync() async {
  var list = [1, 2, 3, 4];

  await Future.forEach(list, (int val) async {
    await Future.delayed(Duration(seconds: 2)).then((value) {
      print(val);
    });
  });

  print("Ex");
}

methodWithoutAsync() {
  var list = [1, 2, 3, 4];

  // This Future will get awaited on a single thread
  // And will do its job by printing values by its future
  // But we are awaiting the future inside it and not the future outside
  // so before printing the 1st value in the list print("ex"); will get printed
  // To Avoid that await the Future forloop and mark this function as async
  // Refer above example
  Future.forEach(list, (int val) async {
    await Future.delayed(Duration(seconds: 2)).then((value) {
      print(val);
    });
  });

  print("Ex");
}
