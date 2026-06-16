# Bài 01: Flutter là gì và kiến trúc widget

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- Flutter là gì.
- Flutter khác Dart như thế nào.
- Widget là gì.
- Vì sao Flutter dùng widget để xây dựng giao diện.

## Flutter là gì?

Flutter là một framework dùng để xây dựng giao diện ứng dụng.

Bạn có thể dùng Flutter để làm:

- App mobile Android.
- App mobile iOS.
- Web app.
- Desktop app.

Flutter viết bằng Dart.

## Dart và Flutter

```text
Dart = ngôn ngữ lập trình
Flutter = framework dùng Dart để tạo giao diện
```

Ví dụ:

```dart
Text('Hello Flutter')
```

`Text` là một widget của Flutter, nhưng code vẫn viết bằng Dart.

## Widget là gì?

Widget là thành phần xây dựng giao diện.

Ví dụ:

- `Text`: hiển thị chữ.
- `Image`: hiển thị ảnh.
- `Button`: nút bấm.
- `TextField`: ô nhập liệu.
- `Column`: sắp xếp theo chiều dọc.
- `Row`: sắp xếp theo chiều ngang.

Trong Flutter, gần như mọi thứ đều là widget.

## Kiến trúc widget

Giao diện Flutter được tạo bằng cách kết hợp nhiều widget lại với nhau.

Ví dụ:

```text
MaterialApp
└─ Scaffold
   ├─ AppBar
   └─ Center
      └─ Text
```

## Ví dụ

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello Flutter'),
        ),
        body: const Center(
          child: Text('Xin chào Flutter'),
        ),
      ),
    ),
  );
}
```

## Ghi nhớ

- Flutter dùng để tạo giao diện.
- Dart là ngôn ngữ viết code.
- Widget là thành phần cơ bản của giao diện Flutter.
- Giao diện Flutter là sự kết hợp của nhiều widget.

## Bài tập nhỏ

Hãy đọc ví dụ trên và trả lời:

1. Widget nào tạo màn hình chính?
2. Widget nào tạo thanh tiêu đề?
3. Widget nào hiển thị chữ?
