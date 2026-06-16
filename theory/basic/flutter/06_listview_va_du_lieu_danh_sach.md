# Bài 06: ListView và dữ liệu danh sách

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- Khi nào dùng `ListView`.
- Cách tạo danh sách cố định.
- Cách tạo danh sách từ `List`.
- Cách dùng `ListView.builder`.

## ListView là gì?

`ListView` dùng để hiển thị danh sách có thể cuộn.

Ví dụ:

- Danh sách bài hát.
- Danh sách phim.
- Danh sách sinh viên.
- Danh sách tin nhắn.

## Danh sách cố định

```dart
ListView(
  children: const [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
```

## ListView.builder

Khi danh sách dài, nên dùng `ListView.builder`.

```dart
ListView.builder(
  itemCount: names.length,
  itemBuilder: (context, index) {
    return Text(names[index]);
  },
)
```

## Giải thích

```text
itemCount: số lượng phần tử
itemBuilder: hàm tạo widget cho từng phần tử
index: vị trí hiện tại trong danh sách
```

## Ví dụ với List

```dart
final List<String> names = ['Giang', 'An', 'Mai'];

ListView.builder(
  itemCount: names.length,
  itemBuilder: (context, index) {
    return Text(names[index]);
  },
)
```

## Khi nào dùng ListView.builder?

Nên dùng `ListView.builder` khi:

- Danh sách dài.
- Dữ liệu đến từ `List`.
- Mỗi item được tạo theo index.

## Ghi nhớ

- `ListView` hiển thị danh sách có thể cuộn.
- `ListView` phù hợp với danh sách ngắn.
- `ListView.builder` phù hợp với danh sách dài.
- `itemBuilder` tạo widget cho từng phần tử.

## Bài tập nhỏ

Cho danh sách:

```dart
final List<String> movies = ['Dune', 'Interstellar', 'Inception'];
```

Hãy viết `ListView.builder` để hiển thị từng tên phim.
