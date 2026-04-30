/// Checks if a string contains **at least one** Persian/Farsi character
///
/// This utility helps detect the presence of Persian script in a string.
/// It is commonly used in Iranian applications to:
/// - Identify if user input is written in Persian
/// - Differentiate between Persian text and other languages
/// - Apply right-to-left (RTL) layout or Persian-specific formatting
///
/// Note: Current implementation returns `true` as soon as **at least one**
/// Persian character is found — **not** if the entire string is Persian.
class IsValidPersian {
  /// Detects whether the input string contains at least one Persian (Farsi) character.
  ///
  /// Supported characters include:
  /// • Main Arabic script block used in Persian: U+0600 – U+06FF
  /// • Four extra letters commonly used in Persian: پ (U+067E), چ (U+0686), ژ (U+0698), گ (U+06AF)
  /// • Zero-width non-joiner (U+200C) and zero-width joiner (U+200D) — used for correct ligature control
  /// • Special characters like ی (U+06CC / U+FB8A variant)
  ///
  /// Examples:
  ///   isPersian("سلام دنیا")          → true
  ///   isPersian("سلام123")             → true
  ///   isPersian("Hello سلام")          → true   (because of Persian part)
  ///   isPersian("Hello World")         → false
  ///   isPersian("  ")                  → false
  ///   isPersian("")                    → false
  ///   isPersian("كتاب")                → true   (Arabic Kaf works too)
  ///   isPersian("پارسی")               → true
  ///   isPersian("نیم‌فاصله")           → true   (contains ZWNJ)
  ///
  /// Important – likely NOT what most developers expect:
  ///   This method returns `true` even if only **one** Persian character exists.
  ///   It does **NOT** verify that the **whole string** is in Persian.
  ///
  /// Recommended stricter version (most common real-world need):
  /// ```dart
  /// static bool isPersian(String input) {
  ///   if (input.isEmpty) return false;
  ///   return RegExp(r'^[\u0600-\u06FF\uFB8A\u067E\u0686\u06AF\u200C\u200D\s0-9]+$').hasMatch(input);
  /// }
  /// ```
  /// The stricter version:
  ///   • Allows Persian letters + spaces + digits
  ///   • Returns `true` only if **ALL characters** are Persian-compatible
  ///   • Still accepts numbers and spaces (common in addresses, names, etc.)
  ///
  /// Returns `true` if at least one Persian character is found in the string.
  static bool isPersian(String input) {
    if (input.isEmpty) return false;

    final farsiRegex = RegExp(
      r'[\u0600-\u06FF\uFB8A\u067E\u0686\u06AF\u200C\u200D]',
    );

    return farsiRegex.hasMatch(input);
  }
}
