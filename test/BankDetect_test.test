import 'package:test/test.dart';
import 'package:valersi/valersi.dart';

void main() {
  group('Valersi.BankDetect', () {
    test('returns correct bank name for valid Card Number OR Sheba Number', () {
      expect(Valersi.bankDetect('6037991199500590'), 'ملی ایران'); //Card Number
      expect(Valersi.bankDetect('180170000000205511280008'),
          'ملی ایران'); // Sheba Number
      expect(Valersi.bankDetect('890190000000104440444000'), 'صادرات');
      expect(Valersi.bankDetect('5022297000154406'), 'پاسارگاد');
      expect(Valersi.bankDetect('5022-2970-0015-4406'), 'پاسارگاد');
      expect(Valersi.bankDetect('890190000000 104440444000 '), 'صادرات');
    });

    test('returns -Unknown Bank- for undefined Card Number OR Sheba Number',
        () {
      expect(Valersi.bankDetect('1234297000154406'), 'Unknown Bank');
      expect(Valersi.bankDetect('123450000000205511280008'), 'Unknown Bank');
      expect(Valersi.bankDetect('0000000000000000'), 'Unknown Bank');
    });

    test('returns unvalid for unvalid Card Numbers OR Sheba Number', () {
      expect(Valersi.bankDetect('1234'), 'Invalid');
      expect(Valersi.bankDetect('60379911995005900'), 'Invalid');
      expect(Valersi.bankDetect('603799119950059'), 'Invalid');
      expect(Valersi.bankDetect(''), 'Invalid');
    });
  });
}
