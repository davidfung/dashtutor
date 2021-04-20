// Isolate SendPort 2-step dance
import 'dart:isolate';

void worker(SendPort parentPort) {
  final receivePort = ReceivePort();
  parentPort.send(receivePort.sendPort);
  parentPort.send('hello from child');
  receivePort.listen((message) {
    print("Child received message: $message");
  });
}

void main() {
  final receivePort = ReceivePort();
  late SendPort sendPort;
  Isolate.spawn<SendPort>(worker, receivePort.sendPort);
  receivePort.listen((message) {
    if (message is SendPort) {
      sendPort = message;
      sendPort.send("hello from parent");
    } else {
      print("Parent received message: $message");
    }
  });
  print("Control-C to terminate the program");
}
