# Bài 07: Vòng lặp for

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- Vòng lặp là gì.
- Khi nào dùng `for`.
- Cách viết vòng lặp `for` trong Dart.

## Vòng lặp là gì?

Vòng lặp dùng để lặp lại một công việc nhiều lần.

Ví dụ, bạn muốn in số từ 1 đến 5. Thay vì viết 5 lần `print()`, bạn dùng vòng lặp.

## Cấu trúc for

```dart
for (int i = 1; i <= 5; i++) {
  print(i);
}
```

Giải thích:

```text
int i = 1   bắt đầu từ 1
i <= 5      chạy khi i nhỏ hơn hoặc bằng 5
i++         tăng i thêm 1 sau mỗi vòng
```

## Ví dụ

```dart
void main() {
  for (int i = 1; i <= 5; i++) {
    print(i);
  }
}
```

Kết quả:

```text
1
2
3
4
5
```

## Lặp qua danh sách

Khi học `List`, bạn sẽ dùng `for` nhiều hơn.

Ví dụ:

```dart
void main() {
  List<String> names = ['Giang', 'An', 'Mai'];

  for (String name in names) {
    print(name);
  }
}
```

Kết quả:

```text
Giang
An
Mai
```

## Ghi nhớ

- `for` dùng để lặp.
- `i++` nghĩa là tăng `i` thêm 1.
- Vòng lặp giúp tránh viết lặp code nhiều lần.

## Bài tập nhỏ

Hãy viết vòng lặp in các số từ 1 đến 10.

Gợi ý:

```dart
for (int i = 1; i <= 10; i++) {
  print(i);
}
```
