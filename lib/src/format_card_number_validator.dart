/// Utility class for formatting Iranian bank card numbers
///
/// This class provides a clean and readable formatting for 16-digit (or partial)
/// Iranian bank card numbers by inserting a space every 4 digits.
///
/// The output follows the common visual format used in Iranian banking apps:
///    6037 9911 9950 0590
class IsValidFormatCardNO {
  /// Formats a bank card number by adding spaces every 4 digits.
  ///
  /// Behavior:
  /// - Removes all non-digit characters from the input (spaces, dashes, etc.)
  /// - Groups remaining digits in chunks of 4, separated by a single space
  /// - Does **not** add space at the very end
  /// - Works with partial card numbers (less than 16 digits)
  /// - Returns empty string if input contains no digits
  ///
  /// Examples:
  ///   formatCardNo("6037991199500590")      → "6037 9911 9950 0590"
  ///   formatCardNo("6037 9911 9950 0590")   → "6037 9911 9950 0590"
  ///   formatCardNo("603799119950059")       → "6037 9911 9950 059"
  ///   formatCardNo("6037-9911-9950-0590")   → "6037 9911 9950 0590"
  ///   formatCardNo("abc603799def119950")    → "6037 9911 9950"
  ///   formatCardNo("")                      → ""
  ///   formatCardNo("    ")                  → ""
  ///
  /// This formatter is typically used for:
  /// - Displaying card numbers in UI
  /// - Improving readability in text fields
  /// - Preparing card numbers for presentation (not for validation)
  ///
  /// Note: This method **does not validate** the card number.
  /// Use [Valersi.bankCardNO] for validation.
  static String formatCardNo(String input) {
    // Remove everything except digits
    final clean = input.replaceAll(RegExp(r'[^0-9]'), '');

    final buffer = StringBuffer();

    // Insert space after every 4th digit, but not after the last group
    for (int i = 0; i < clean.length; i++) {
      buffer.write(clean[i]);

      // Add space after every 4 digits, but only if there are more digits coming
      if ((i + 1) % 4 == 0 && i + 1 < clean.length) {
        buffer.write(' ');
      }
    }

    return buffer.toString();
  }
}
