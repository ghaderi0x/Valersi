import 'package:test/test.dart';
import 'package:valersi/valersi.dart';

void main() {
  group('Valersi.NationalCode -  Check National ID ', () {
    test('True NationalCode', () {
      expect(Valersi.nationalCode('1653976772'), isTrue);
      expect(Valersi.nationalCode('8720001118'), isTrue);
      expect(Valersi.nationalCode('9417507941'), isTrue);
      expect(Valersi.nationalCode('7182672626'), isTrue);
      expect(Valersi.nationalCode('2000010008'), isTrue);
    });

    test('National codes with the wrong length should return false', () {
      expect(Valersi.nationalCode('123'), isFalse); // Too Short
      expect(Valersi.nationalCode('001234567'), isFalse); // 9 NO
      expect(Valersi.nationalCode('20000100088'), isFalse); // 11 NO
      expect(Valersi.nationalCode(''), isFalse); // Empty
    });

    test('Non-numeric input - Should return false', () {
      expect(Valersi.nationalCode('00123a5678'), isFalse);
      expect(Valersi.nationalCode('۱۲۳۴۵۶۷۸۹۰'), isFalse); // Persian Number
      expect(Valersi.nationalCode('0012-345678'), isFalse);
      expect(Valersi.nationalCode('abc'), isFalse);
      expect(Valersi.nationalCode('001234567 '), isFalse); // Space
    });

    test('Incorrect check digit should return false', () {
      expect(Valersi.nationalCode('1653976773'), isFalse);
      expect(Valersi.nationalCode('9788127012'), isFalse);
      expect(Valersi.nationalCode('0412157315'), isFalse);
    });
  });
}
