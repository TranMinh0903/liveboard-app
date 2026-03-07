# 📱 LiveBoard App

Ứng dụng **bảng tin nhắn tương tác** (Interactive Message Board) — Full Stack demo với Flutter + .NET 8 + PostgreSQL.

## 🌐 Live Demo

| Service | URL |
|---------|-----|
| **🚀 API (Swagger UI)** | [https://liveboard-api.onrender.com/swagger/index.html](https://liveboard-api.onrender.com/swagger/index.html) |
| **🔗 Base API URL** | `https://liveboard-api.onrender.com/api/v1` |

## 📐 Kiến trúc

```
┌─────────────────┐     HTTP      ┌─────────────────────────────┐     SQL      ┌──────────────┐
│   Flutter App   │ ◄──────────► │   .NET 8 Web API (3 Layer)  │ ◄──────────► │  PostgreSQL   │
│   (Mobile/Web)  │   REST API   │  API → Service → Repository │   EF Core    │  (Render)     │
└─────────────────┘              └─────────────────────────────┘              └──────────────┘
```

## 📊 API Endpoints

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| `GET` | `/api/v1/messages` | Lấy tất cả tin nhắn (mới nhất trước) |
| `POST` | `/api/v1/messages` | Tạo tin nhắn mới |
| `PUT` | `/api/v1/messages/{id}/like` | Like tin nhắn (+1) |
| `DELETE` | `/api/v1/messages/{id}` | Xóa tin nhắn |

## ✨ Tính năng

- 📝 Gửi & xem tin nhắn realtime (auto-refresh 3s)
- ❤️ Like tin nhắn
- 🗑️ Xóa tin nhắn
- 🌙 Dark theme UI
- 🔄 Toggle giữa API mode và SQLite local mode

## 🛠 Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: .NET 8 Web API (3-Layer Architecture)
- **Database**: PostgreSQL 16
- **Infrastructure**: Docker Compose, Render (Cloud)
- **Patterns**: Generic Repository, Unit of Work, DTO, Result Pattern

## 🚀 Chạy local

### Yêu cầu
- Flutter SDK
- Docker Desktop (cho backend)

### Backend
```bash
cd ../BE
docker-compose up -d
# API: http://localhost:7070/swagger
# Adminer: http://localhost:8082
```

### Flutter App
```bash
flutter pub get
flutter run
```

> **Lưu ý**: Trên Android Emulator, đổi `baseUrl` trong `lib/services/api_config.dart` thành `http://10.0.2.2:7070/api/v1`

## 📁 Cấu trúc project

```
lib/
├── main.dart                      # Entry point
├── models/
│   └── message.dart               # Message model
├── screens/
│   └── liveboard_screen.dart      # Main UI screen
└── services/
    ├── api_config.dart            # API URL configuration
    ├── api_client.dart            # HTTP client wrapper
    ├── message_service.dart       # API service calls
    ├── database_helper.dart       # SQLite helper
    └── local_message_service.dart # Local SQLite service
```

## 👨‍💻 Author

**Tran Minh** — PRM393 @ FPT University
