import 'dart:convert';

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  // Factory constructor tạo User từ Map JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  // Chuyển đối tượng User sang Map JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'User(name: $name, email: $email)';
  }
}

class UserRepository {
  // Giả lập gọi API bất đồng bộ với Future
  Future<List<User>> fetchUsers() async {
    await Future.delayed(Duration(milliseconds: 1200));

    const String simulatedJsonResponse = '''
    [
      {
        "name": "giangndhe181711",
        "email": "giangndhe181711@gmail.com"
      },
      {
        "name": "giangndhe181712",
        "email": "giangndhe181712@gmail.com"
      },
      {
        "name": "giangndhe1817113",
        "email": "giangndhe181713@gmail.com"
      }
    ]
    ''';

    // Giải mã chuỗi JSON
    final decodedData = jsonDecode(simulatedJsonResponse);

    if (decodedData is List) {
      // Map danh sách Map thành danh sách User
      return decodedData
          .map((item) => User.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw FormatException("JSON không hợp lệ");
    }
  }
}

Future<void> exercise2() async {
  print("==================================================");
  print("BÀI TẬP 2: User Repository với JSON (Parse & Serialize)");
  print("==================================================");

  final UserRepository repo = UserRepository();

  print("[Fetch] Đang gọi API giả lập lấy danh sách người dùng...");
  try {
    final List<User> users = await repo.fetchUsers();
    
    print("[Fetch] Giải mã thành công ${users.length} người dùng:");
    for (var user in users) {
      print("  - $user");
    }

    // Kiểm tra tính năng toJson()
    print("\n[Serialization] Chuyển đổi ngược đối tượng User đầu tiên sang JSON string:");
    final User firstUser = users.first;
    final Map<String, dynamic> userMap = firstUser.toJson();
    final String serializedString = jsonEncode(userMap);
    print("  Đối tượng gốc: $firstUser");
    print("  Dạng Map:      $userMap");
    print("  Dạng String:   $serializedString");

  } catch (error) {
    print("  [Error] Lỗi khi tải hoặc parse dữ liệu: $error");
  }
  
  print("HOÀN THÀNH BÀI TẬP 2.\n");
}
