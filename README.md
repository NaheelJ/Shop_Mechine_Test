# 🛍️ Shop — Modern Flutter E-Commerce App

A modern, fully-functional e-commerce application built with Flutter, following the MVVM architecture and powered by DummyJSON API. This project demonstrates clean architecture, API integration, state management, local persistence, and scalable Flutter app structure.

## 📱 APK Download

A prebuilt release APK for this app is available in your Google Drive folder:  
https://drive.google.com/drive/folders/1jYBzzZILZp4bzIu_aXBU9Xjj4dJ1iYoQ?usp=sharing

Installation instructions:
- Download the .apk file to your Android device or to your computer and transfer it to the device.
- On the device: enable "Install unknown apps" for your browser or file manager, then open the .apk to install.
- From a computer (ADB): connect device with USB debugging enabled and run:
- adb install -r /path/to/Shop_Mechine_Test.apk
- On Windows/Mac: you can also install via an Android file manager after transferring the APK.

Notes:
- Verify file name and file size before installing. If you want a checksum (SHA256) or a direct one-click download link embedded in the README, upload the APK file here or share the checksum and I will add it.
- Always ensure you trust the source before installing unsigned APKs.

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
| Architecture        | MVVM              |
| State Management    | Provider          |
| Networking          | Dio               |
| Local Storage       | SharedPreferences  |
| Image Loading & Caching | CachedNetworkImage |             |

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cached_network_image: ^3.4.1
  dio: ^5.9.0
  provider: ^6.1.5+1
  shared_preferences: ^2.5.3
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
