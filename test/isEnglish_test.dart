import 'package:test/test.dart';
import 'package:valersi/valersi.dart';

void main() {
  group('Valersi.isEnglish', () {
    test('returns true', () {
      expect(Valersi.isEnglish('TestText'), isTrue);
      expect(Valersi.isEnglish('Test Text'), isTrue);
      expect(Valersi.isEnglish('Test Text 55'), isTrue);
      expect(Valersi.isEnglish('A'), isTrue);
      expect(Valersi.isEnglish('@A#%'), isTrue);
      expect(Valersi.isEnglish('Hi 😊'), isTrue);
      expect(Valersi.isEnglish('12345678'), isTrue);
    });

    test('returns false', () {
      expect(Valersi.isEnglish('سلام'), isFalse);
      expect(Valersi.isEnglish('你好世界'), isFalse);
      expect(Valersi.isEnglish(' '), isFalse);
      expect(Valersi.isEnglish('۱۲۳۴۵۶۷'), isFalse);
    });
  });
}
