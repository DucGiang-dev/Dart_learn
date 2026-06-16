# Bài 05: Toán tử trong Dart

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- Toán tử số học.
- Toán tử so sánh.
- Toán tử logic.
- Cách dùng toán tử trong chương trình Dart.

## Toán tử là gì?

Toán tử là ký hiệu dùng để thực hiện phép tính hoặc kiểm tra điều kiện.

Ví dụ:

```dart
int result = 5 + 3;
```

Trong đó `+` là toán tử cộng.

## Toán tử số học

| Toán tử | Ý nghĩa | Ví dụ |
|---|---|---|
| `+` | Cộng | `5 + 3` |
| `-` | Trừ | `5 - 3` |
| `*` | Nhân | `5 * 3` |
| `/` | Chia | `6 / 3` |
| `%` | Lấy phần dư | `7 % 3` |

Ví dụ:

```dart
void main() {
  int a = 10;
  int b = 3;

  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b);
  print(a % b);
}
```

## Toán tử so sánh

Toán tử so sánh trả về `true` hoặc `false`.

| Toán tử | Ý nghĩa |
|---|---|
| `==` | Bằng |
| `!=` | Khác |
| `>` | Lớn hơn |
| `<` | Nhỏ hơn |
| `>=` | Lớn hơn hoặc bằng |
| `<=` | Nhỏ hơn hoặc bằng |

Ví dụ:

```dart
void main() {
  int age = 18;

  print(age >= 18);
  print(age < 18);
}
```

Kết quả:

```text
true
false
```

## Toán tử logic

| Toán tử | Ý nghĩa |
|---|---|
| `&&` | Và |
| `||` | Hoặc |
| `!` | Phủ định |

Ví dụ:

```dart
void main() {
  bool isStudent = true;
  bool hasTicket = false;

  print(isStudent && hasTicket);
  print(isStudent || hasTicket);
  print(!hasTicket);
}
```

Kết quả:

```text
false
true
true
```

## Ghi nhớ

- Toán tử số học dùng để tính toán.
- Toán tử so sánh trả về `true` hoặc `false`.
- Toán tử logic dùng để kết hợp nhiều điều kiện.

## Bài tập nhỏ

Cho:

```dart
int a = 10;
int b = 4;
```

Hãy đoán kết quả:

1. `a + b`
2. `a - b`
3. `a * b`
4. `a / b`
5. `a % b`
6. `a > b`
