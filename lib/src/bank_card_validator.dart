/// Iranian bank card number validator using Luhn algorithm
///
/// This class provides validation for 16-digit Iranian bank card numbers
/// (شماره کارت بانکی ۱۶ رقمی) according to the standard Luhn checksum algorithm.
class IsValidBankCardNo {
  /// Validates whether the given string is a valid 16-digit Iranian bank card number.
  ///
  /// Performs the following checks:
  /// - Removes all spaces and dashes
  /// - Ensures exactly 16 digits
  /// - Rejects all-zero card number (0000 0000 0000 0000)
  /// - Verifies only digits are present
  /// - Applies Luhn algorithm checksum validation
  ///
  /// Example valid formats (before normalization):
  /// - "6037991234567890"
  /// - "6037 9912 3456 7890"
  /// - "6037-9912-3456-7890"
  ///
  /// Returns `true` if the input passes all validations, `false` otherwise.
  static bool bankCardNO(String input) {
    // Remove spaces and dashes to normalize the input
    input = input.replaceAll(RegExp(r'[\s-]'), '');

    // Must be exactly 16 characters after normalization
    if (input.length != 16) return false;

    // Commonly used test/invalid all-zero card number
    if (input == "0000000000000000") return false;

    // Ensure the string contains only digits
    if (!RegExp(r'^\d{16}$').hasMatch(input)) {
      return false;
    }

    int sum = 0;
    bool shouldDouble = false;

    // Process digits from right to left (standard Luhn direction)
    for (int i = input.length - 1; i >= 0; i--) {
      int digit = int.parse(input[i]);

      // Double every second digit from the right
      if (shouldDouble) {
        digit *= 2;
        // If doubling results in two digits, subtract 9 (or sum the digits)
        if (digit > 9) {
          digit -= 9;
        }
      }

      sum += digit;
      // Toggle for next digit
      shouldDouble = !shouldDouble;
    }

    // Valid if total sum is divisible by 10
    return sum % 10 == 0;
  }
}
