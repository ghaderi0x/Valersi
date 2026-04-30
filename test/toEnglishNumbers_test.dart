import 'package:test/test.dart';
import 'package:valersi/valersi.dart';

void main() {
  group('Valersi.toEnglishNumbers', () {
    test('converts Persian digits to English digits', () {
      expect(Valersi.toEnglishNumbers('۰۱۲۳۴۵۶۷۸۹'), '0123456789');
      expect(
          Valersi.toEnglishNumbers('قیمت: ۱۲,۵۰۰ تومان'), 'قیمت: 12,500 تومان');
      expect(Valersi.toEnglishNumbers('سال ۱۴۰۳'), 'سال 1403');
      expect(Valersi.toEnglishNumbers('0123456789'), '0123456789');
      expect(Valersi.toEnglishNumbers('Price: 12,500'), 'Price: 12,500');
    });

    test('handles mixed Persian + English digits', () {
      expect(Valersi.toEnglishNumbers('شماره: ۰۹۱۲-۱۲۳۴۵۶۷'),
          'شماره: 0912-1234567');
      expect(Valersi.toEnglishNumbers('۱۲3۴۵۶۷۸۹0'), '1234567890');
    });

    test('preserves all non-digit characters', () {
      expect(Valersi.toEnglishNumbers('سلام! @ #  % ^ & * ( ) _ +'),
          'سلام! @ #  % ^ & * ( ) _ +');
      expect(
          Valersi.toEnglishNumbers('تاریخ: ۱۴۰۳/۰۵/۱۵'), 'تاریخ: 1403/05/15');
    });

    test('handles empty string and whitespace', () {
      expect(Valersi.toEnglishNumbers(''), '');
      expect(Valersi.toEnglishNumbers('   '), '   ');
      expect(Valersi.toEnglishNumbers('\t\n\r'), '\t\n\r');
    });

    test('works with very long strings', () {
      final longPersian = '۰' * 500 + '۱۲۳۴۵۶۷۸۹';
      final expected = '0' * 500 + '123456789';
      expect(
        Valersi.toEnglishNumbers(longPersian),
        expected,
      );
    });
  });
}
