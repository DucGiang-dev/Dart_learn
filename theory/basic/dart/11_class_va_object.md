# Bài 11: Class và object

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- Class là gì.
- Object là gì.
- Thuộc tính là gì.
- Constructor là gì.

## Class là gì?

Class là bản thiết kế hoặc khuôn mẫu.

Ví dụ, bạn muốn mô tả một sinh viên. Sinh viên có:

- Tên.
- Tuổi.
- Mã sinh viên.

Bạn có thể tạo class `Student`.

## Object là gì?

Object là một bản thể cụ thể được tạo từ class.

Nếu `Student` là khuôn mẫu, thì `student1` là một object sinh viên cụ thể.

## Ví dụ class đơn giản

```dart
class Student {
  String name;
  int age;
  String mssv;

  Student(this.name, this.age, this.mssv);
}
```

Giải thích:

```text
class Student       tạo khuôn mẫu tên Student
String name         thuộc tính tên
int age             thuộc tính tuổi
String mssv         thuộc tính mã sinh viên
Student(...)        constructor dùng để tạo object
```

## Tạo object

```dart
void main() {
  Student student1 = Student('Giang', 21, 'HE181711');

  print(student1.name);
  print(student1.age);
  print(student1.mssv);
}
```

## final trong class

Nếu thuộc tính không đổi sau khi tạo object, nên dùng `final`.

```dart
class Student {
  final String name;
  final int age;
  final String mssv;

  Student(this.name, this.age, this.mssv);
}
```

## Constructor có tên tham số

Cách này dễ đọc hơn khi có nhiều thuộc tính.

```dart
class Student {
  final String name;
  final int age;
  final String mssv;

  Student({
    required this.name,
    required this.age,
    required this.mssv,
  });
}
```

Sử dụng:

```dart
Student student1 = Student(
  name: 'Giang',
  age: 21,
  mssv: 'HE181711',
);
```

## Ghi nhớ

- Class là khuôn mẫu.
- Object là bản thể cụ thể.
- Thuộc tính là dữ liệu của object.
- Constructor dùng để tạo object.
- `required` nghĩa là bắt buộc truyền giá trị.

## Bài tập nhỏ

Tạo class `Book` có:

- `title`
- `author`
- `price`

Sau đó tạo một object `book1` và in tên sách ra màn hình.
