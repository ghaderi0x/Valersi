import 'src/bank_card_validator.dart';
import 'src/national_code_validator.dart';
import 'src/iban_validator.dart';
import 'src/is_safe_validator.dart';
import 'src/to_persian_numbers_validator.dart';
import 'src/to_english_numbers_validator.dart';
import 'src/format_card_number_validator.dart';
import 'src/post_code_validator.dart';
import 'src/email_validator.dart';
import 'src/uuid_validator.dart';
import 'src/legal_national_id_validator.dart';
import 'src/format_money_validator.dart';
import 'src/bank_detect_validator.dart';
import 'src/is_english_validator.dart';
import 'src/is_persian_validator.dart';

/// Iranian-specific data validation and formatting utilities (مخصوص برنامه‌نویسان ایرانی)
///
/// This class provides static methods for validating and formatting common Iranian
/// data types such as national ID (کد ملی), bank card numbers (شماره کارت بانکی),
/// Sheba/IBAN, postal codes, Persian/English number conversion, and more.
class Valersi {
  /// Validates Iranian national code (کد ملی ۱۰ رقمی).
  ///
  /// Returns `true` if the input is a valid 10-digit Iranian national code.
  /// The validation follows the official Iranian checksum algorithm.
  static bool nationalCode(String input) {
    return IsValidNationalCode.nationalCode(input);
  }

  /// Validates Iranian bank card number (شماره کارت بانکی ۱۶ رقمی).
  ///
  /// Uses the Luhn algorithm to check validity.
  /// Returns `true` for valid 16-digit Iranian bank cards.
  static bool bankCardNO(String input) {
    return IsValidBankCardNo.bankCardNO(input);
  }

  /// Validates Iranian IBAN / Sheba number (شماره شبا).
  ///
  /// Checks format, length and checksum according to Iranian banking standards.
  static bool iban(String input) {
    return IsValidIban.iban(input);
  }

  /// Validates Iranian mobile phone number (شماره موبایل).
  ///
  /// Expects format: 09xxxxxxxxx (exactly 11 digits starting with 09)
  static bool mobileNO(String input) {
    return RegExp(r'^09[0-9]{9}$').hasMatch(input);
  }

  /// Converts English/Latin digits to Persian digits.
  ///
  /// Example: "123" → "۱۲۳"
  static String toPersianNumbers(String input) {
    return IsValidtoPersianNumbers.toPersianNumbers(input);
  }

  /// Converts Persian digits to English/Latin digits.
  ///
  /// Example: "۱۲۳" → "123"
  static String toEnglishNumbers(String input) {
    return IsVaildToEnglishNumbers.toEnglishNumbers(input);
  }

  /// Formats bank card number with groups of 4 digits separated by space.
  ///
  /// Example: "6037991234567890" → "6037 9912 3456 7890"
  static String formatCardNo(String input) {
    return IsValidFormatCardNO.formatCardNo(input);
  }

  /// Validates Iranian postal code (کد پستی ۱۰ رقمی).
  static bool postCode(String input) {
    return IsValidPostCode.postCode(input);
  }

  /// Validates email address format.
  ///
  /// Uses a reasonable regex suitable for most common cases.
  static bool email(String input) {
    return IsValidateEmail.email(input);
  }

  /// Validates whether the string is a valid UUID (any version).
  static bool uuid(String input) {
    return IsValidUUID.isValid(input);
  }

  /// Validates whether the string is a valid UUID v4.
  static bool uuidv4(String input) {
    return IsValidUUID.isValidV4(input);
  }

  /// Validates Iranian legal national ID (شناسه ملی حقوقی – ۱۱ رقمی).
  static bool legalNationID(String input) {
    return IsValidLegalNationalId.legalNationalId(input);
  }

  /// Formats number as Iranian money with proper thousand separators and Persian digits.
  ///
  /// Example: "1234567" → "۱,۲۳۴,۵۶۷"
  static String formatMoney(String input) {
    return DoFormatMoney.formatMoney(input);
  }

  /// Detects Iranian bank name from 16-digit bank card number (BIN/IIN based).
  ///
  /// Returns bank name in Persian (or "نامشخص" if not recognized).
  static String bankDetect(String input) {
    return IsBankDetect.bankDetect(input);
  }

  /// Checks if the string contains only English/Latin letters and basic symbols.
  static bool isEnglish(String input) {
    return IsValidEnglish.isEnglish(input);
  }

  /// Checks if the string contains only Persian (Farsi) characters.
  static bool isPersian(String input) {
    return IsValidPersian.isPersian(input);
  }

  /// Basic safety check – detects potentially dangerous/invalid characters.
  ///
  /// Useful for input sanitization before saving to database or logging.
  static bool isSafe(String input) {
    return IsDataSafe.isSafe(input);
  }
}
