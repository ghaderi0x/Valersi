/// Iranian National Code validator (کد ملی ۱۰ رقمی افراد حقیقی)
///
/// Validates Iranian personal national identification number (کد ملی)
/// according to the official checksum algorithm used by Iranian authorities.
///
/// Format: Exactly 10 digits
/// Last digit = check digit (رقم کنترل)
class IsValidNationalCode {
  /// Validates whether the given string is a valid 10-digit Iranian National Code.
  ///
  /// Validation steps:
  /// 1. Must be exactly 10 characters long
  /// 2. Rejects all-zero input ("0000000000")
  /// 3. Must contain only digits (0-9)
  /// 4. Computes weighted sum of first 9 digits:
  ///    - Position 1 (leftmost) × 10
  ///    - Position 2 × 9
  ///    - ...
  ///    - Position 9 × 2
  /// 5. Takes sum % 11
  /// 6. Check digit validation rules:
  ///    - If remainder < 2 → must equal check digit (10th digit)
  ///    - If remainder ≥ 2 → check digit must be (11 - remainder)
  ///
  /// Examples of valid inputs (sample patterns – do not use real codes):
  ///   "0012345678"     → may be valid (depending on checksum)
  ///   "1234567890"     → may be valid
  ///
  /// Common invalid examples:
  ///   "123456789"      → false (too short)
  ///   "12345678901"    → false (too long)
  ///   "0000000000"     → false (all zeros)
  ///   "001234567a"     → false (contains letter)
  ///   "1234567899"     → false (wrong checksum – most cases)
  ///
  /// Notes:
  /// • This is **only format and checksum validation** — it does **not** verify
  ///   whether the code actually exists or belongs to a real person.
  /// • Leading zeros are allowed and common (e.g. "001..." for newer registrations)
  /// • Widely used in Iranian banking, government services, insurance, etc.
  ///
  /// Returns `true` only if length, format, and checksum are all correct.
  static bool nationalCode(String input) {
    // Basic format checks
    if (input.length != 10 ||
        input == "0000000000" ||
        !RegExp(r'^\d{10}$').hasMatch(input)) {
      return false;
    }

    int result = 0;

    // Weighted sum: first digit ×10, second ×9, ..., ninth ×2
    for (int i = 0; i < 9; i++) {
      int code = int.parse(input[i]);
      result += code * (10 - i);
    }

    // Remainder after division by 11
    int finalNum = result % 11;

    int checkDigit = int.parse(input[9]);

    // Official Iranian national code check logic
    if (finalNum < 2) {
      // If remainder is 0 or 1, it must match check digit directly
      return finalNum == checkDigit;
    } else {
      // If remainder ≥ 2, check digit must be 11 - remainder
      int calNum = 11 - finalNum;
      return calNum == checkDigit;
    }
  }
}
