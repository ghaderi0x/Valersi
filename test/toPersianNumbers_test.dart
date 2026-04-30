import 'package:test/test.dart';
import 'package:valersi/valersi.dart';

void main() {
  group('Valersi.toPersianNumbers', () {
    test('converts English digits to Persian digits', () {
      expect(
        Valersi.toPersianNumbers('0123456789'),
        '۰۱۲۳۴۵۶۷۸۹',
      );

      expect(
        Valersi.toPersianNumbers('Price: 12,500 '),
        'Price: ۱۲,۵۰۰ ',
      );

      expect(
        Valersi.toPersianNumbers('Year 1403'),
        'Year ۱۴۰۳',
      );
    });

    test('leaves Persian digits unchanged', () {
      expect(
        Valersi.toPersianNumbers('۰۱۲۳۴۵۶۷۸۹'),
        '۰۱۲۳۴۵۶۷۸۹',
      );

      expect(
        Valersi.toPersianNumbers('قیمت: ۱۲,۵۰۰ تومان'),
        'قیمت: ۱۲,۵۰۰ تومان',
      );
    });

    test('handles mixed English + Persian digits', () {
      expect(
        Valersi.toPersianNumbers('0912-123 4567۰'),
        '۰۹۱۲-۱۲۳ ۴۵۶۷۰',
      );

      expect(
        Valersi.toPersianNumbers('12۳۴۵۶۷۸۹0'),
        '۱۲۳۴۵۶۷۸۹۰',
      );
    });

    test('preserves all non-digit characters', () {
      expect(
        Valersi.toPersianNumbers('Hello! @ #  % ^ & * ( ) _ +'),
        'Hello! @ #  % ^ & * ( ) _ +',
      );

      expect(
        Valersi.toPersianNumbers('تاریخ: 1403/05/15'),
        'تاریخ: ۱۴۰۳/۰۵/۱۵',
      );

      expect(
        Valersi.toPersianNumbers('email: test@domain.com'),
        'email: test@domain.com',
      );

      expect(
        Valersi.toPersianNumbers('سلام دنیا!'),
        'سلام دنیا!',
      );
    });

    test('handles empty string and whitespace', () {
      expect(Valersi.toPersianNumbers(''), '');
      expect(Valersi.toPersianNumbers('   '), '   ');
      expect(Valersi.toPersianNumbers('\t\n\r'), '\t\n\r');
    });

    test('works with very long strings', () {
      final longEnglish = '1' * 500 + '234567890';
      final expected = '۱' * 500 + '۲۳۴۵۶۷۸۹۰';

      expect(
        Valersi.toPersianNumbers(longEnglish),
        expected,
      );
    });

    test('does NOT convert other numeric scripts (e.g. Arabic-Indic)', () {
      expect(
        Valersi.toPersianNumbers('٠١٢٣٤٥٦٧٨٩'),
        '٠١٢٣٤٥٦٧٨٩',
      );
    });
  });
}
