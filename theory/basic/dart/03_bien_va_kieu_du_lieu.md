# Bài 03: Biến và kiểu dữ liệu

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- Biến là gì.
- Kiểu dữ liệu là gì.
- Cách khai báo biến trong Dart.
- Các kiểu dữ liệu cơ bản: `int`, `double`, `String`, `bool`.

## Biến là gì?

Biến là nơi lưu trữ dữ liệu.

Ví dụ, bạn muốn lưu tên của một người:

```dart
String name = 'Giang';
```

Trong đó:

- `String` là kiểu dữ liệu.
- `name` là tên biến.
- `'Giang'` là giá trị.

## Kiểu dữ liệu là gì?

Kiểu dữ liệu cho Dart biết dữ liệu đó thuộc loại nào.

Ví dụ:

```text
21        là số nguyên
1.75      là số thực
'Giang'   là chuỗi
true      là đúng/sai
```

## Các kiểu dữ liệu cơ bản

### `int`

Dùng cho số nguyên.

```dart
int age = 21;
```

Ví dụ giá trị `int`:

```text
1
10
2026
-5
```

### `double`

Dùng cho số thực.

```dart
double height = 1.75;
```

Ví dụ giá trị `double`:

```text
3.14
9.5
0.1
```

### `String`

Dùng cho chuỗi ký tự.

```dart
String name = 'Giang';
```

Chuỗi có thể viết bằng dấu nháy đơn hoặc nháy kép:

```dart
String name1 = 'Dart';
String name2 = "Dart";
```

### `bool`

Dùng cho giá trị đúng hoặc sai.

```dart
bool isStudent = true;
```

Chỉ có hai giá trị:

```text
true
false
```

## Ví dụ tổng hợp

```dart
void main() {
  String name = 'Giang';
  int age = 21;
  double height = 1.75;
  bool isStudent = true;

  print(name);
  print(age);
  print(height);
  print(isStudent);
}
```

## Ghi nhớ

- Biến dùng để lưu dữ liệu.
- Kiểu dữ liệu cho biết dữ liệu thuộc loại nào.
- `int` là số nguyên.
- `double` là số thực.
- `String` là chuỗi.
- `bool` là đúng/sai.

## Bài tập nhỏ

Hãy viết nháp, chưa cần chạy:

1. Biến lưu tên của bạn nên dùng kiểu gì?
2. Biến lưu tuổi nên dùng kiểu gì?
3. Biến lưu chiều cao nên dùng kiểu gì?
4. Biến lưu trạng thái “có phải sinh viên không” nên dùng kiểu gì?
