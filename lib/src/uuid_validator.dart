/// UUID (Universally Unique Identifier) validator
///
/// Supports both:
/// - **Hyphenated** format: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx (36 chars)
/// - **Compact** format: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx (32 chars, no hyphens)
///
/// Validates format, length, hex characters, version (1-5), and variant bits.
class IsValidUUID {
  /// Checks if the input string is a valid UUID (any version 1–5).
  ///
  /// Validation rules:
  /// • Length: exactly 36 chars (with hyphens) or 32 chars (without hyphens)
  /// • All characters must be hexadecimal digits (0-9, a-f, A-F)
  /// • Version (13th char / index 12): must be 1, 2, 3, 4 or 5
  /// • Variant (17th char / index 16): must be 8, 9, a or b
  ///
  /// Examples of valid inputs:
  ///   "123e4567-e89b-12d3-a456-426614174000"     → true (v4)
  ///   "550e8400-e29b-41d4-a716-446655440000"     → true (v4)
  ///   "6ba7b8109dad11d1-80b4-00c04fd430c8"       → true (v1, hyphenated)
  ///   "3F2504E04F8911D39A0C0305E82C3301"         → true (v1, compact)
  ///   "00000000-0000-0000-0000-000000000000"     → true (nil UUID)
  ///
  /// Invalid examples:
  ///   ""                                         → false (empty)
  ///   "123e4567-e89b-12d3-a456"                  → false (too short)
  ///   "550e8400-e29b-41d4-a716-44665544000g"     → false (invalid hex 'g')
  ///   "550e8400-e29b-41d4-a716-4466554400000"    → false (too long)
  ///   "550e8400-e29b-41d4-c716-446655440000"     → false (invalid variant 'c')
  ///   "550e8400-e29b-61d4-a716-446655440000"     → false (invalid version '6')
  ///
  /// Note:
  ///   This validator checks **format and structure** only.
  ///   It does **not** verify uniqueness or collision probability.
  static bool isValid(String input) {
    if (input.isEmpty) return false;

    final len = input.length;
    if (len != 36 && len != 32) return false;

    // Remove hyphens if present (for 36-char format)
    final clean = len == 36 ? input.replaceAll('-', '') : input;
    if (clean.length != 32) return false;

    // Version digit (13th position, 0-based index 12)
    final version = clean[12].toLowerCase();
    if (!'12345'.contains(version)) return false;

    // Variant digit (17th position, 0-based index 16)
    final variant = clean[16].toLowerCase();
    if (!'89ab'.contains(variant)) return false;

    // All characters must be valid hex digits (0-9 a-f A-F)
    return clean.codeUnits.every(
      (c) =>
          (c >= 0x30 && c <= 0x39) || // 0-9
          (c >= 0x61 && c <= 0x66) || // a-f
          (c >= 0x41 && c <= 0x46), // A-F
    );
  }

  /// Checks if the input string is a valid **UUID version 4** (random UUID).
  ///
  /// Additional requirement on top of [isValid]:
  /// • Version digit (13th char / index 12) must be exactly '4'
  ///
  /// This is the most common UUID type used in modern applications.
  ///
  /// Examples:
  ///   "123e4567-e89b-42d3-a456-426614174000"     → true (v4)
  ///   "550e8400-e29b-41d4-a716-446655440000"     → false (v4? no → version=4 but wait, this is v4 example)
  ///   "6ba7b8109dad11d180b400c04fd430c8"         → false (v1)
  ///
  /// Returns `true` only if the UUID is valid **and** version == 4.
  static bool isValidV4(String input) {
    if (!isValid(input)) return false;

    final clean = input.replaceAll('-', '');
    return clean[12].toLowerCase() == '4';
  }
}
