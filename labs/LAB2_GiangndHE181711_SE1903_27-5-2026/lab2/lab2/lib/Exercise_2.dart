void exercise2() {
  List<int> numbers = [10, 20, 30];
  Set<String> fruits = {"Apple", "starfruit", "Banana"};
  Map<String, int> scores = {"Math": 90, "English": 85};

  print("List: $numbers");
  print("First number: ${numbers[0]}");

  numbers.add(40);
  numbers.remove(20);
  print(
    "After add/remove: $numbers",
  ); // List: [10, 30, 40] because we added 40 and removed 20

  int a = numbers[0]; // a is 10, the first element of the list in index 0
  int b =
      scores["Math"]!; // b is 90, the value associated with the key "Math" in the scores map

  print("a + b = ${a + b}");
  print("a - b = ${a - b}");
  print("a == b: ${a == b}");
  print("a > b && b > 0: ${a > b && b > 0}");
  print(a > b ? "a is greater" : "b is greater");

  print("Store have: $fruits");

  print("Math score: ${scores["Math"]}");
  print("English score: ${scores["English"]}");
}
