/// Simple email validator with Iranian users in mind
///
/// This class provides basic email format validation.
///
/// Current implementation:
///   - Checks general email-like structure
///   - Forces the email to end with @gmail.com
///
/// Note: This is **not** a general-purpose email validator.
/// It is intentionally restricted to Gmail addresses only,
/// which is a common requirement in many Iranian applications
/// (due to better deliverability, fewer blocks by Iranian ISPs, etc.).
class IsValidateEmail {
  /// Validates whether the input string is a syntactically valid Gmail address.
  ///
  /// Validation steps:
  /// 1. Input must not be empty
  /// 2. Trims whitespace and converts to lowercase
  /// 3. Checks basic email pattern (local-part@domain)
  /// 4. **Strictly enforces** that the domain is exactly "gmail.com"
  ///
  /// Examples of valid inputs:
  ///   - "example@gmail.com"
  ///   - "  AliReza123@gmail.com  "     → true (after trim & lowercase)
  ///   - "test.user@gmail.com"
  ///
  /// Examples of invalid inputs:
  ///   - ""                                 → false (empty)
  ///   - "user@yahoo.com"                   → false (not gmail.com)
  ///   - "user@GMAIL.COM"                   → true  (converted to lowercase)
  ///   - "user@gmail"                       → false (invalid domain)
  ///   - "user@googlemail.com"              → false (only gmail.com allowed)
  ///   - "not-an-email"                     → false
  ///   - "user@gmail.com extra"             → false
  ///
  /// Important:
  ///   This validator is deliberately strict and Gmail-only.
  ///   It does NOT follow RFC 5322 completely and is NOT suitable
  ///   for applications that need to accept all valid email formats.
  ///
  /// Returns `true` only if the input is a non-empty string that
  /// matches a basic email pattern AND ends with "@gmail.com".
  static bool email(String input) {
    // Basic regex for common email format (very permissive local-part)
    String _pattern = r"^[a-zA-Z0-9.a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    if (input.isEmpty) return false;

    // Normalize: remove leading/trailing spaces and convert to lowercase
    final cleanEmail = input.trim().toLowerCase();

    final regExp = RegExp(_pattern);

    // First check basic structure
    if (!regExp.hasMatch(cleanEmail)) return false;

    // Final strict requirement: must be @gmail.com
    return cleanEmail.endsWith('@gmail.com');
  }
}
