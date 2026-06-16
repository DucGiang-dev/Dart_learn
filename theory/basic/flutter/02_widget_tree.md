# Bài 02: Widget tree

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- Widget tree là gì.
- Vì sao Flutter dùng cây widget.
- Cách đọc một widget tree đơn giản.

## Widget tree là gì?

Widget tree là cây các widget lồng nhau.

Trong Flutter, widget thường nằm bên trong widget khác.

Ví dụ:

```text
MaterialApp
└─ Scaffold
   ├─ AppBar
   │  └─ Text
   └─ Body
      └─ Column
         ├─ Text
         └─ ElevatedButton
```

## Vì sao cần widget tree?

Flutter cần biết:

- Màn hình có những thành phần nào.
- Thành phần nào nằm trong thành phần nào.
- Thành phần nào nằm trên, dưới, trái, phải.

Widget tree giúp mô tả cấu trúc đó.

## Ví dụ code

```dart
Column(
  children: [
    Text('Title'),
    Text('Description'),
    ElevatedButton(
      onPressed: () {},
      child: const Text('Submit'),
    ),
  ],
)
```

Widget tree tương ứng:

```text
Column
├─ Text
├─ Text
└─ ElevatedButton
   └─ Text
```

## Cách đọc widget tree

Khi đọc code Flutter, hãy đọc từ ngoài vào trong.

Ví dụ:

```dart
Scaffold(
  appBar: AppBar(...),
  body: Center(
    child: Text('Hello'),
  ),
)
```

Nghĩa là:

```text
Scaffold là màn hình.
AppBar là thanh tiêu đề.
Center nằm trong body.
Text nằm trong Center.
```

## Ghi nhớ

- Widget tree là cây widget.
- Widget ngoài chứa widget trong.
- Đọc code Flutter từ ngoài vào trong.
- Càng hiểu widget tree, càng dễ học Flutter.

## Bài tập nhỏ

Cho code:

```dart
Column(
  children: [
    Text('Name'),
    Text('Age'),
  ],
)
```

Hãy vẽ widget tree của đoạn code trên.
