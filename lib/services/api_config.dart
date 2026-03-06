/// Cấu hình API endpoints
class ApiConfig {
  ApiConfig._();

  /// 🏠 Docker trên máy mình (Android Emulator)
  // static const String baseUrl = 'http://10.0.2.2:7070/api/v1';

  /// 📱 Thiết bị thật hoặc Emulator (dùng IP WiFi)
  // static const String baseUrl = 'http://192.168.2.5:7070/api/v1';

  /// 💻 Web browser
  // static const String baseUrl = 'http://localhost:7070/api/v1';

  /// 🌐 Ngrok - dùng cho thuyết trình
  // static const String baseUrl = 'https://horrendously-thiocyano-elana.ngrok-free.dev/api/v1';

  /// 🚀 Render Production
  static const String baseUrl = 'https://liveboard-api.onrender.com/api/v1';
}
