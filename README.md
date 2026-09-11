# 🍔 hungry_food_app

تطبيق Flutter لطلب واستعراض الوجبات، مبني باتباع هيكلة برمجية نظيفة وقابلة للتوسع (Feature-First Architecture) ومعتمد على استهلاك واجهات برمجة التطبيقات (APIs).

---

## 📁 Project Structure

lib/
├── core/
│   ├── constants/
│   │   ├── api_endpoints.dart
│   │   ├── app_colors.dart
│   │   └── app_strings.dart
│   ├── network/
│   │   ├── api_service.dart
│   │   └── api_exceptions.dart
│   └── utils/
│       ├── helpers.dart
│       └── validators.dart
│
├── features/
│   ├── auth/
│   │   ├── data/
│   │   ├── view/
│   │   └── widgets/
│   │
│   ├── cart/
│   │   ├── data/
│   │   ├── view/
│   │   └── widgets/
│   │
│   ├── checkout/
│   │   ├── data/
│   │   ├── view/
│   │   └── widgets/
│   │
│   ├── food/
│   │   ├── data/
│   │   │   ├── food_model.dart
│   │   │   └── food_repository.dart
│   │   ├── view/
│   │   │   ├── food_list_view.dart
│   │   │   └── food_detail_view.dart
│   │   └── widgets/
│   │       └── food_card.dart
│   │
│   ├── home/
│   │   ├── data/
│   │   ├── view/
│   │   └── widgets/
│   │
│   └── product/
│       ├── data/
│       ├── view/
│       └── widgets/
│
|
|__ root.dart
|
|── main.dart
|
└── splash.dart