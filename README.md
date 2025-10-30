# Shop - Modern Shopping Experience
## Introduction
Shop_mechine_test is a practical demonstration of a Flutter e-commerce application built using DummyJSON API. 
This project showcases API integration, state management, local storage, and modern Flutter development practices.

### Demo Credentials
```
username: emilys
password: emilyspass
```

### API Integration
The app integrates with DummyJSON API endpoints:
- Authentication: `/auth/login`, `/auth/me`
- Products: `/products`, `/products/{id}`

### Core Features
1. **Authentication**
    - Secure login with error handling

2. **Product Management**
    - Infinite scrolling product list
    - Detailed product views with image gallery
    - Local cart and wishlist storage

3. **Data Persistence**
    - SharedPreferences for user session
    - Local storage for cart/wishlist items

### Getting Started
```bash
# Clone repository
git clone https://github.com/username/shop_mechine_test.git

# Install dependencies
flutter pub get

# Run application
flutter run
```
## Project File Structure (actual)

The following shows the actual layout of the `lib/` directory and the purpose of each folder/file.

```
lib/
├── main.dart                      # App entry point: DI, providers, routes
├── services/
│   └── api_service.dart           # HTTP client / API calls (Dio)
├── viewmodels/
│   ├── cart_viewmodel.dart        # Cart state & business logic
│   ├── login_viewmodel.dart       # Authentication logic
│   ├── product_viewmodel.dart     # Product listing / details logic
│   └── wishlist_viewmodel.dart    # Wishlist state & logic
├── views/
│   ├── splash_screen.dart
│   ├── home_page.dart
│   ├── products_list_page.dart
│   ├── product_details_page.dart
│   ├── cart_page.dart
│   ├── wishlist_page.dart
│   └── login_page.dart
├── widgets/                        # Reusable UI components
└── (other folders as needed)
```

Quick notes:
- main.dart wires up dependency injection (GetIt), providers (or Provider), and routes — it is the app entrypoint.
- services/ contains API integration (Dio) and other external-facing services.
- viewmodels/ implement MVVM business logic and expose state to Views via Provider.
- views/ are the UI screens; keep them thin and delegate logic to ViewModels.
- widgets/ houses shared widgets used across multiple screens.

Recommended next steps:
- Ensure ApiService is registered in GetIt and injected into ViewModels.
- Keep ViewModels pure (no UI code) so they are easy to test.
- Move models, repositories, and config/constants into dedicated folders as the project grows.
- Add a brief README inside lib/ describing how to run, test, and extend ViewModels and Services.
![Shop App Homepage](assets/homepage.png)

## Project Overview
Shop is a modern Flutter e-commerce application implementing the MVVM (Model-View-ViewModel) architecture. It provides a seamless shopping experience with robust features and clean architecture.

### Technologies Used
- Flutter & Dart
- Provider for state management
- Dio for API integration
- SharedPreferences for local storage
- GetIt for dependency injection

## Features
- 🔐 Secure user authentication
- 📱 Responsive product browsing with pagination
- 🖼️ Dynamic product gallery views
- 🛒 Advanced cart management
- ❤️ Wishlist functionality
- 💾 Persistent data storage
- 🏗️ MVVM architecture
- 📱 Cross-platform compatibility

## Architecture
The app follows MVVM architecture:
```
├── Models         # Data models
├── Views         # UI components
└── ViewModels    # Business logic
└── Services    # Api Services or Other Services
```

### Key Components
- **Models**: Data structures and repositories
- **Views**: UI screens and widgets
- **ViewModels**: State management and business logic

## Project Structure
```
lib/
├── core/
│   ├── constants/
│   ├── services/
│   └── utils/
├── data/
│   ├── models/
│   ├── repositories/
│   └── services/
├── ui/
│   ├── views/
│   ├── viewmodels/
│   └── widgets/
└── main.dart
```

## Dependencies
```yaml
dependencies:
    flutter:
        sdk: flutter
    provider: ^6.0.0
    dio: ^4.0.0
    shared_preferences: ^2.0.0
    get_it: ^7.0.0
```

## Installation
```bash
git clone https://github.com/username/shop-app.git
cd shop-app
flutter pub get
```

## Running the Application
```bash
# Debug mode
flutter run

# Release mode
flutter run --release
```

## Build Commands
```bash
# Android APK
flutter build apk --release

## API Integration
- Base URL: `https://dummyjson.com/`
- Endpoints:
    - `/auth` - Authentication
    - `/products` - Product listing
    - `/cart` - Cart management

## Testing
```bash
# Run tests
flutter test

# Generate coverage
flutter test --coverage
```

## Contributing
1. Fork the repository
2. Create your feature branch
3. Commit changes
4. Push to the branch
5. Create Pull Request

## License
MIT License - See [LICENSE](LICENSE) for details