# 🛍️ Shop — Modern Flutter E-Commerce App

A modern, fully-functional e-commerce application built with Flutter, following the MVVM architecture and powered by DummyJSON API. This project demonstrates clean architecture, API integration, state management, local persistence, and scalable Flutter app structure.

## 🚀 Features

| Category          | Features                                           |
|-------------------|----------------------------------------------------|
| 👤 Authentication  | Login with session persistence                     |
| 📦 Products        | Product listing, pagination, product details & gallery |
| 🛒 Cart           | Add, remove, view items — saved locally           |
| ❤️ Wishlist       | Add favorite products — locally saved              |
| 💾 Storage        | SharedPreferences for user & cart/wishlist data   |
| 📱 Responsive UI  | Smooth shopping experience on Android & iOS       |

## 🧠 Architecture

This project follows MVVM (Model-View-ViewModel):

```
lib/
├── main.dart              # App entry
├── services/
│   └── api_service.dart   # API layer using Dio
├── viewmodels/            # State & business logic
│   ├── login_viewmodel.dart
│   ├── product_viewmodel.dart
│   ├── cart_viewmodel.dart
│   └── wishlist_viewmodel.dart
├── views/                 # UI screens
│   ├── splash_screen.dart
│   ├── login_page.dart
│   ├── home_page.dart
│   ├── products_list_page.dart
│   ├── product_details_page.dart
│   ├── cart_page.dart
│   └── wishlist_page.dart
└── widgets/    
    └── product_card.dart           # Reusable UI components
```

## 🗂️ Folder Responsibilities

| Folder        | Purpose                              |
|---------------|--------------------------------------|
| services/     | API & external services              |
| viewmodels/   | Business logic, state, Provider      |
| views/        | UI screens                           |
| widgets/      | Reusable UI widgets                  |

## 🛠️ Tech Stack

| Area                | Technology        |
|---------------------|-------------------|
| Framework           | Flutter           |
| Architecture        | MVVM              |
| State Management    | Provider          |
| Networking          | Dio               |
| Local Storage       | SharedPreferences  |
| Dependency Injection | GetIt             |

## 📦 Dependencies

```yaml
dependencies:
    flutter:
        sdk: flutter
    provider: ^6.0.0
    dio: ^4.0.0
    shared_preferences: ^2.0.0
    get_it: ^7.0.0
```

## 🔗 API Integration

Using DummyJSON API

| Endpoint           | Usage                |
|--------------------|----------------------|
| /auth/login        | Login user           |
| /auth/me           | Session check        |
| /products          | Product listing      |
| /products/{id}     | Product details      |

## 🧪 Demo Credentials

- **username:** emilys
- **password:** emilyspass

## ▶️ Getting Started

### ✅ Clone Repo

```bash
git clone https://github.com/NaheelJ/Shop_Mechine_Test.git
cd Shop_Mechine_Test
```

### 📥 Install packages

```bash
flutter pub get
```

### ▶️ Run App

```bash
flutter run
```

### 📦 Build Release APK

```bash
flutter build apk --release
```

## ⭐ Support

If you found this project impressive and would like to explore working together, feel free to connect — I’m open to exciting job opportunities and collaboration. 
And if you liked the project, a ⭐ on GitHub is always appreciated!
👉 [GitHub Repository](https://github.com/NaheelJ/Shop_Mechine_Test.git)  