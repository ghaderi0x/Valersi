/// Converts English/Latin digits to Persian (Eastern Arabic) digits (0-9 → ۰-۹)
///
/// This utility is very useful in Iranian applications where:
/// - You want to display numbers in Persian style (common in UI, receipts, reports)
/// - Text should match the Persian language and right-to-left context
/// - Users expect native-looking numbers in Farsi text
///
/// Behavior:
/// • Replaces each English digit (0 to 9) with its Persian equivalent (۰ to ۹)
/// • Leaves all other characters unchanged (Persian letters, symbols, spaces, etc.)
/// • Safe to use on mixed strings (English numbers + Persian text)
class IsValidtoPersianNumbers {
  /// Converts all English/Latin digits in the input string to Persian digits.
  ///
  /// Mapping used:
  ///   0 → ۰
  ///   1 → ۱
  ///   2 → ۲
  ///   3 → ۳
  ///   4 → ۴
  ///   5 → ۵
  ///   6 → ۶
  ///   7 → ۷
  ///   8 → ۸
  ///   9 → ۹
  ///
  /// Examples:
  ///   toPersianNumbers("قیمت: 123,456 تومان")   → "قیمت: ۱۲۳,۴۵۶ تومان"
  ///   toPersianNumbers("1403/05/15")             → "۱۴۰۳/۰۵/۱۵"
  ///   toPersianNumbers("Phone: 09121234567")     → "Phone: ۰۹۱۲۱۲۳۴۵۶۷"
  ///   toPersianNumbers("ABC 123 DEF 456")        → "ABC ۱۲۳ DEF ۴۵۶"
  ///   toPersianNumbers("۱۲۳۴۵۶")                 → "۱۲۳۴۵۶"          (Persian digits unchanged)
  ///   toPersianNumbers("سلام دنیا")              → "سلام دنیا"      (no digits → unchanged)
  ///   toPersianNumbers("")                       → ""
  ///
  /// Usage recommendations:
  /// • Ideal for final UI display of numbers in Persian context
  /// • Usually called after formatting (e.g. after adding thousand separators)
  /// • For the reverse conversion (Persian → English), use [Valersi.toEnglishNumbers]
  /// • Combine with formatMoney for beautiful Persian money display:
  ///     Valersi.toPersianNumbers(Valersi.formatMoney("1234567"))
  ///
  /// Returns the input string with all English digits replaced by Persian ones.
  static String toPersianNumbers(String text) {
    // Mapping from Western/English digits to Persian/Eastern Arabic digits
    const map = {
      '0': '۰',
      '1': '۱',
      '2': '۲',
      '3': '۳',
      '4': '۴',
      '5': '۵',
      '6': '۶',
      '7': '۷',
      '8': '۸',
      '9': '۹',
    };

    // Convert each character: replace if in map, otherwise keep original
    return text.split('').map((char) => map[char] ?? char).join();
  }
}
