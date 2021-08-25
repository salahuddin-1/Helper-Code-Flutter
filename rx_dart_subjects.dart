import 'package:rxdart/rxdart.dart';

class RXdartPublish {
  // After adding data when a new listener is assigned
  // the listener will not get the previous added data
  final subject = PublishSubject<int>();

  Stream<int> get output => subject.stream;

  Sink get input => subject.sink;

  subscribe() {
    subject.stream.listen((event) {
      print(event);
    });
  }

  RXdartPublish() {
    subject.stream.listen((event) {
      print(event);
    });
  }

  void dispose() {
    subject.close();
  }
}

class RXdartReplay {
  // Replay subject stores data like a collection unlike Publish and Behaviour
  // which stores data like a variable, that means previous data gets overrides
  // after adding a new

  // if data is added After the cntrl reaches max size
  // the last data will get added and the first data will get popped and likewise

  final subject = ReplaySubject<int>(maxSize: 3);

  Stream<int> get output => subject.stream;

  Sink get input => subject.sink;

  RXdartReplay() {
    subject.stream.listen((event) {
      print(event);
    });
  }

  void dispose() {
    subject.close();
  }
}

class RXdartBehaviour {
  // behaviour subject returns the last data whenever a new listener subscribes

  // If stream is empty, the seeded value will get print
  final subject = BehaviorSubject<int>.seeded(2);

  Stream<int> get output => subject.stream;

  Sink get input => subject.sink;

  subscribe() {
    subject.stream.listen((event) {
      print(event);
    });
  }

  RXdartBehaviour() {
    subject.stream.listen((event) {
      print(event);
    });
  }

  void dispose() {
    subject.close();
  }
}
