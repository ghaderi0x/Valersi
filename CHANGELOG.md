# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-02-25

### Added
- Initial release of **Valersi**
- Complete offline Persian/Iranian data validation:
  - National ID (کد ملی اشخاص حقیقی)
  - Legal entity national ID (شناسه ملی حقوقی)
  - Iranian bank card number validation + issuer bank detection
  - Sheba (شبا) validation + bank detection
  - Iranian mobile number
  - Postal code (کد پستی)
  - UUID validation
  - Email validation
  - Persian-only text detection
  - English-only text detection
  - Secure input filtering (anti-XSS / dangerous chars)
- Formatting utilities:
  - Auto-format bank card (XXXX XXXX XXXX XXXX)
  - Money formatting (123,456,789)
- Number conversion:
  - English ↔ Persian digits
- 100% offline, no external APIs or dependencies

### Fixed
- N/A (initial release)

### Changed
- N/A

### Removed
- N/A
