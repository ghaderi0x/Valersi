/// Iranian bank name detector from card number or IBAN/Sheba
///
/// This utility detects the name of an Iranian bank based on:
/// - The first 6 digits (BIN/IIN) of a 16-digit bank card number
/// - The bank code part (positions 3-5, i.e. characters 2-4 after IR) of a 24-character Sheba/IBAN
///
/// Returns the Persian name of the bank if recognized, otherwise:
/// - "Unknown Bank" if format is correct but code not found
/// - "Invalid" if length or format is wrong
class IsBankDetect {
  /// Detects Iranian bank name from either:
  ///   - 16-digit bank card number (شماره کارت بانکی)
  ///   - 24-character Iranian IBAN/Sheba number (شماره شبا)
  ///
  /// Behavior:
  /// - Cleans input: removes all non-digit characters
  /// - For 16-digit input → looks up first 6 digits (BIN)
  /// - For 24-digit input → looks up digits 3-5 (bank code in Sheba)
  /// - Returns bank name in Persian if matched
  /// - Returns "Unknown Bank" if code exists but not in mapping
  /// - Returns "Invalid" for wrong length or empty input
  ///
  /// Examples:
  ///   bankDetect("6037991234567890")     → "ملی ایران"
  ///   bankDetect("IR820160000001234567890123") → "کشاورزی"
  ///   bankDetect("6104331234567890")     → "ملت"
  ///   bankDetect("1234")                 → "Invalid"
  ///
  /// Note: The mapping is based on official/known Iranian bank BINs and Sheba codes
  /// as of 2024–2025. It may need updates over time.
  static String bankDetect(String input) {
    // Remove all non-digit characters to normalize input
    input = input.replaceAll(RegExp(r'[^0-9]'), '');

    // Early exit for empty or whitespace-only input
    if (input.isEmpty) return "Invalid";
    if (input.trim().isEmpty) return "Invalid";

    // Handle Iranian Sheba/IBAN (24 digits)
    if (input.length == 24) {
      // Bank code is characters 2 to 4 (0-based: indices 2,3,4)
      String bankCode = input.substring(2, 5);

      const Map<String, String> ibanCodes = {
        "010": "مرکزی",
        "011": "صنعت و معدن",
        "012": "ملت",
        "013": "رفاه",
        "014": "مسکن",
        "015": "سپه",
        "016": "کشاورزی",
        "017": "ملی ایران",
        "018": "تجارت",
        "019": "صادرات",
        "020": "توسعه صادرات",
        "021": "پست بانک",
        "022": "توسعه تعاون",
        "051": "موسسه اعتباری توسعه",
        "053": "کارآفرین",
        "054": "پارسیان",
        "055": "اقتصاد نوین",
        "056": "سامان",
        "057": "پاسارگاد",
        "058": "سرمایه",
        "059": "سینا",
        "060": "قوامین",
        "061": "شهر",
        "062": "تتار",
        "063": "انصار",
        "064": "گردشگری",
        "065": "آینده",
        "066": "دی",
        "069": "ایران زمین",
        "070": "رسالت",
        "073": "کوثر",
        "075": "مهر ایران",
        "078": "خاورمیانه",
        "080": "نور",
      };

      return ibanCodes[bankCode] ?? "Unknown Bank";
    }
    // Handle 16-digit bank card number
    else if (input.length == 16) {
      // First 6 digits = BIN/IIN
      var bankcodeCard = input.substring(0, 6);

      const Map<String, String> cardBins = {
        "603799": "ملی ایران",
        "589210": "سپه",
        "627353": "تجارت",
        "628023": "مسکن",
        "627760": "پست بانک",
        "627412": "اقتصاد نوین",
        "622106": "پارسیان",
        "502229": "پاسارگاد",
        "639346": "سینا",
        "610433": "ملت",
        "627488": "کارآفرین",
        "621986": "سامان",
        "639347": "پاسارگاد",
        "589463": "رفاه کارگران",
        "627381": "انصار",
        "639607": "سرمایه",
        "636214": "آینده",
        "502908": "توسعه تعاون",
        "504172": "رسالت",
        "505785": "مهر ایران",
        "603770": "کشاورزی",
        "639599": "قوامین",
        "628157": "موسسه اعتباری توسعه",
        "603769": "صادرات ",
      };

      return cardBins[bankcodeCard] ?? 'Unknown Bank';
    }
    // Any other length is invalid
    else {
      return 'Invalid';
    }
  }
}
