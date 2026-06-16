# Bài 02: Cấu trúc chương trình Dart

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- Hàm `main` là gì.
- Vì sao chương trình Dart cần `main`.
- Cách viết chương trình Dart đầu tiên.

## Lý thuyết

Mọi chương trình Dart thường bắt đầu từ hàm `main`.

Hàm là một khối lệnh có tên. Khi hàm được gọi, các câu lệnh bên trong hàm sẽ chạy.

Hàm `main` là hàm đặc biệt. Khi bạn chạy chương trình Dart, Dart sẽ tìm hàm `main` để bắt đầu.

## Cấu trúc cơ bản

```dart
void main() {
  // Các câu lệnh của chương trình
}
```

Giải thích:

```text
void   = hàm không trả về giá trị
main   = tên hàm đặc biệt
()     = danh sách tham số, hiện tại chưa có tham số
{}     = thân hàm, nơi viết các câu lệnh
```

## Ví dụ chương trình đầu tiên

```dart
void main() {
  print('Xin chào Dart');
}
```

Khi chạy, chương trình sẽ in ra:

```text
Xin chào Dart
```

## Dấu chấm phẩy

Trong Dart, mỗi câu lệnh thường kết thúc bằng dấu `;`.

Ví dụ:

```dart
print('Hello');
print('Dart');
```

Nếu thiếu dấu `;`, chương trình có thể báo lỗi.

## Ghi nhớ

- Hàm `main` là điểm bắt đầu của chương trình.
- `print()` dùng để in thông tin.
- Mỗi câu lệnh nên kết thúc bằng `;`.

## Bài tập nhỏ

Chưa cần chạy code. Hãy đọc đoạn code sau và đoán kết quả:

```dart
void main() {
  print('Bài 1');
  print('Bài 2');
}
```

Kết quả sẽ in ra mấy dòng?
