import 'package:advent_of_code_2024/day_1.dart';
import 'package:test/test.dart';

const input = '''
3   4
4   3
2   5
1   3
3   9
3   3
''';

void main() {
  test('Puzzle 1 on input should return 11.', () {
    expect(
      puzzle1(input),
      equals(11),
    );
  });

  test('Puzzle 2 on input should return 31.', () {
    expect(
      puzzle2(input),
      equals(31),
    );
  });

  test("'parseInput' should parse an input and return two lists of the parsed input.", () {
    final (first, second) = parseInput(input);
    expect(
      first,
      [3, 4, 2, 1, 3, 3],
    );

    expect(
      second,
      [4, 3, 5, 3, 9, 3],
    );
  });

  test("'numberParser' should parse an integer with any size.", () {
    expect(
      numberParser.parse('123').value,
      equals(123),
    );
    expect(
      numberParser.parse('1234567890').value,
      equals(1234567890),
    );
    expect(
      () => numberParser.parse('a').value,
      throwsException,
    );
  });

  test("'lineParser' should parse an input line with at most two integers.", () {
    expect(
      lineParser.parse('1 2').value,
      equals((1, 2)),
    );
    expect(
      lineParser.parse('123  456').value,
      equals((123, 456)),
    );
    expect(() => lineParser.parse('1 4 3').value, throwsException);
    expect(
      () => lineParser.parse('1 a').value,
      throwsException,
    );
  });
}
