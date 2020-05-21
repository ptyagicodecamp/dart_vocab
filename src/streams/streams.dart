void main() {
  //Run Example#1.
  //createStreamUsingGenerators();

  //Run Example#2.
  createStreamFromIterable();
}

//Example#1. Creating Stream (of numbers) using asynchronous Generators
//Using yield, async*

//This will return a reference to the stream
Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i; //to be able to send spaced out events
  }
}

//Printing numbers/events of Stream (Listening to Stream)
printStream(Stream stream) {
  stream.listen((s) => print(s));
}

void createStreamUsingGenerators() async {
  //Using `yield`, async* keywords
  var stream = createNumberStream(5);
  printStream(stream);
}
//----END----//

//Example#2. Creating Stream of numbers using  `Stream.fromIterable()` method

void createStreamFromIterable() {
  var numbers = [1, 2, 3, 4, 5];
  Stream stream = new Stream.fromIterable(numbers);
  printStream(stream);
}
//----END----//
