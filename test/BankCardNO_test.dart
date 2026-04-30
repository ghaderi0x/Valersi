import 'package:test/test.dart';
import 'package:valersi/valersi.dart';

void main() {
  group('Bank Card Number - Check BankNO', () {
    test('True Card Number', () {
      expect(Valersi.bankCardNO('5029387020000656'), isTrue);
      expect(Valersi.bankCardNO('6037991199500590'), isTrue);
      expect(Valersi.bankCardNO('5022297000154406'), isTrue);
    });

    test('False Card Number', () {
      expect(Valersi.bankCardNO('6037991820304050'), isFalse);
      expect(Valersi.bankCardNO('0000000000000000'), isFalse);
      expect(Valersi.bankCardNO('5029387020305965'), isFalse);
      expect(Valersi.bankCardNO('6037991199599599'), isFalse);
    });

    test('Wrong length ', () {
      expect(Valersi.bankCardNO('123'), isFalse);
      expect(Valersi.bankCardNO('60379911995005901'), isFalse);
      expect(Valersi.bankCardNO('603799119950059'), isFalse);
      expect(Valersi.bankCardNO(""), isFalse);
    });

    test('Non-numeric input', () {
      expect(Valersi.bankCardNO('6037991a20304050'), isFalse);
      expect(Valersi.bankCardNO('۷۴۶۵۴۰۰۶۱۲۱۹۶۲۷۴'), isFalse);
      expect(Valersi.bankCardNO('5029-3870-2000-0656'), isTrue);
      expect(Valersi.bankCardNO('abc'), isFalse);
      expect(Valersi.bankCardNO('50293870200 00656 '), isTrue);
    });
  });
}
