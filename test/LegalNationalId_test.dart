import 'package:test/test.dart';
import 'package:valersi/valersi.dart';

void main() {
  group('Valersi.LegalNationalId', () {
    test('returns true', () {
      expect(Valersi.legalNationID('14002022404'), isTrue);
      expect(Valersi.legalNationID('14001949338'), isTrue);
      expect(Valersi.legalNationID('10861677542'), isTrue);
      expect(Valersi.legalNationID('10100426424'), isTrue);
      expect(Valersi.legalNationID('14000290195'), isTrue);
    });

    test('returns false', () {
      expect(Valersi.legalNationID('14002022401'), isFalse);
      expect(Valersi.legalNationID('12345678901'), isFalse);
      expect(Valersi.legalNationID('00000000000'), isFalse);
      expect(Valersi.legalNationID('9999999999'), isFalse);
      expect(Valersi.legalNationID('1400202240'), isFalse);
      expect(Valersi.legalNationID('140020224041'), isFalse);
    });
  });
}
