abstract class Person {
  int age;
  int name;

  eat() {}
  sleep() {}
}

class Artist extends Person with Sketching {
  sketchLandscape() {
    sketch("Making landscapes sketches");
  }
}

class Engineer extends Person with Sketching, Reading {
  sketchBuildings() {
    sketch("Sketching engineering drawings");
  }

  readResearchPaper() {
    String topic = "Building Construction";
    dailyReading(topic);
  }
}

class Doctor extends Person with Reading, Exercise {
  readReports() {
    String topic = "covid";
    dailyReading(topic);
  }

  workout() {
    running(1);
    weightTraining(10);
  }
}

//Mixins
mixin Sketching {
  sketch(String message) {
    print(message);
  }
}

mixin Reading {
  dailyReading(String topic) {
    print("Daily reading on ${topic}");
  }
}

mixin Exercise {
  running(int mile) {
    print("Daily run of ${mile} mile(s)");
  }

  weightTraining(int weights) {
    print("Lifting ${weights} lbs");
  }
}

//Example: Restricting mixin Usage
class Athlete extends Person with Exercise {
  generalRoutine() {
    running(2);
    weightTraining(20);
  }
}

class Boxer extends Athlete with Boxing {
  punchPractice() {
    punch(100);
  }

  routineExercise() {
    running(4);
    weightTraining(40);
  }
}

//Only Player's subclasses can use this mixin
mixin Boxing on Athlete {
  punch(int n) {
    print("Boxer practicing ${n} punches");
  }
}

void main() {
  print("Artist");
  Artist artist = Artist();
  artist.sketchLandscape();

  print("\nEngineer");
  Engineer engineer = Engineer();
  engineer.sketchBuildings();
  engineer.readResearchPaper();

  print("\nDoctor");
  Doctor doctor = Doctor();
  doctor.readReports();
  doctor.workout();

  print("\nBoxer");
  Boxer boxer = Boxer();
  boxer.punchPractice();
  boxer.routineExercise();
}
