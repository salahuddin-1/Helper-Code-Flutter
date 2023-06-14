import 'dart:isolate';

// Main isolate is the default isolate that runs when the app starts
// Spawned isolate is the isolate that is created by the main isolate

// 1. The isolate function should be a top level function, where u use the 
// sendport.send. If it's not a top level function it doesn't work

// 2. You can pass Objects, other datatypes too in isolates and receive them


// Steps
// Create a ReceivePort object
// This object will be used to listen for messages and have a sendPort
// This sendPort object will be used in the isolate method to send messages back
// to the main isolate
// Create a model class to pass arguments to the isolate
// Create a method that will be called from the main isolate

class IsolateExample {
  // This call will start the process of creating a new isolate
  void startIsolate() {
    // Create a ReceivePort to receive messages from the isolate
    final receivePort = ReceivePort();

    IsolateArguments params = IsolateArguments(
      receivePort.sendPort,
      args: 'This is an argument',
    );

    // Spawn a new isolate and pass the sendPort of the receivePort
    Isolate.spawn<IsolateArguments>(
      _isolateFunction,
      params,
    );

    // Listen for messages from the isolate
    receivePort.listen((message) {
      // Handle the received message from the isolate
      print('Main: Received message from isolate: $message');
    });
  }

  // This function will get called from the main
  // Do some heavy task in this function like API call, etc.
  void _isolateFunction(IsolateArguments params) {
    // This code runs in the spawned isolate
    print('Isolate: Start');

    // Perform some time-consuming task
    String result = 'Result of time-consuming task';

    // You can access the arguments passed to the isolate like this
    print(params.args);

    // Send the result back to the main isolate
    params.sendPort.send(result);

    print('Isolate: End');
  }
}

// This model class is used to pass arguments to the isolate just like a usecase
class IsolateArguments {
  final SendPort sendPort;
  final String args;

  IsolateArguments(
    this.sendPort, {
    required this.args,
  });
}
