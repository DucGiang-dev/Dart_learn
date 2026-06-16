# Lý thuyết nâng cao Dart & Flutter

Thư mục `theory/advanced` dùng để lưu kiến thức nâng cao về **Dart** và **Flutter**.

Bạn chỉ nên học phần này sau khi đã nắm vững kiến thức trong `theory/basic`.

## Điều kiện nên học trước

Trước khi học phần nâng cao, bạn nên hiểu:

- Biến và kiểu dữ liệu.
- Hàm.
- `if/else`.
- Vòng lặp.
- `List` và `Map`.
- Class/object.
- Null safety.
- `Future`, `async`, `await`.
- Widget cơ bản trong Flutter.
- `StatelessWidget` và `StatefulWidget`.

## Phần 1: Dart nâng cao

Các chủ đề nên học:

### OOP nâng cao

Học sâu hơn về:

- Constructor.
- Named constructor.
- Getter/setter.
- Private members.
- Inheritance.
- Abstract class.
- Interface.

### Generics

Dùng để viết code linh hoạt hơn.

Ví dụ:

```dart
List<String> names = [];
Map<String, int> ages = {};
```

### Extension methods

Dùng để thêm hàm tiện ích cho kiểu dữ liệu có sẵn.

### Mixins

Dùng để chia sẻ hành vi giữa nhiều class.

### Async nâng cao

Học sâu hơn về:

- `Future`
- `Stream`
- `StreamController`
- Error handling trong async code

### Error handling

Học cách xử lý lỗi bằng:

```dart
try {
  // code có thể lỗi
} catch (e) {
  // xử lý lỗi
}
```

## Phần 2: Flutter nâng cao

Các chủ đề nên học sau này:

### Widget lifecycle

Hiểu vòng đời của `StatefulWidget`.

Cần nắm:

- `initState`
- `build`
- `didChangeDependencies`
- `dispose`

### State management

Học cách quản lý trạng thái khi ứng dụng lớn hơn.

Có thể học theo thứ tự:

```text
setState → ValueNotifier → Provider → Riverpod/Bloc
```

Với người mới, chỉ cần hiểu `setState` thật chắc trước.

### Navigation nâng cao

Học cách tổ chức chuyển màn hình rõ ràng hơn.

Chủ đề nên học:

- Named route.
- Route arguments.
- Back button.
- Navigation stack.

### Responsive layout

Học cách giao diện hiển thị tốt trên nhiều kích thước màn hình.

Chủ đề nên học:

- `LayoutBuilder`
- `MediaQuery`
- `Flexible`
- `Expanded`
- `Wrap`

### Theming

Học cách tạo giao diện đồng nhất.

Chủ đề nên học:

- `ThemeData`
- `ColorScheme`
- `TextStyle`
- Dark mode/light mode

### Async UI

Học cách hiển thị trạng thái khi đang tải dữ liệu.

Chủ đề nên học:

- Loading state.
- Error state.
- Empty state.
- Success state.

## Lộ trình học gợi ý

Không nên học tất cả cùng lúc.

Hãy học theo thứ tự:

```text
1. Widget lifecycle
2. Responsive layout
3. Theming
4. Navigation nâng cao
5. Async UI
6. State management
7. Dart OOP nâng cao
8. Generics
9. Error handling
10. Extension methods
11. Mixins
12. Stream nâng cao
```

## Tài liệu liên quan

- [Nền tảng Dart & Flutter](../basic/README.md)
