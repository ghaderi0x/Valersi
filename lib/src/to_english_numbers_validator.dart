/// Converts Persian (Eastern Arabic) digits to English/Latin digits (۰-۹ → 0-9)
///
/// This utility is very useful in Iranian applications where:
/// - Users may input numbers using Persian keyboard/layout
/// - Data comes from APIs, databases, or UI that use Persian numerals
/// - You need standardized numeric strings for calculations, parsing, storage, etc.
///
/// Behavior:
/// • Replaces each Persian digit (۰ to ۹) with its English equivalent (0 to 9)
/// • Leaves all other characters unchanged (letters, symbols, spaces, Latin digits, etc.)
/// • Safe to use on mixed strings (Persian + English + text)
class IsVaildToEnglishNumbers {
  /// Converts all Persian digits in the input string to English/Latin digits.
  ///
  /// Mapping used:
  ///   ۰ → 0
  ///   ۱ → 1
  ///   ۲ → 2
  ///   ۳ → 3
  ///   ۴ → 4
  ///   ۵ → 5
  ///   ۶ → 6
  ///   ۷ → 7
  ///   ۸ → 8
  ///   ۹ → 9
  ///
  /// Examples:
  ///   toEnglishNumbers("قیمت: ۱۲۳٬۴۵۶ تومان")   → "قیمت: 123,456 تومان"
  ///   toEnglishNumbers("۱۴۰۳/۰۵/۱۵")             → "1403/05/15"
  ///   toEnglishNumbers("Phone: ۰۹۱۲۱۲۳۴۵۶۷")     → "Phone: 09121234567"
  ///   toEnglishNumbers("ABC ۱۲۳ DEF ۴۵۶")        → "ABC 123 DEF 456"
  ///   toEnglishNumbers("123456")                 → "123456"          (Latin digits unchanged)
  ///   toEnglishNumbers("سلام دنیا")              → "سلام دنیا"      (no digits → unchanged)
  ///   toEnglishNumbers("")                       → ""
  ///
  /// Usage recommendations:
  /// • Call this before parsing numbers: int.parse(Valersi.toEnglishNumbers(userInput))
  /// • Useful in TextField onChange, form submission, API payload preparation
  /// • For the reverse conversion (English → Persian), use [Valersi.toPersianNumbers]
  ///
  /// Returns the input string with all Persian digits replaced by English ones.
  static String toEnglishNumbers(String text) {
    // Mapping from Persian/Eastern Arabic digits to Western/English digits
    const map = {
      '۰': '0',
      '۱': '1',
      '۲': '2',
      '۳': '3',
      '۴': '4',
      '۵': '5',
      '۶': '6',
      '۷': '7',
      '۸': '8',
      '۹': '9',
    };

    // Convert each character: replace if in map, otherwise keep original
    return text.split('').map((char) => map[char] ?? char).join();
  }
}
