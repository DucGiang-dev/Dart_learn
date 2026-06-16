# Bài 04: MaterialApp, Scaffold, AppBar

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- `MaterialApp` là gì.
- `Scaffold` là gì.
- `AppBar` là gì.
- Ba widget này thường xuất hiện ở đâu trong app Flutter.

## MaterialApp

`MaterialApp` là widget cấp cao để tạo ứng dụng theo phong cách Material Design.

Nó thường là widget gốc của app.

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
```

## Scaffold

`Scaffold` là khung màn hình cơ bản.

Nó cung cấp các phần thường dùng:

- `appBar`
- `body`
- `floatingActionButton`
- `drawer`
- `bottomNavigationBar`

Ví dụ:

```dart
Scaffold(
  appBar: AppBar(
    title: const Text('Home'),
  ),
  body: const Center(
    child: Text('Hello'),
  ),
)
```

## AppBar

`AppBar` là thanh tiêu đề phía trên màn hình.

Ví dụ:

```dart
AppBar(
  title: const Text('Home'),
  centerTitle: true,
)
```

## Cấu trúc thường gặp

```text
MaterialApp
└─ Scaffold
   ├─ AppBar
   └─ body
```

## Ghi nhớ

- `MaterialApp` tạo ứng dụng.
- `Scaffold` tạo khung màn hình.
- `AppBar` tạo thanh tiêu đề.
- `body` là nội dung chính của màn hình.

## Bài tập nhỏ

Hãy viết một màn hình có:

- `MaterialApp`
- `Scaffold`
- `AppBar` với tiêu đề `My App`
- `body` hiển thị chữ `Hello Flutter`
