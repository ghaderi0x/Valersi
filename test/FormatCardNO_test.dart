import 'package:test/test.dart';
import 'package:valersi/valersi.dart';

void main() {
  group('Valersi.FormatCardNo', () {
    test('should format valid 16-digit number correctly', () {
      final result = Valersi.formatCardNo('4532789123456789');
      expect(result, '4532 7891 2345 6789');
    });

    test('should format 15-digit number (e.g. Amex style)', () {
      final result = Valersi.formatCardNo('378282246310005');
      expect(result, '3782 8224 6310 005');
    });

    test('should handle numbers with spaces already present', () {
      final result = Valersi.formatCardNo('4123 4567 8901 2345');
      expect(result, '4123 4567 8901 2345');
    });

    test('should handle numbers with dashes and other separators', () {
      final result = Valersi.formatCardNo('4123-4567-8901-2345');
      expect(result, '4123 4567 8901 2345');
    });

    test('should remove all non-digits (letters, symbols, etc.)', () {
      final result = Valersi.formatCardNo('4123-45ab-67cd-8901_!@#2345');
      expect(result, '4123 4567 8901 2345');
    });

    test('should handle short numbers (less than 4 digits)', () {
      expect(Valersi.formatCardNo('123'), '123');
      expect(Valersi.formatCardNo('12'), '12');
      expect(Valersi.formatCardNo('9'), '9');
    });

    test('should handle empty input', () {
      expect(Valersi.formatCardNo(''), '');
      expect(Valersi.formatCardNo('   '), '');
      expect(Valersi.formatCardNo('---'), '');
    });

    test('should handle very long input (more than 16 digits)', () {
      final result = Valersi.formatCardNo('123456789012345678901234');
      expect(result, '1234 5678 9012 3456 7890 1234');
    });

    test('should handle input with only non-digits', () {
      expect(Valersi.formatCardNo('abcd-efgh-ijkl'), '');
      expect(Valersi.formatCardNo('!!! *** +++'), '');
    });
  });
}
