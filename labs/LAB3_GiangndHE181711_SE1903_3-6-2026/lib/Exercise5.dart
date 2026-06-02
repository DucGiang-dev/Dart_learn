class Settings {
  final String theme;
  final bool notificationsEnabled;

  // Cache lưu thực thể Singleton mặc định
  static Settings? _defaultInstance;

  // Cache lưu thực thể cấu hình theo key (Multiton)
  static final Map<String, Settings> _customCache = {};

  // Constructor nội bộ (private) để ngăn tạo đối tượng tự do bên ngoài
  Settings._internal({required this.theme, required this.notificationsEnabled});

  // Factory constructor mặc định (Singleton Pattern)
  factory Settings() {
    _defaultInstance ??= Settings._internal(
      theme: 'dark',
      notificationsEnabled: true,
    );
    return _defaultInstance!;
  }

  // Factory constructor có cache theo key (Multiton Pattern)
  factory Settings.withCache(String key, {String theme = 'light', bool notificationsEnabled = false}) {
    if (_customCache.containsKey(key)) {
      print("  [Cache Hit] Tìm thấy khóa '$key'. Trả về thực thể cũ.");
      return _customCache[key]!;
    } else {
      print("  [Cache Miss] Không tìm thấy khóa '$key'. Khởi tạo thực thể mới.");
      final newInstance = Settings._internal(
        theme: theme,
        notificationsEnabled: notificationsEnabled,
      );
      _customCache[key] = newInstance;
      return newInstance;
    }
  }

  @override
  String toString() {
    return 'Settings(theme: $theme, notifications: $notificationsEnabled, hashCode: $hashCode)';
  }
}

void exercise5() {
  print("==================================================");
  print("BÀI TẬP 5: Factory Constructor & Cache (Singleton/Multiton)");
  print("==================================================");

  // Kiểm tra Singleton
  print("[Singleton Test] Khởi tạo Settings hai lần...");
  final settingsA = Settings();
  final settingsB = Settings();

  print("  Thực thể A: $settingsA");
  print("  Thực thể B: $settingsB");

  final isDefaultIdentical = identical(settingsA, settingsB);
  print("  Hai thực thể có trùng nhau không? identical -> $isDefaultIdentical");

  // Kiểm tra Multiton Cache
  print("\n[Multiton Test] Khởi tạo thực thể cấu hình theo key...");
  
  print("Gọi 'user_profile' (Lần 1)...");
  final userProfile1 = Settings.withCache('user_profile', theme: 'system', notificationsEnabled: false);
  
  print("Gọi 'user_profile' (Lần 2)...");
  final userProfile2 = Settings.withCache('user_profile');

  print("Gọi 'admin_panel'...");
  final adminPanel = Settings.withCache('admin_panel', theme: 'light', notificationsEnabled: true);

  print("\nKiểm tra đối chiếu thực thể:");
  print("  user_profile 1 và 2 trùng nhau? -> ${identical(userProfile1, userProfile2)}");
  print("  user_profile và admin_panel khác nhau? -> ${!identical(userProfile1, adminPanel)}");

  print("HOÀN THÀNH BÀI TẬP 5.\n");
}
