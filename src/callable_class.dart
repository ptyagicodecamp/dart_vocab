//Callable class can be used for writing 'named functions'

void main() {
  Addition addition = Addition();
  var result = addition(1, 2);
  print(result);
}

class Addition {
  int call(int a, int b) => a + b;
}
