# Bài 07: Navigation

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- Navigation là gì.
- Khi nào cần chuyển màn hình.
- Cách dùng `Navigator.push`.
- Cách dùng `Navigator.pop`.

## Navigation là gì?

Navigation là cách chuyển từ màn hình này sang màn hình khác.

Ví dụ:

```text
HomeScreen → DetailScreen
LoginScreen → HomeScreen
FormScreen → SuccessScreen
```

## Navigator.push

Dùng để mở màn hình mới.

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const DetailScreen(),
  ),
);
```

## Navigator.pop

Dùng để quay lại màn hình trước.

```dart
Navigator.pop(context);
```

## Ví dụ chuyển màn hình

```dart
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DetailScreen(),
      ),
    );
  },
  child: const Text('Open detail'),
);
```

## Ví dụ màn hình chi tiết

```dart
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back'),
        ),
      ),
    );
  }
}
```

## Ghi nhớ

- `Navigator.push`: mở màn hình mới.
- `Navigator.pop`: quay lại màn hình cũ.
- Navigation thường dùng với `MaterialPageRoute`.
- Cần `context` để Navigator hoạt động.

## Bài tập nhỏ

Hãy tạo hai màn hình:

1. `HomeScreen` có nút `Open Detail`.
2. `DetailScreen` có nút `Back`.

Khi nhấn `Open Detail`, chuyển sang `DetailScreen`.

Khi nhấn `Back`, quay lại `HomeScreen`.
