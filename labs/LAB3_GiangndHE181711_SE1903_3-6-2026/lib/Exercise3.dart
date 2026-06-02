import 'dart:async';

Future<void> exercise3() async {
  print("==================================================");
  print("BÀI TẬP 3: Async + Microtask Debugging (Event Loop)");
  print("==================================================");

  print("[Sync] 1. Bắt đầu chạy code đồng bộ.");

  // Thêm vào Event Queue
  Future(() {
    print("[Event Queue] 5. Tác vụ Event Queue: Chạy Future thông thường.");
  });

  Future.delayed(Duration.zero, () {
    print("[Event Queue] 6. Tác vụ Event Queue: Chạy Future.delayed(zero).");
  });

  // Thêm vào Microtask Queue (ưu tiên cao, chạy ngay sau khi code đồng bộ kết thúc)
  scheduleMicrotask(() {
    print("[Microtask Queue] 3. Tác vụ Microtask: Gọi qua scheduleMicrotask().");
  });

  Future.microtask(() {
    print("[Microtask Queue] 4. Tác vụ Microtask: Gọi qua Future.microtask().");
  });

  print("[Sync] 2. Kết thúc chạy code đồng bộ.");

  print("\n--- Giải thích ngắn gọn về Event Loop ---");
  print("1. Microtask Queue được ưu tiên xử lý trước Event Queue.");
  print("2. Khi code đồng bộ chạy xong, toàn bộ tác vụ trong Microtask Queue sẽ chạy hết");
  print("   rồi mới tới lượt các tác vụ trong Event Queue.");
  print("-------------------------------------------\n");

  await Future.delayed(Duration(milliseconds: 100));
  print("HOÀN THÀNH BÀI TẬP 3.\n");
}
