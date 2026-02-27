<div align="center">

![](https://raw.githubusercontent.com/ghaderi0x/Valersi/Logo.jpg)


[![pub package](https://img.shields.io/pub/v/valersi.svg?label=valersi&color=blue)](https://pub.dev/packages/valersi)
[![pub points](https://img.shields.io/pub/points/valersi?logo=dart)](https://pub.dev/packages/get/score)
[![Dart SDK](https://img.shields.io/badge/Dart-%3E%3D2.17-blue.svg)](https://dart.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Dart%20VM%20%7C%20Flutter-lightgrey.svg)](https://dart.dev/)

</div>


# Valersi
**Valersi** is a comprehensive validation library for Iranian developers. It includes 16+ essential validators like National ID, IBAN, BankCards and more for both Dart and Flutter projects.

---

## Why valersi? 🚀

- 🇮🇷 Built specifically for **real-world Iranian validation needs**
- 🧩 Pure Dart (no Flutter dependency)
- ⚡ Lightweight & high performance
- 🧪 Fully tested and production-ready
- 🏦 Bank detection for Iranian card numbers & IBAN
- 🔢 Smart number and money formatting (Persian & English aware)

---

## ✨ All Features & Usage Examples

| Method | Description | Example Code | Output / Result Example |
|--------|------------|-------------|--------------------------|
| `nationalCode` | Validate 10-digit Iranian national ID | `Valersi.nationalCode('0013520839')` | `true` |
| `legalNationID` | Validate 11-digit legal entity national ID | `Valersi.legalNationID('14005893811')` | `true` |
| `bankCardNO` | Validate 16-digit bank card (Luhn algorithm) | `Valersi.bankCardNO('6037991199500590')` | `true` |
| `IBAN` | Validate 24-digit Iranian IBAN (Shaba) | `Valersi.IBAN('930150000001351800087201')` | `true` |
| `postCode` | Validate 10-digit postal code | `Valersi.postCode('1457863491')` | `true` |
| `bankDetect` | Detect bank name from card number or IBAN | `Valersi.bankDetect('6037991199500590')` | `Melli Bank` |
| `formatCardNo` | Format card number as 4-4-4-4 | `Valersi.formatCardNo('6037991199500590')` | `6037 9911 9950 0590` |
| `formatMoney` | Format number with thousand separators (auto Persian/English detection) | `Valersi.formatMoney('12500000')` | `12,500,000` |
| `toPersianNumbers` | Convert English digits to Persian digits | `Valersi.toPersianNumbers('123456')` | `۱۲۳۴۵۶` |
| `toEnglishNumbers` | Convert Persian digits to English digits | `Valersi.toEnglishNumbers('۱۲۳۴۵۶')` | `123456` |
| `email` | Validate Gmail addresses only | `Valersi.email('test@gmail.com')` | `true` |
| `mobileNO` | Validate Iranian mobile number (09xxxxxxxxx) | `Valersi.mobileNO('09123456789')` | `true` |
| `isEnglish` | Check if string contains at least one English letter | `Valersi.isEnglish('Hello123')` | `true` |
| `isPersian` | Check if string contains at least one Persian letter | `Valersi.isPersian('سلام')` | `true` |
| `isSafe` | Basic dangerous character check | `Valersi.isSafe('<script>')` | `false` |
| `UUID` | Validate generic UUID | `Valersi.UUID('550e8400-e29b-41d4-a716-446655440000')` | `true` |
| `UUIDv4` | Validate UUID version 4 | `Valersi.UUIDv4('550e8400-e29b-41d4-a716-446655440000')` | `true` |

## ⚙ Platform Support

| 📱 Android | 🍎 iOS | 🍏 MacOS | 🌐 Web | 🐧 Linux | 💻 Windows |
|:----------:|:------:|:--------:|:------:|:--------:|:----------:|
|     ✅      |   ✅    |    ✅     |   ✅    |    ✅     |     ✅      |

## 📦 Installation

1️⃣ To use this package, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  valersi: ^1.0.0
```

2️⃣ Then, run:

```bash
dart pub get
```

Or for Flutter projects:👇
```bash
flutter pub get
```

3️⃣ Import the package in your project:

```dart
import 'package:valersi/valersi.dart';
```

## 🎯 Example:

See a full working example → [example/main.dart](example/main.dart)

## 🪪 License

This project is licensed under the MIT License - see the [MIT License](https://mit-license.org/) site for details.

## ℹ️ More Info:

- **Developer**: AmirMohammad Ghaderi
- **Email:** ghaderi.dev404@gmail.com
- **Last Updated:** February 2026
