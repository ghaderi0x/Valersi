import 'package:test/test.dart';
import 'package:valersi/valersi.dart';

void main() {
  group('Valersi.email', () {
    test('returns true email address', () {
      expect(Valersi.email('input@gmail.com'), isTrue);
      expect(Valersi.email('ghaderi.dev404@gmail.com'), isTrue);
      expect(Valersi.email('support@gmail.com'), isTrue);
    });

    test('returns false', () {
      expect(Valersi.email('input@temp.mail'), isFalse);
      expect(Valersi.email('inp=ut@gmail.com'), isFalse);
      expect(Valersi.email('00@gmil.com'), isFalse);
    });
  });
}
