# Theory

Thư mục `theory` dùng để lưu kiến thức nền tảng về **Dart** và **Flutter**.

Đây là nơi bạn nên đọc trước khi làm bài tập, lab hoặc mini project.

## Nguyên tắc tổ chức

Thư mục `theory` được chia theo hai trục chính:

```text
1. Ngôn ngữ: Dart
2. Framework: Flutter
```

Dart là nền tảng ngôn ngữ.

Flutter là framework dùng Dart để xây dựng giao diện ứng dụng.

Vì vậy, cách học khoa học là:

```text
Dart cơ bản → Flutter cơ bản → Dart nâng cao → Flutter nâng cao
```

## Cấu trúc

```text
theory/
├─ README.md
├─ basic/
│  ├─ README.md
│  ├─ dart/
│  │  ├─ 01_dart_la_gi.md
│  │  ├─ 02_cau_truc_chuong_trinh_dart.md
│  │  ├─ 03_bien_va_kieu_du_lieu.md
│  │  ├─ 04_in_ra_man_hinh_va_string_interpolation.md
│  │  ├─ 05_toan_tu.md
│  │  ├─ 06_if_else.md
│  │  ├─ 07_vong_lap_for.md
│  │  ├─ 08_ham.md
│  │  ├─ 09_list.md
│  │  ├─ 10_map.md
│  │  ├─ 11_class_va_object.md
│  │  ├─ 12_null_safety.md
│  │  └─ 13_future_async_await.md
│  └─ flutter/
│     ├─ README.md
│     ├─ 01_flutter_la_gi.md
│     ├─ 02_widget_tree.md
│     ├─ 03_stateless_va_stateful_widget.md
│     ├─ 04_materialapp_scaffold_appbar.md
│     ├─ 05_layout_co_ban.md
│     ├─ 06_listview_va_du_lieu_danh_sach.md
│     ├─ 07_navigation.md
│     └─ 08_form_va_validation.md
└─ advanced/
   └─ README.md
```

## Quy ước nội dung lý thuyết

Mỗi bài lý thuyết nên có cấu trúc:

```text
Mục tiêu bài học
Lý thuyết
Ví dụ
Ghi nhớ
Bài tập nhỏ
```

## Không nên đặt gì trong theory?

Không nên đặt code project hoàn chỉnh trong `theory`.

Code project nên đặt ở:

```text
exercises/
labs/
mini_projects/
```

`theory` chỉ nên chứa kiến thức để đọc, ôn và tra cứu.
