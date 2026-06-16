# Bài 05: Layout cơ bản

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- Layout là gì.
- Cách dùng `Column`.
- Cách dùng `Row`.
- Cách dùng `Container`.
- Cách dùng `Padding` và `SizedBox`.

## Layout là gì?

Layout là cách sắp xếp các widget trên màn hình.

Ví dụ:

- Sắp xếp theo chiều dọc.
- Sắp xếp theo chiều ngang.
- Tạo khoảng cách.
- Căn giữa.
- Đặt widget vào khung.

## Column

`Column` sắp xếp widget theo chiều dọc.

```dart
Column(
  children: [
    Text('Line 1'),
    Text('Line 2'),
    Text('Line 3'),
  ],
)
```

## Row

`Row` sắp xếp widget theo chiều ngang.

```dart
Row(
  children: [
    Icon(Icons.star),
    Text('Rating'),
  ],
)
```

## Container

`Container` là hộp chứa widget, có thể có màu, padding, margin, border.

```dart
Container(
  padding: const EdgeInsets.all(16),
  color: Colors.blue,
  child: const Text('Box'),
)
```

## Padding

`Padding` tạo khoảng cách bên trong.

```dart
Padding(
  padding: const EdgeInsets.all(12),
  child: Text('Content'),
)
```

## SizedBox

`SizedBox` tạo khoảng trống có kích thước cố định.

```dart
const SizedBox(height: 16)
```

## Ví dụ tổng hợp

```dart
Column(
  children: [
    const Text('Title'),
    const SizedBox(height: 8),
    Container(
      padding: const EdgeInsets.all(12),
      color: Colors.grey[200],
      child: const Text('Content'),
    ),
  ],
)
```

## Ghi nhớ

- `Column`: dọc.
- `Row`: ngang.
- `Container`: hộp chứa.
- `Padding`: khoảng cách trong.
- `SizedBox`: khoảng trống cố định.

## Bài tập nhỏ

Hãy tạo một màn hình có:

1. Một tiêu đề.
2. Một khoảng cách.
3. Một ô nội dung có màu nền.
4. Một nút bấm bên dưới.
