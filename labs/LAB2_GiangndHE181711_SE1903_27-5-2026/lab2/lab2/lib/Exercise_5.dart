Future<void> exercise5() async {
  print("Loading data...");
  String data = await fetchData();
  print(data);

  String? name;
  print("Name: ${name ?? "No name"}");

  name = "Giang";
  print("Name length: ${name.length}");

  Stream<int> numberStream = Stream.fromIterable([1, 2, 3, 4, 5]);

  await for (int number in numberStream) {
    print("Stream value: $number");
  }
}

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return "Data loaded successfully!";
}
