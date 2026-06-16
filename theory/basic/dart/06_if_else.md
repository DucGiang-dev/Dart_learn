# Bài 06: Câu lệnh điều kiện if/else

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- Khi nào dùng `if`.
- Khi nào dùng `else`.
- Cách viết điều kiện trong Dart.

## if là gì?

`if` dùng để kiểm tra một điều kiện.

Nếu điều kiện đúng, Dart sẽ chạy khối lệnh bên trong `if`.

```dart
if (age >= 18) {
  print('You are an adult');
}
```

## else là gì?

`else` dùng cho trường hợp điều kiện sai.

```dart
if (age >= 18) {
  print('You are an adult');
} else {
  print('You are not an adult');
}
```

## Ví dụ

```dart
void main() {
  int score = 8;

  if (score >= 8) {
    print('Excellent');
  } else {
    print('Keep practicing');
  }
}
```

Vì `score >= 8` đúng, kết quả là:

```text
Excellent
```

## Điều kiện trả về true hoặc false

Điều kiện trong `if` phải là kiểu `bool`.

Ví dụ đúng:

```dart
if (score >= 8) {
  print('Good');
}
```

Ví dụ sai:

```dart
if (score) {
  print('Good');
}
```

Vì `score` là `int`, không phải `bool`.

## Nhiều điều kiện

Bạn có thể dùng `else if`.

```dart
void main() {
  int score = 7;

  if (score >= 8) {
    print('Excellent');
  } else if (score >= 5) {
    print('Pass');
  } else {
    print('Fail');
  }
}
```

## Ghi nhớ

- `if` chạy khi điều kiện đúng.
- `else` chạy khi điều kiện sai.
- Điều kiện phải trả về `true` hoặc `false`.

## Bài tập nhỏ

Cho:

```dart
int score = 6;
```

Hãy viết logic:

- Nếu `score >= 8`, in `Excellent`.
- Nếu `score >= 5`, in `Pass`.
- Nếu không, in `Fail`.
