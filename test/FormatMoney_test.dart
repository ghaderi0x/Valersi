
import 'package:test/test.dart';
import 'package:valersi/valersi.dart';

void main() {
  group('Valersi.FoematMoney', () {
    test('formats standard integer with commas', () {
      expect(Valersi.formatMoney('1234567'), '1,234,567');
      expect(Valersi.formatMoney('1000'), '1,000');
      expect(Valersi.formatMoney('999'), '999');
      expect(Valersi.formatMoney('1000000'), '1,000,000');
    });

    test('formats very large numbers correctly', () {
      expect(
        Valersi.formatMoney('123456789012345'),
        '123,456,789,012,345',
      );
    });

    test('supports Persian/Arabic numerals (Farsi digits)', () {
      expect(Valersi.formatMoney('۱۲۳۴۵۶۷'), '۱,۲۳۴,۵۶۷');
      expect(Valersi.formatMoney('۱۲۳۴'), '۱,۲۳۴');
    });

    test('returns "0" for empty or invalid input', () {
      expect(Valersi.formatMoney(''), '0');
      expect(Valersi.formatMoney('   '), '0');
      expect(Valersi.formatMoney('-'), '0');
      expect(Valersi.formatMoney('abc'), '0');
      expect(Valersi.formatMoney('€¥£'), '0');
      expect(Valersi.formatMoney('....'), '0');
    });

    test('handles leading/trailing garbage', () {
      expect(Valersi.formatMoney('   123456   '), '123,456');
      expect(Valersi.formatMoney('**1,234**'), '1,234');
    });

    test('single digit or very small numbers', () {
      expect(Valersi.formatMoney('0'), '0');
      expect(Valersi.formatMoney('5'), '5');
      expect(Valersi.formatMoney('42'), '42');
    });
  });
}
