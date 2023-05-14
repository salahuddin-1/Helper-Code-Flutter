String generateRandomKey() {
  // Here char codes are ASCII values
  // A - 65
  // B - 66
  // C - 67 ..... so on

  // Alphabets and numbers
  const String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  // Generates a Random int number, provide a maximum limit
  Random _rnd = Random();

  // Length of the generated iterable
  int lengthOfArray = 32;

  // Array of int contaning code units of random chars from the _chars String
  Iterable<int> randomArray = Iterable.generate(
    lengthOfArray,
    (_) {
      // Max limit of the random no.
      int max = _chars.length; // length = 64

      // Generated Random Number within max limit
      int randomNo = _rnd.nextInt(max);

      // Get the random code unit of the characters provided in this String
      // 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890'
      int codeUnit = _chars.codeUnitAt(randomNo);

      return codeUnit;
    },
  );

  // Will return a String having the values from the provided Char Codes
  String randomKey = String.fromCharCodes(randomArray);

  return randomKey;
}
