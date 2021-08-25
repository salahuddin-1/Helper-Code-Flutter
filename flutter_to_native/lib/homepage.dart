import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_to_native/resources/java_platform_code.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final javaCodeApi = JavaPlatformCode();
  String _result = "";

  void callCodeFromNative() async {
    String result = await javaCodeApi.callMethod();

    setState(
      () {
        _result = result;
      },
    );
  }

  clearResult() {
    setState(() {
      _result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calling code from java"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: callCodeFromNative,
              child: Text("Get Code from Native"),
            ),
            Text("Result: $_result"),
            ElevatedButton(
              onPressed: callCodeFromNative,
              child: Text("Get Code from Native"),
            ),
          ],
        ),
      ),
    );
  }
}
