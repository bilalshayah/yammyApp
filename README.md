# 🍔 Foodly Ecosystem
**A Premium & Scalable Food Delivery Platform**

<div align="center">



[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-green.svg)]()
[![State Management](https://img.shields.io/badge/State%20Management-BLoC-orange.svg)]()
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)]()

</div>

---

## 📑 Table of Contents
1. [About the Project](#-about-the-project)
2. [Key Features](#-key-features)
3. [Technical Stack](#-technical-stack)
4. [Architecture & Design Patterns](#-architecture--design-patterns)
5. [Project Structure](#-project-structure)
6. [UI Workshop](#-ui-workshop)
7. [Getting Started](#-getting-started)

---

## 🎯 About the Project
**Foodly** is an enterprise-grade mobile application designed to revolutionize the food delivery experience. Built with a focus on **deep technical depth** and **clean engineering**, it provides a seamless bridge between hungry users and their favorite local restaurants. The project serves as a showcase for high-level software engineering patterns in Flutter.

---

## ✨ Key Features
| Feature | Description |
|:---|:---|
| 🔐 **Advanced Auth** | Secure Login/Signup with **Biometric (Fingerprint)** authentication. |
| 🔍 **Smart Discovery** | Intelligent search with category filtering (Snacks, Meals, Desserts). |
| 🛒 **Dynamic Cart** | Real-time price calculation with support for food add-ons and modifiers. |
| 📍 **Order Tracking** | Comprehensive order lifecycle management (Active, Past, Cancelled). |
| 💳 **Payment Suite** | Integration-ready for multiple payment methods (Card, PayPal, Apple Pay). |
| 🗺️ **Address Book** | Multi-address management with interactive UI for saved locations. |
| 🛠️ **UI Kit Laboratory** | Dedicated **Workshop** environment for isolated widget testing and development. |

---

## 🛠️ Technical Stack
- **Framework:** Flutter 3.x
- **Language:** Dart
- **State Management:** BLoC Pattern (Business Logic Component)
- **Architecture:** Clean Architecture (Presentation → Domain → Data)
- **Dependency Injection:** `get_it` + `injectable`
- **Networking:** `Dio` + Custom Interceptors
- **Functional Programming:** `dartz` (Either Left/Right handling)
- **Local Storage:** `Hive` / `flutter_secure_storage`

---

## 🏗️ Architecture & Design Patterns
The project strictly adheres to **Clean Architecture** to ensure that business logic is independent of the UI and external APIs.

| Pattern | Implementation | Benefit |
|:---|:---|:---|
| **Repository Pattern** | `features/*/data/repositories/` | Decouples Domain from Data sources (API/Database). |
| **Observer Pattern** | BLoC Streams + `BlocBuilder` | Reactive UI updates without unnecessary rebuilds. |
| **Factory / DI Pattern** | `injection_container.dart` | Type-safe, centralized dependency resolution. |
| **Clean Layers** | Presentation, Domain, Data | High testability and 0% logic leakage into UI. |

---

## 📂 Project Structure
```text
lib/
├── core/
│   ├── common/         # Global Shared Widgets & Animations
│   ├── constants/      # App Assets, Colors (#2ec5b6), & Strings
│   ├── errors/         # Failures & Exceptions handling
│   ├── network/        # Dio Client & Network Info
│   ├── theme/          # Dark & Light mode configurations
│   ├── usecases/       # Base UseCase contract
│   └── workshop/       # 🧪 UI Component Workshop Environment
│
├── features/
│   ├── auth/           # Login, Signup, Fingerprint Auth
│   ├── home/           # Categories, Search, Recommendations
│   ├── restaurant/     # Menus, Reviews, Add-ons
│   ├── cart/           # Cart logic & Checkout workflow
│   ├── orders/         # Active & History management
│   └── profile/        # User Info, Addresses, Payments
│
├── injection_container.dart # Dependency Injection Setup
└── main.dart   


Built with ❤️ using Flutter & Clean Architecture.