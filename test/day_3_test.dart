import 'package:advent_of_code_2024/day_3.dart';
import 'package:test/test.dart';

void main() {
  test('Part 1 on input should return 161.', () {
    const input = 'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))';

    expect(
      part1(input),
      equals(161),
    );
  });

  test('Part 2 on input should return 48.', () {
    const input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))";

    expect(
      part2(input),
      equals(48),
    );
  });

  test("'mulOperationParser' should parse multiplication operations correctly.", () {
    final result = mulOperationParser.parse('mul(2,4)').value;
    expect(result, equals(8));
  });

  test("'corruptedOperationsParser' should parse corrupted operations correctly.", () {
    final result = corruptedOperationsParser.parse('xmul(2,3)10emul[10mul(4, 4)mul(3,4)x').value;
    expect(result, equals(18));
  });
}
