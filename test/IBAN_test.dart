import 'package:test/test.dart';
import 'package:valersi/valersi.dart';

void main() {
  group('Valersi.IBAN', () {
    test('return true value', () {
      expect(Valersi.iban('930150000001351800087201'), isTrue);
      expect(Valersi.iban('890190000000104440444000'), isTrue);
      expect(Valersi.iban('950530000002400402064606'), isTrue);
      expect(Valersi.iban('180170000000205511280008'), isTrue);
    });

    test('returns false IBAN', () {
      expect(Valersi.iban('000000000000000000000000'), isFalse);
      expect(Valersi.iban('IR710570029971601460641001'), isFalse);
      expect(Valersi.iban('123456789012345678901234'), isFalse);
      expect(Valersi.iban('93015000000135180008720'), isFalse);
      expect(Valersi.iban('9301500000013518000872011'), isFalse);
    });
  });
}
