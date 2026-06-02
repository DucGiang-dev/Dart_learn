import 'package:lab3/Exercise1.dart' as Exercise1;
import 'package:lab3/Exercise2.dart' as Exercise2;
import 'package:lab3/Exercise3.dart' as Exercise3;
import 'package:lab3/Exercise4.dart' as Exercise4;
import 'package:lab3/Exercise5.dart' as Exercise5;

/// Coordinator function for the entire Lab 3 project.
/// Each exercise is executed sequentially to prevent overlapping output.
Future<void> main(List<String> arguments) async {
  print("================================================================");
  print("          LAB 3: ADVANCED DART PRACTICE EXERCISES               ");
  print("================================================================");
  print("Student Name: GiangndHE181711");
  print("Class: SE1903");
  print("================================================================\n");

  // Run Exercise 1: Product Model & Repository (Futures & Streams)
  await Exercise1.exercise1();

  // Run Exercise 2: User Repository with JSON (JSON handling)
  await Exercise2.exercise2();

  // Run Exercise 3: Async + Microtask Debugging (Event Loop vs Microtasks)
  await Exercise3.exercise3();

  // Run Exercise 4: Stream Transformation (map and where functional filters)
  await Exercise4.exercise4();

  // Run Exercise 5: Factory Constructors & Cache (Singleton/Multiton caching)
  Exercise5.exercise5();

  print("================================================================");
  print("         ALL EXERCISES EXECUTED AND COMPLETED SUCCESSFULLY       ");
  print("================================================================");
}
