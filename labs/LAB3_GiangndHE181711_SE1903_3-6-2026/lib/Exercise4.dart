import 'dart:async';

Future<void> exercise4() async {
  print("==================================================");
  print("BÀI TẬP 4: Biến đổi Stream (Stream Transformation)");
  print("==================================================");

  // Tạo stream phát các số từ 1 đến 5
  final Stream<int> rawNumberStream = Stream.fromIterable([1, 2, 3, 4, 5]);
  print("[Stream Init] Đã tạo stream phát các số: 1, 2, 3, 4, 5");

  // Biến đổi stream: tính bình phương (map) và chỉ lấy số chẵn (where)
  final Stream<int> transformedStream = rawNumberStream
      .map((number) {
        final squared = number * number;
        print("  [map] Số: $number -> Bình phương: $squared");
        return squared;
      })
      .where((squaredNumber) {
        final isEven = squaredNumber % 2 == 0;
        print("  [where] Bình phương: $squaredNumber -> Chẵn? $isEven");
        return isEven;
      });

  final completer = Completer<void>();

  print("\n[Listen] Đăng ký lắng nghe kết quả (Bình phương chẵn)...");
  transformedStream.listen(
    (value) {
      print("  -> [Result] Nhận kết quả: $value");
    },
    onDone: () {
      print("[Listen] Stream đã kết thúc.");
      completer.complete();
    },
    cancelOnError: true,
  );

  await completer.future;
  print("HOÀN THÀNH BÀI TẬP 4.\n");
}
