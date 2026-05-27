class Car {
  String brand;

  Car(this.brand);

  Car.namedConstructor() : brand = "Unknown Brand";

  void start() {
    print("$brand car is starting...");
  }
}

class ElectricCar extends Car {
  ElectricCar(String brand) : super(brand);

  @override
  void start() {
    print("$brand electric car is starting silently...");
  }
}

void exercise4() {
  Car car1 = Car("Mecedes");
  car1.start();

  Car car2 = Car.namedConstructor();
  car2.start();

  ElectricCar tesla = ElectricCar("Tesla");
  tesla.start();
}
