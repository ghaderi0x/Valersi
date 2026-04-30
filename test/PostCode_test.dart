import 'package:test/test.dart';
import 'package:valersi/valersi.dart';

void main() {
  group('Valersi.PostCode', () {
    test('returns true', () {
      expect(Valersi.postCode('7133134567'), isTrue);
      expect(Valersi.postCode('44131-44371'), isTrue);
      expect(Valersi.postCode('9133178901'), isTrue);
      expect(Valersi.postCode('16111 23456'), isTrue);
      expect(Valersi.postCode('16111-23456'), isTrue);
      expect(Valersi.postCode('649 41 000 00'), isTrue);
    });

    test('returns false', () {
      expect(Valersi.postCode('123456789'), isFalse);
      expect(Valersi.postCode('713313456'), isFalse);
      expect(Valersi.postCode('71331345677'), isFalse);
      expect(Valersi.postCode('0000000000'), isFalse);
    });
  });
}
