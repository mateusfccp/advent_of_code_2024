import 'package:advent_of_code_2024/day_4.dart';
import 'package:test/test.dart';

const input = '''
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
''';

void main() {
  test('Puzzle 1 on input should return 18.', () {
    expect(puzzle1(input), equals(18));
  });

  test('Puzzle 2 on input should return .', () {
    expect(puzzle2(input), equals(9));
  });

  test(
    "'countGenerally' should count the number of occurrences of a given sequence inside other",
    () {
      final pattern = 'XMAS'.codeUnits;

      expect(
        countMatches('MSAMXMSMSA'.codeUnits, pattern),
        equals(0),
      );

      expect(
        countMatches('MMMSXXMASM'.codeUnits, pattern),
        equals(1),
      );

      expect(
        countMatches('XXMASXMASX'.codeUnits, pattern),
        equals(2),
      );
    },
  );
}
