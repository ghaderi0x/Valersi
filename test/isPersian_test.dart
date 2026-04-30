import 'package:test/test.dart';
import 'package:valersi/valersi.dart';

void main() {
  group('Valersi.isPersian', () {
    test('returns true', () {
      expect(Valersi.isPersian('سلام'), isTrue);
      expect(Valersi.isPersian('ت س ت'), isTrue);
      expect(Valersi.isPersian('قادری'), isTrue);
      expect(Valersi.isPersian('گل'), isTrue);
      expect(Valersi.isPersian('برنامه نویس ۱'), isTrue);
      expect(Valersi.isPersian('۱۲۳۴۵۶۷'), isTrue);
      expect(Valersi.isPersian('م'), isTrue);
      expect(Valersi.isPersian('تست🚀'), isTrue);
    });

    test('returns false', () {
      expect(Valersi.isPersian('input'), isFalse);
      expect(Valersi.isPersian('Hello'), isFalse);
      expect(Valersi.isPersian('1234567'), isFalse);
      expect(Valersi.isPersian('i n p u t'), isFalse);
    });
  });
}
