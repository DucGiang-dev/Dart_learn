import 'dart:async';

class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: \$$price)';
  }
}

class ProductRepository {
  final List<Product> _products = [
    Product(
      id: 1,
      name: 'Laptop',
      price: 5000.0,
    ), // Giá 5000.0 theo chỉnh sửa của bạn
    Product(id: 2, name: 'Mouse', price: 50.0),
  ];

  // StreamController broadcast cho phép nhiều subscriber cùng lắng nghe
  final StreamController<Product> _controller =
      StreamController<Product>.broadcast();

  // getAll giả lập lấy dữ liệu bất đồng bộ (Future)
  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(seconds: 1));
    return List.unmodifiable(_products);
  }

  // liveAdded trả về stream cập nhật dữ liệu thời gian thực
  Stream<Product> liveAdded() {
    return _controller.stream;
  }

  // Thêm sản phẩm mới và đẩy sự kiện qua Stream
  void addProduct(Product product) {
    _products.add(product);
    if (!_controller.isClosed) {
      _controller.add(product);
    }
  }

  void dispose() {
    _controller.close();
  }
}

Future<void> exercise1() async {
  print("==================================================");
  print("BÀI TẬP 1: Product Model & Repository (Future & Stream)");
  print("==================================================");

  final ProductRepository repo = ProductRepository();

  // Lấy dữ liệu bất đồng bộ qua Future
  print("[Future] Đang tải danh sách sản phẩm...");
  final initialProducts = await repo.getAll();
  print("[Future] Danh sách sản phẩm hiện tại:");
  for (var product in initialProducts) {
    print("  - $product");
  }

  // Đăng ký lắng nghe sự kiện Stream
  print("\n[Stream] Đăng ký lắng nghe sản phẩm mới thêm vào...");
  final StreamSubscription<Product> subscription = repo.liveAdded().listen((
    product,
  ) {
    print("  [Stream] Có sản phẩm mới được thêm: $product");
  }, onDone: () => print("  [Stream] Đã đóng kết nối stream."));

  // Thêm sản phẩm để kiểm tra Stream
  print("\n[Action] Thêm sản phẩm: Keyboard...");
  repo.addProduct(Product(id: 3, name: 'Keyboard', price: 80.0));

  print("[Action] Thêm sản phẩm: Monitor...");
  repo.addProduct(Product(id: 4, name: 'Monitor', price: 300.0));

  // Chờ stream nhận dữ liệu trước khi đóng
  await Future.delayed(Duration(milliseconds: 100));

  print("\n[Clean Up] Hủy đăng ký và đóng repository...");
  await subscription.cancel();
  repo.dispose();
  print("HOÀN THÀNH BÀI TẬP 1.\n");
}
