void exercise3() {
  int score = 75;

  if (score >= 80) {
    print("Good");
  } else if (score >= 50) {
    print("Pass");
  } else {
    print("Fail");
  }

  int day = 2;

  switch (day) {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    case 3:
      print("Wednesday");
      break;
    case 4:
      print("Thursday");
      break;
    case 5:
      print("Friday");
      break;
    case 6:
      print("Saturday");
      break;
    case 7:
      print("Sunday");
      break;
    default:
      print("Invalid day");
      break;
  }

  List<String> names = ["Hoang", "Quang", "Chien"];

  for (int i = 0; i < names.length; i++) {
    print("For loop: ${names[i]}");
  }

  for (String name in names) {
    print("For-in loop: $name");
  }

  names.forEach((name) {
    print("forEach: $name");
  });

  print("Sum: ${sum(5, 3)}");
  print("Square: ${square(4)}");
}

// Normal function
int sum(int a, int b) {
  return a + b;
}

// Arrow function
int square(int number) => number * number;
