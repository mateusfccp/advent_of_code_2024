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
  test('Part 1 on input should return 11.', () {
    expect(
      part1(input),
      equals(11),
    );
  });

  test('Part 2 on input should return 31.', () {
    expect(
      part2(input),
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
}
