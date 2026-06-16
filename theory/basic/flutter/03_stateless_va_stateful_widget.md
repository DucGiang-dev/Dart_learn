# Bài 03: Stateless và StatefulWidget

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- `StatelessWidget` là gì.
- `StatefulWidget` là gì.
- Khi nào dùng `StatelessWidget`.
- Khi nào dùng `StatefulWidget`.

## StatelessWidget

`StatelessWidget` là widget không thay đổi trạng thái.

Nó phù hợp khi giao diện chỉ hiển thị dữ liệu cố định.

Ví dụ:

```dart
class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Welcome to Flutter');
  }
}
```

## StatefulWidget

`StatefulWidget` là widget có thể thay đổi trạng thái.

Nó phù hợp khi giao diện cần thay đổi sau tương tác.

Ví dụ:

- Nhấn nút tăng số lần bấm.
- Nhập text vào ô.
- Chọn checkbox.
- Tải dữ liệu rồi hiển thị kết quả.

## Ví dụ StatefulWidget

```dart
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}
```

## setState

Muốn Flutter cập nhật lại giao diện, dùng `setState`.

```dart
setState(() {
  count++;
});
```

`setState` báo cho Flutter biết dữ liệu đã thay đổi và cần vẽ lại widget.

## Khi nào dùng gì?

```text
Dữ liệu không đổi → StatelessWidget
Dữ liệu có thể thay đổi → StatefulWidget
```

## Ghi nhớ

- `StatelessWidget` không có trạng thái thay đổi.
- `StatefulWidget` có trạng thái.
- Muốn cập nhật giao diện trong `StatefulWidget`, dùng `setState`.
- Người mới nên hiểu `setState` thật chắc trước khi học state management.

## Bài tập nhỏ

Hãy quyết định widget nào nên dùng:

1. Hiển thị tiêu đề cố định.
2. Nút bấm tăng số lần nhấn.
3. Ô nhập email.
4. Hiển thị tên người dùng không đổi.
