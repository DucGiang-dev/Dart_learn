# Bài 08: Form và validation

## Mục tiêu bài học

Sau bài này, bạn cần hiểu:

- Form dùng để làm gì.
- `TextFormField` là gì.
- `validator` dùng để làm gì.
- Cách kiểm tra form hợp lệ.

## Form là gì?

Form dùng để thu thập dữ liệu từ người dùng.

Ví dụ:

- Đăng nhập.
- Đăng ký.
- Nhập thông tin cá nhân.
- Nhập email.
- Nhập mật khẩu.

## TextFormField

`TextFormField` là ô nhập liệu có thể kiểm tra dữ liệu.

```dart
TextFormField(
  decoration: const InputDecoration(
    labelText: 'Email',
  ),
)
```

## validator

`validator` dùng để kiểm tra dữ liệu nhập vào.

```dart
validator: (value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }

  return null;
}
```

Nếu trả về `String`, Flutter hiển thị lỗi.

Nếu trả về `null`, nghĩa là hợp lệ.

## FormKey

`FormKey` giúp quản lý toàn bộ form.

```dart
final _formKey = GlobalKey<FormState>();
```

Kiểm tra form:

```dart
if (_formKey.currentState!.validate()) {
  print('Form is valid');
}
```

## Ví dụ đơn giản

```dart
Form(
  key: _formKey,
  child: TextFormField(
    decoration: const InputDecoration(
      labelText: 'Email',
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Email is required';
      }

      return null;
    },
  ),
)
```

## Ghi nhớ

- `Form` quản lý các ô nhập liệu.
- `TextFormField` là ô nhập có validation.
- `validator` kiểm tra dữ liệu.
- `FormKey` giúp kiểm tra toàn bộ form.
- `validate()` trả về `true` nếu form hợp lệ.

## Bài tập nhỏ

Hãy tạo một form có:

1. Ô nhập tên.
2. Ô nhập email.
3. Nút submit.
4. Tên không được để trống.
5. Email không được để trống.
