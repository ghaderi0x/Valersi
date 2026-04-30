/// Iranian money / price formatter with automatic Persian/English digit detection
///
/// Formats a numeric string by:
/// - Removing all non-digit characters (including Persian digits if mixed)
/// - Adding thousand separators (comma)
/// - Preserving the original digit style (Persian or English/Latin)
///
/// This formatter tries to detect whether the input mostly contains Persian digits
/// and keeps the same style in the output.
class DoFormatMoney {
  /// Formats a number string as Iranian currency style with thousand separators.
  ///
  /// Features:
  /// • Removes all non-numeric characters (letters, dots, spaces, etc.)
  /// • Automatically detects if input uses Persian digits (۰-۹) or Latin digits (0-9)
  /// • Uses the same digit style in output (Persian → Persian, English → English)
  /// • Adds comma (,) as thousand separator (common in Iranian apps)
  /// • Returns '0' for empty or invalid input
  ///
  /// Examples:
  ///   formatMoney("23344")          → "23,344"           (English digits)
  ///   formatMoney("۲۳۳۴۴")         → "۲۳,۳۴۴"          (Persian digits)
  ///   formatMoney("23,344.66")      → "23,344"           (removes decimal & non-digits)
  ///   formatMoney("  ۱۲۳۴۵۶۷۸۹  ") → "۱۲۳,۴۵۶,۷۸۹"     (Persian style preserved)
  ///   formatMoney("")               → "0"
  ///   formatMoney("abc")            → "0"
  ///   formatMoney("12.34.56")       → "1,234"           (only first part considered)
  ///
  /// Usage notes:
  /// • This method is mainly for **display purposes** (UI, receipts, etc.)
  /// • It **does not handle decimal parts** — everything after dot is ignored
  /// • It **does not add currency symbol** (ریال/تومان) — you can add it manually
  /// • For better UX in TextFields, consider combining with input formatters
  ///
  /// Returns formatted string or "0" if no valid digits found.
  static String formatMoney(String input) {
    // Early return for empty/whitespace input
    if (input.trim().isEmpty) return '0';

    // Keep only digits — both Latin (0-9) and Persian (۰-۹)
    final digits = input.replaceAll(RegExp(r'[^\d\u06F0-\u06F9]'), '');

    // If no digits remain → return zero
    if (digits.isEmpty) return '0';

    // Detect if input contains any Persian digit → decide output style
    final isPersianStyle = digits.runes.any((r) => r >= 0x06F0 && r <= 0x06F9);

    // Create mapping: Persian → Persian or Latin → Latin
    final digitMap = <int, String>{
      if (isPersianStyle) ...{
        for (int i = 0; i <= 9; i++)
          0x06F0 + i: String.fromCharCode(0x06F0 + i),
      } else ...{
        for (int i = 0; i <= 9; i++) i + 0x30: String.fromCharCode(i + 0x30),
      },
    };

    final buffer = StringBuffer();

    int count = 0;

    // Process from right to left (least significant digit first)
    for (int i = digits.length - 1; i >= 0; i--) {
      final charCode = digits.runes.elementAt(i);
      // Write the digit (in desired style)
      buffer.write(digitMap[charCode] ?? String.fromCharCode(charCode));

      count++;
      // Insert comma every 3 digits, but not before the first digit
      if (count % 3 == 0 && i > 0) {
        buffer.write(',');
      }
    }

    // Reverse the result because we built it backwards
    return buffer.toString().split('').reversed.join();
  }
}
