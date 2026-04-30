import 'package:test/test.dart';
import 'package:valersi/valersi.dart';

void main() {
  group('Valersi.UUID', () {
    test('rejects empty string', () {
      expect(Valersi.uuid(''), false);
      expect(Valersi.uuidv4(''), false);
    });

    test('rejects invalid lengths', () {
      expect(Valersi.uuid('123e4567-e89b-12d3-a456-42661417400'), false);
      expect(Valersi.uuid('123e4567e89b12d3a4564266141740000'), false);
      expect(Valersi.uuid('123e4567-e89b-12d3-a456-42661417400g'), false);
    });

    test('accepts valid 36-char format (with hyphens)', () {
      expect(Valersi.uuid('123e4567-e89b-12d3-a456-426614174000'), true);
      expect(Valersi.uuid('550e8400-e29b-41d4-a716-446655440000'), true);
      expect(Valersi.uuid('6ba7b810-9dad-11d1-80b4-00c04fd430c8'), true);
    });

    test('accepts valid 32-char format (without hyphens)', () {
      expect(Valersi.uuid('123e4567e89b12d3a456426614174000'), true);
      expect(Valersi.uuid('550e8400e29b41d4a716446655440000'), true);
    });

    test('rejects invalid version (only 1–5 allowed)', () {
      expect(Valersi.uuid('123e4567-e89b-62d3-a456-426614174000'), false);
      expect(Valersi.uuid('123e4567-e89b-02d3-a456-426614174000'), false);
      expect(Valersi.uuid('123e4567-e89b-f2d3-a456-426614174000'), false);
    });

    test('rejects invalid variant (only 8,9,a,b allowed in position 16)', () {
      expect(Valersi.uuid('123e4567-e89b-12d3-7566-426614174000'), false);
      expect(Valersi.uuid('123e4567-e89b-12d3-c566-426614174000'), false);
      expect(Valersi.uuid('123e4567-e89b-12d3-d566-426614174000'), false);
      expect(Valersi.uuid('123e4567-e89b-12d3-e566-426614174000'), false);
      expect(Valersi.uuid('123e4567-e89b-12d3-f566-426614174000'), false);
    });

    test('accepts RFC 4122 variant (8,9,a,b) in various forms', () {
      expect(Valersi.uuid('123e4567-e89b-12d3-8566-426614174000'), true);
      expect(Valersi.uuid('123e4567-e89b-12d3-9566-426614174000'), true);
      expect(Valersi.uuid('123e4567-e89b-12d3-a566-426614174000'), true);
      expect(Valersi.uuid('123e4567-e89b-12d3-b566-426614174000'), true);
    });

    test('is case-insensitive for hex digits', () {
      expect(Valersi.uuid('123E4567-E89B-12D3-A456-426614174000'), true);
      expect(Valersi.uuid('550e8400E29b41d4A716446655440000'), true);
    });

    test('rejects invalid hex characters', () {
      expect(Valersi.uuid('123e4567-e89b-12d3-a456-42661417400g'), false);
      expect(Valersi.uuid('123e4567-e89b-12d3-a456-426614174zz0'), false);
    });

    test('rejects malformed hyphen positions (36-char only)', () {
      expect(Valersi.uuid('123e4567e89b-12d3-a456-426614174000'), false);
      expect(Valersi.uuid('123e4567-e89b12d3-a456-426614174000'), false);
    });
  });

  group('isValidUUID.isValidV4', () {
    test('returns false if basic UUID is invalid', () {
      expect(Valersi.uuidv4(''), false);
      expect(Valersi.uuidv4('not-a-uuid'), false);
    });

    test('accepts valid version 4 UUIDs', () {
      expect(Valersi.uuidv4('123e4567-e89b-4fd3-a456-426614174000'), true);
      expect(Valersi.uuidv4('550e8400-e29b-41d4-a716-446655440000'), true);
      expect(Valersi.uuidv4('6ba7b810-9dad-41d1-80b4-00c04fd430c8'), true);
    });

    test('rejects non-v4 UUIDs even if otherwise valid', () {
      expect(Valersi.uuidv4('123e4567-e89b-12d3-a456-426614174000'), false);
      expect(Valersi.uuidv4('123e4567-e89b-32d3-a456-426614174000'), false);
      expect(Valersi.uuidv4('123e4567-e89b-52d3-a456-426614174000'), false);
    });

    test('works with hyphen-less format too', () {
      expect(Valersi.uuidv4('123e4567e89b4fd3a456426614174000'), true);
      expect(Valersi.uuidv4('550e8400e29b41d4a716446655440000'), true);
      expect(Valersi.uuidv4('123e4567e89b12d3a456426614174000'), false);
    });
  });
}
