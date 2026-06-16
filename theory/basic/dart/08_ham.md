# Bài 08: Hàm trong Dart

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- Hàm là gì.
- Vì sao cần hàm.
- Cách viết hàm có tham số.
- Cách viết hàm trả về giá trị.

## Hàm là gì?

Hàm là một khối lệnh có tên.

Bạn viết hàm để tái sử dụng code.

Ví dụ, thay vì viết phép cộng nhiều lần, bạn tạo một hàm `add`.

## Hàm không trả về giá trị

```dart
void sayHello() {
  print('Hello');
}
```

`void` nghĩa là hàm không trả về giá trị.

Gọi hàm:

```dart
void main() {
  sayHello();
}
```

## Hàm có tham số

Tham số là dữ liệu bạn đưa vào hàm.

```dart
void greet(String name) {
  print('Hello $name');
}
```

Gọi hàm:

```dart
void main() {
  greet('Giang');
}
```

Kết quả:

```text
Hello Giang
```

## Hàm trả về giá trị

Dùng `return` để trả về kết quả.

```dart
int add(int a, int b) {
  return a + b;
}
```

Sử dụng:

```dart
void main() {
  int result = add(5, 3);
  print(result);
}
```

Kết quả:

```text
8
```

## Ví dụ tính điểm trung bình

```dart
double calculateAverage(double math, double english, double dart) {
  return (math + english + dart) / 3;
}

void main() {
  double average = calculateAverage(8.0, 7.0, 9.0);
  print(average);
}
```

## Ghi nhớ

- Hàm giúp tái sử dụng code.
- Tham số là dữ liệu đưa vào hàm.
- `return` trả về kết quả.
- `void` nghĩa là hàm không trả về giá trị.

## Bài tập nhỏ

Viết hàm:

```dart
int multiply(int a, int b)
```

Hàm trả về tích của `a` và `b`.
