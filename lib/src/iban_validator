/// Iranian IBAN / Sheba number validator (شماره شبا)
///
/// Validates Iranian Sheba (IBAN) numbers according to the official Iranian banking standard.
///
/// Iranian Sheba format:
///   - Exactly 24 digits
///   - Starts with country code "IR" converted to numeric (but here we expect pure digits)
///   - Includes 2-digit check digits + 22-digit account/BBAN
///
/// This implementation:
///   - Expects **pure 24-digit string** (no "IR" prefix, no spaces, no dashes)
///   - Rejects all-zero input
///   - Performs the standard IBAN modulo 97 validation algorithm
class IsValidIban {
  /// Validates whether the given string is a valid 24-digit Iranian Sheba (IBAN) number.
  ///
  /// Validation steps:
  /// 1. Must be exactly 24 characters long
  /// 2. Rejects all-zero string ("000000000000000000000000")
  /// 3. Must contain only digits (0-9)
  /// 4. Converts the number to the IBAN validation form:
  ///    - Takes digits 3–24 → appends "1827" (IR numeric) → appends first 2 digits (check digits)
  /// 5. Computes modulo 97
  /// 6. Valid if result == 1
  ///
  /// Examples of valid inputs (pure digits):
  ///   "930150000001351800087201"     → true
  ///   "930170000012345678901234"     → true (if checksum correct)
  ///
  /// Invalid examples:
  ///   "IR930150000001351800087201"   → false (has letters, length wrong)
  ///   "93015000000135180008720"      → false (too short)
  ///   "930150000001351800087202"     → false (wrong checksum)
  ///   "000000000000000000000000"     → false (all zeros)
  ///   "abc123..."                    → false (non-digits)
  ///
  /// Important notes:
  /// • This validator expects **digit-only** input (most APIs and databases store Sheba this way)
  /// • If your input contains "IR" prefix or spaces/dashes, clean it first:
  ///     ```dart
  ///     String clean = input.replaceAll(RegExp(r'[^0-9]'), '');
  ///     if (clean.startsWith('98')) clean = '93' + clean.substring(2); // sometimes 98 → 93
  ///     bool isValid = Valersi.IBAN(clean);
  ///     ```
  /// • For full UX, consider also checking bank code (digits 3–5) using [Valersi.bankDetect]
  ///
  /// Returns `true` only if all checks pass and the IBAN checksum is valid.
  static bool iban(String input) {
    // Must be exactly 24 digits
    if (input.length != 24) return false;

    // Common invalid/test all-zero case
    if (input == "000000000000000000000000") return false;

    // Ensure only digits
    if (!RegExp(r'^\d{24}$').hasMatch(input)) return false;

    // Prepare IBAN numeric form:
    // body (digits 3-24) + "1827" (IR) + check digits (first 2 digits)
    String controlNums = input.substring(0, 2);
    String body = input.substring(2);
    String numericString = body + "1827" + controlNums;

    // Use BigInt because 24-digit number + 4 digits > 2^63
    BigInt number = BigInt.parse(numericString);
    BigInt mod = number % BigInt.from(97);

    // Valid IBAN → remainder must be 1
    return mod == BigInt.one;
  }
}
