/// Checks if a string contains **only** English/Latin letters, digits and hyphen
/// 
/// This utility is useful in Iranian applications to:
/// - Detect if user input is in English (e.g. username, password, email local part)
/// - Differentiate between Persian (Farsi) text and English text
/// - Enforce English-only input in specific fields
///
/// Note: Current implementation is **very permissive** — it returns `true`
/// as soon as **at least one** allowed character is found.
///
/// Most real-world use cases need the **opposite logic**:
/// → true only if **ALL characters** are English/digits/hyphen
class IsValidEnglish {
  /// Checks whether the input string contains at least one English letter,
  /// digit or hyphen.
  ///
  /// Current behavior:
  ///   - Returns `false` if input is empty
  ///   - Returns `true` if **at least one** character matches [a-zA-Z0-9-]
  ///   - Returns `false` only if **no** allowed character is found
  ///
  /// Examples:
  ///   isEnglish("hello")            → true
  ///   isEnglish("Hello123")         → true
  ///   isEnglish("user-name")        → true
  ///   isEnglish("سلام")             → false
  ///   isEnglish("سلام123")          → true   (because of 123)
  ///   isEnglish("  ")               → false
  ///   isEnglish("")                 → false
  ///   isEnglish("こんにちは")        → false
  ///   isEnglish("@user_name!")      → true   (because of letters & _)
  ///
  /// Important – likely NOT what you want in most cases:
  ///   This method does **NOT** check that the **entire string** is English.
  ///   It only checks for **presence** of at least one allowed character.
  ///
  /// Recommended stronger version (most common need):
  /// ```dart
  /// static bool isEnglish(String input) {
  ///   if (input.isEmpty) return false;
  ///   return RegExp(r'^[a-zA-Z0-9-]+$').hasMatch(input);
  /// }
  /// ```
  /// This version returns `true` **only if ALL characters** are English letters,
  /// digits or hyphen, and input is not empty.
  ///
  /// Returns `true` if at least one English/Latin character or digit or hyphen exists.
  static bool isEnglish(String input) {
    if (input.isEmpty) return false;

    final englishRegex = RegExp(r'[a-zA-Z0-9-]');

    return englishRegex.hasMatch(input);
  }
}
