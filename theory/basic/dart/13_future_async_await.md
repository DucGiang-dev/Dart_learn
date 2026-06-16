# Bài 13: Future, async và await

## Mục tiêu bài học

Sau bài này, bạn cần hiểu khái niệm:

- `Future` là gì.
- `async` là gì.
- `await` là gì.
- Vì sao cần bất đồng bộ.

## Bất đồng bộ là gì?

Bất đồng bộ nghĩa là một việc có thể hoàn thành sau một khoảng thời gian.

Ví dụ:

- Tải dữ liệu từ internet.
- Đọc file.
- Chờ phản hồi từ server.
- Đếm ngược thời gian.

Những việc này không nên làm chặn toàn bộ chương trình.

## Future là gì?

`Future` đại diện cho một kết quả sẽ có trong tương lai.

Ví dụ, hàm `loadData` hứa sẽ trả về một `String` sau khi tải xong.

```dart
Future<String> loadData() {
  return Future.value('Data loaded');
}
```

## async là gì?

`async` dùng để báo rằng hàm này có thể chờ một việc bất đồng bộ.

```dart
Future<String> loadData() async {
  return 'Data loaded';
}
```

## await là gì?

`await` dùng để chờ một `Future` hoàn thành.

```dart
Future<void> main() async {
  String result = await loadData();
  print(result);
}
```

## Ví dụ chờ 2 giây

```dart
Future<String> loadData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data loaded';
}

Future<void> main() async {
  print('Start');

  String result = await loadData();

  print(result);
}
```

Kết quả gần đúng:

```text
Start
Data loaded
```

Chương trình sẽ chờ 2 giây trước khi in `Data loaded`.

## Khi nào dùng Future?

Bạn sẽ gặp `Future` nhiều khi:

- Gọi API.
- Đọc dữ liệu từ file.
- Chờ thao tác hoàn tất.
- Làm việc với database.
- Xây dựng app Flutter có tải dữ liệu.

## Ghi nhớ

- `Future` là kết quả trong tương lai.
- `async` đánh dấu hàm có thể chờ.
- `await` dùng để chờ `Future`.
- Bất đồng bộ giúp chương trình không bị chặn khi chờ việc khác.

## Bài tập nhỏ

Chưa cần chạy code. Hãy đọc và đoán thứ tự in:

```dart
Future<void> main() async {
  print('Start');

  await Future.delayed(Duration(seconds: 2));

  print('Finish');
}
```

Dòng nào in trước?
