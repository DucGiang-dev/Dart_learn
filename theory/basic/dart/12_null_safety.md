# Bài 12: Null safety

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- `null` là gì.
- Vì sao Dart cần null safety.
- Cách dùng `?`, `??`, `!`.

## null là gì?

`null` nghĩa là không có giá trị.

Ví dụ, một người có thể chưa có biệt danh. Khi đó biến `nickname` có thể là `null`.

## Biến không null

Trong Dart hiện đại, biến bình thường không được để `null`.

```dart
String name = 'Giang';
```

Biến `name` phải luôn có giá trị `String`.

## Biến nullable

Nếu muốn biến có thể không có giá trị, dùng `?`.

```dart
String? nickname;
```

`String?` nghĩa là biến có thể là `String` hoặc `null`.

## Kiểm tra null

```dart
void main() {
  String? nickname;

  if (nickname == null) {
    print('No nickname');
  } else {
    print(nickname);
  }
}
```

## Toán tử ??

`??` dùng để gán giá trị mặc định khi biến là `null`.

```dart
void main() {
  String? nickname;

  String displayName = nickname ?? 'Guest';

  print(displayName);
}
```

Kết quả:

```text
Guest
```

## Toán tử ??=

`??=` chỉ gán giá trị nếu biến đang là `null`.

```dart
void main() {
  String? nickname;

  nickname ??= 'Giang';

  print(nickname);
}
```

## Toán tử !

`!` dùng khi bạn chắc chắn biến không null.

```dart
void main() {
  String? nickname = 'Giang';

  print(nickname!.length);
}
```

Chỉ dùng `!` khi bạn thật sự chắc chắn. Nếu biến là `null`, chương trình có thể lỗi.

## Ghi nhớ

- `null` nghĩa là không có giá trị.
- `String` không được null.
- `String?` có thể null.
- `??` dùng để lấy giá trị mặc định.
- `!` chỉ dùng khi chắc chắn biến không null.

## Bài tập nhỏ

Cho:

```dart
String? nickname;
```

Hãy dùng `??` để gán giá trị mặc định là `'Guest'`.
