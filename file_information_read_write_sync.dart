infoAboutAFile() {
  File file;

  // Writes the file synchronously that means without using
  // async await that means the line of code will get executed
  // without waiting for the line to complete as what happens in
  // await keyword
  file.writeAsBytesSync();

  // Writes files Asynchronously
  // Thereby Using async await
  file.writeAsBytes();

  // Same as Write
  file.readAsBytes();
  file.readAsBytesSync();
}
