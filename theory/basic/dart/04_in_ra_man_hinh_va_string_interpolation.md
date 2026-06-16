# Bài 04: In ra màn hình và string interpolation

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- Cách dùng `print()`.
- Cách đưa biến vào chuỗi.
- Cách tính toán trong chuỗi bằng `${}`.

## In ra màn hình

Dart dùng `print()` để in thông tin ra màn hình.

```dart
void main() {
  print('Hello Dart');
}
```

Kết quả:

```text
Hello Dart
```

## In nhiều dòng

Bạn có thể gọi `print()` nhiều lần.

```dart
void main() {
  print('Line 1');
  print('Line 2');
  print('Line 3');
}
```

Kết quả:

```text
Line 1
Line 2
Line 3
```

## String interpolation

String interpolation là cách đưa biến vào trong chuỗi.

Dùng ký hiệu `$`.

```dart
void main() {
  String name = 'Giang';
  int age = 21;

  print('My name is $name');
  print('I am $age years old');
}
```

Kết quả:

```text
My name is Giang
I am 21 years old
```

## Tính toán trong chuỗi

Nếu muốn tính toán, dùng `${}`.

```dart
void main() {
  int age = 21;

  print('Next year I will be ${age + 1}');
}
```

Kết quả:

```text
Next year I will be 22
```

## Ví dụ tổng hợp

```dart
void main() {
  String name = 'Giang';
  int age = 21;
  double height = 1.75;

  print('Name: $name');
  print('Age: $age');
  print('Height: $height');
  print('Next year age: ${age + 1}');
}
```

## Ghi nhớ

- `print()` dùng để in.
- `$tenBien` dùng để đưa biến vào chuỗi.
- `${biểu_thức}` dùng để tính toán rồi đưa kết quả vào chuỗi.

## Bài tập nhỏ

Cho các biến:

```dart
String name = 'Giang';
int age = 21;
```

Hãy viết các dòng in ra màn hình:

1. `My name is Giang`
2. `I am 21 years old`
3. `Next year I will be 22`
