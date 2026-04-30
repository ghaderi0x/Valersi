import 'package:test/test.dart';
import 'package:valersi/valersi.dart';

void main() {
  group('Valersi.isSafe', () {
    test('rejects strings with multiple forbidden characters', () {
      expect(Valersi.isSafe('hello@world#test'), isFalse);
      expect(Valersi.isSafe('price 100 < 200'), isFalse);
      expect(Valersi.isSafe('select * from users'), isFalse);
      expect(Valersi.isSafe('John "Smith" <admin>'), isFalse);
      expect(Valersi.isSafe("O'Reilly"), isFalse);
    });

    test('behaves correctly with spaces and allowed special chars', () {
      expect(Valersi.isSafe('hello world'), isTrue);
      expect(Valersi.isSafe('user_name'), isTrue);
      expect(Valersi.isSafe('قیمت ۱۰۰۰ تومان'), isTrue);
      expect(Valersi.isSafe('hello.world'), isTrue);
      expect(Valersi.isSafe('hello+world'), isTrue);
      expect(Valersi.isSafe('hello/world'), isTrue);
    });

    test('forbidden substrings like "()" "[]" are detected', () {
      expect(Valersi.isSafe('function()'), isFalse);
      expect(Valersi.isSafe('array[]'), isFalse);
      expect(Valersi.isSafe('test () comment'), isFalse);
    });

    test('case sensitivity — all forbidden chars are literal', () {
      expect(Valersi.isSafe('HELLO@WORLD'), isFalse);
      expect(Valersi.isSafe('Hello WORLD'), isTrue);
    });

    test('very long input with forbidden char somewhere', () {
      final longSafe = 'a' * 500;
      expect(Valersi.isSafe(longSafe), isTrue);

      final longUnsafe = longSafe + '@';
      expect(Valersi.isSafe(longUnsafe), isFalse);
    });

    test('input with only forbidden characters', () {
      expect(Valersi.isSafe('@"#'), isFalse);
      expect(Valersi.isSafe("'<>()[]"), isFalse);
    });
  });
}
