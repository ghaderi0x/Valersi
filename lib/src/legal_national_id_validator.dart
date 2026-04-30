/// Iranian Legal Entity National ID validator (شناسه ملی حقوقی – ۱۱ رقمی)
///
/// Validates Iranian **legal/national entity ID** (شناسه ملی شرکت‌ها و مؤسسات حقوقی)
/// according to the official Iranian algorithm used by organizations such as:
/// • ثبت احوال
/// • سازمان امور مالیاتی
/// • سامانه‌های دولتی و بانکی
///
/// Format: Exactly 11 digits
/// Last digit = check digit (رقم کنترل)
class IsValidLegalNationalId {
  /// Validates whether the given string is a valid 11-digit Iranian Legal National ID.
  ///
  /// Validation steps:
  /// 1. Must be exactly 11 characters long
  /// 2. Must contain only digits (0-9)
  /// 3. Extracts the check digit (11th digit)
  /// 4. Uses the official weighted sum algorithm:
  ///    - Takes digit 10 (0-based index 9) as base → adds 2 → offset
  ///    - Multiplies first 10 digits (after offset adjustment) by fixed weights:
  ///      [29, 27, 23, 19, 17, 29, 27, 23, 19, 17]
  ///    - Computes sum % 11
  ///    - If remainder == 10 → treated as 0
  /// 5. Compares calculated remainder with the check digit
  ///
  /// Examples of valid inputs (real format – do not use real IDs in tests):
  ///   "10100384711"    → true (example pattern)
  ///   "14001234567"    → true (if checksum matches)
  ///
  /// Invalid examples:
  ///   "1010038471"     → false (too short)
  ///   "101003847111"   → false (too long)
  ///   "1010038471a"    → false (contains letter)
  ///   "00000000000"    → false (all zeros – usually invalid)
  ///   "12345678901"    → false (wrong checksum – most cases)
  ///
  /// Notes:
  /// • This is **only checksum validation** — it does **not** verify existence
  ///   in government databases.
  /// • Leading zeros are allowed (e.g., "001..." is valid format)
  /// • Commonly used in tax systems, company registration, official contracts
  ///
  /// Returns `true` only if length, format, and checksum are all correct.
  static bool legalNationalId(String input) {
    // Basic format check: exactly 11 digits
    if (input.length != 11 || !RegExp(r'^\d{11}$').hasMatch(input)) {
      return false;
    }

    // Convert string to list of integers
    final digits = input.split('').map(int.parse).toList();

    // Check digit (last digit)
    final controlNum = digits[10];

    // Base value from 10th digit + offset
    final r = digits[9];
    final offset = r + 2;

    int sum = 0;

    // Official fixed weights for positions 1 to 10 (left to right)
    const listnum = [29, 27, 23, 19, 17, 29, 27, 23, 19, 17];

    // Calculate weighted sum
    for (int i = 0; i < 10; i++) {
      final newnum = digits[i] + offset;
      sum += newnum * listnum[i];
    }

    // Compute remainder
    int remainder = sum % 11;

    // Special rule: if remainder is 10, treat as 0
    if (remainder == 10) {
      remainder = 0;
    }

    // Valid if calculated remainder matches the check digit
    return remainder == controlNum;
  }
}
