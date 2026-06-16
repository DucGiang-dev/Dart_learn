# Bài 09: List trong Dart

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- `List` là gì.
- Cách tạo danh sách.
- Cách truy cập phần tử trong danh sách.
- Cách lặp qua danh sách.

## List là gì?

`List` dùng để lưu nhiều giá trị trong cùng một biến.

Ví dụ, bạn muốn lưu nhiều tên:

```dart
List<String> names = ['Giang', 'An', 'Mai'];
```

## Index trong List

Các phần tử trong `List` được đánh số từ `0`.

```dart
List<String> names = ['Giang', 'An', 'Mai'];

print(names[0]);
print(names[1]);
print(names[2]);
```

Kết quả:

```text
Giang
An
Mai
```

## Tạo List số

```dart
List<int> scores = [8, 9, 10];
```

## Lặp qua List

```dart
void main() {
  List<String> names = ['Giang', 'An', 'Mai'];

  for (String name in names) {
    print(name);
  }
}
```

## Ví dụ tính tổng điểm

```dart
void main() {
  List<int> scores = [8, 9, 10];

  int sum = 0;

  for (int score in scores) {
    sum += score;
  }

  print(sum);
}
```

Kết quả:

```text
27
```

## Ghi nhớ

- `List` lưu nhiều giá trị.
- Phần tử đầu tiên có index `0`.
- Dùng `for` để duyệt qua danh sách.

## Bài tập nhỏ

Cho danh sách:

```dart
List<int> numbers = [3, 5, 7, 9];
```

Hãy viết code in từng số trong danh sách ra màn hình.
