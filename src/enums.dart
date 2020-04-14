//`enum` is a keyword to declare enumerated (a.k.a enums) types.
//Enums is like a class to represent a fixed number of constant values.
//Enums are added as an experimental feature in Dart 1.8 release: https://news.dartlang.org/2014/11/dart-18-library-improvements-and.html
enum Weather {
  SUNNY,
  CLOUDY,
  RAINY,
}

void main() {
  const SUNNY = 'Sunny';
  const CLOUDY = 'Cloudy';
  const RAINY = 'Rainy';

  //#1. Difference between const and enums
  //switch doesn't complain for const, but raise error for enums
  var choice = CLOUDY;
  switch (choice) {
    case CLOUDY:
      print("Cloudy today");
      break;
  }

  var weather = Weather.SUNNY;

//  switch (weather) {
//    case Weather.SUNNY:
//      print("Sunny weather today!");
//      break;
//  }

  //#2. enums can iterate on all types at once.
  //No need to create a list of consts
  //Weather.values.forEach((w) => print(w));

  //#3. Enum extensions
  Weather.values.forEach((w) => w.console());
}

extension WeatherExt on Weather {
  static final weatherMap = {
    Weather.SUNNY: "What a lovely weather",
    Weather.CLOUDY: "Scattered showers predicted",
    Weather.RAINY: "Will be raining today",
  };

  void console() {
    print("${this.index} ${this.about}");
  }

  String get about => weatherMap[this];
}
