# Bài 10: Map trong Dart

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- `Map` là gì.
- Key và value là gì.
- Cách tạo `Map`.
- Cách lấy giá trị từ `Map`.

## Map là gì?

`Map` dùng để lưu dữ liệu dạng khóa và giá trị.

Mỗi giá trị có một khóa để tìm lại.

Ví dụ:

```dart
Map<String, int> ages = {
  'Giang': 21,
  'An': 20,
  'Mai': 22,
};
```

Trong đó:

```text
'Giang' là key
21 là value
```

## Lấy giá trị từ Map

```dart
void main() {
  Map<String, int> ages = {
    'Giang': 21,
    'An': 20,
    'Mai': 22,
  };

  print(ages['Giang']);
}
```

Kết quả:

```text
21
```

## Thêm hoặc cập nhật giá trị

```dart
ages['Lan'] = 19;
```

Nếu key chưa có, Dart sẽ thêm mới.

Nếu key đã có, Dart sẽ cập nhật giá trị.

## Ví dụ thông tin sinh viên

```dart
void main() {
  Map<String, String> student = {
    'name': 'Giang',
    'mssv': 'HE181711',
    'class': 'SE1903',
  };

  print(student['name']);
  print(student['mssv']);
}
```

## Ghi nhớ

- `Map` lưu dữ liệu dạng key-value.
- Key dùng để tìm value.
- `Map<String, int>` nghĩa là key là `String`, value là `int`.

## Bài tập nhỏ

Tạo một `Map` lưu thông tin cá nhân:

```text
name: tên của bạn
age: tuổi của bạn
city: thành phố của bạn
```

Sau đó in `name` ra màn hình.
