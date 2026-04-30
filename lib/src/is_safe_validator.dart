/// Basic input safety checker – detects potentially dangerous or unwanted characters
///
/// This utility performs a simple check to see if the input string contains
/// any characters that are commonly considered unsafe or problematic in certain contexts,
/// such as:
/// - SQL injection attempts
/// - HTML/JSX injection
/// - Command injection
/// - File path traversal
/// - Unwanted formatting in logs or UI
///
/// Note: This is a **very basic** and **permissive** sanitizer.
/// It is **NOT** a complete security solution and should **NOT** be solely relied upon
/// for protecting against real attacks.
class IsDataSafe {
  /// Checks if the input string contains **none** of the predefined forbidden characters.
  ///
  /// Forbidden characters (as of current implementation):
  ///   @  #  $  %  ()  []  *  |  "  '  <  >  -
  ///
  /// Returns:
  ///   • `true`  → input appears "safe" (contains none of the forbidden chars)
  ///   • `false` → input contains at least one forbidden character
  ///
  /// Examples:
  ///   isSafe("username123")            → true
  ///   isSafe("hello world")            → true
  ///   isSafe("hello-world")            → false  (contains -)
  ///   isSafe("price: $99")             → false  (contains $)
  ///   isSafe("select * from users")    → false  (contains *, space is allowed)
  ///   isSafe("O'Connor")               → false  (contains ')
  ///   isSafe("email@domain.com")       → false  (contains @)
  ///   isSafe("")                       → true
  ///   isSafe("  ")                     → true   (spaces are allowed)
  ///
  /// Important Security Notes:
  ///   1. This list is **very limited** — many dangerous characters are still allowed
  ///      (e.g. `;`, `/`, `\`, `=`, `` ` ``, `&`, newline, etc.)
  ///   2. This method **does not prevent** real injection attacks
  ///   3. For real security, always use:
  ///      - Prepared statements / parameterized queries (SQL)
  ///      - Proper HTML escaping (e.g. `htmlEscape` from `html` package)
  ///      - Input validation + sanitization libraries (e.g. validator, sanitize-html)
  ///      - Output encoding based on context
  ///
  /// Recommended stronger alternative (example):
  /// ```dart
  /// static bool isSafe(String input) {
  ///   // More comprehensive forbidden set
  ///   const forbidden = r'[<>"\'%;()&+=\[\]{}/\\`]';
  ///   return !RegExp(forbidden).hasMatch(input);
  /// }
  /// ```
  ///
  /// Returns `true` if no forbidden characters are found in the input string.
  static bool isSafe(String input) {
    // List of characters that are often considered risky in many contexts
    List<String> myForbiddenList = [
      '@',
      '#',
      r'$',
      '%',
      '()',
      '[]',
      '*',
      '|',
      '"',
      "'",
      '<',
      '>',
      '-',
    ];

    // Returns true only if NONE of the forbidden strings appear in input
    return !myForbiddenList.any((char) => input.contains(char));
  }
}
