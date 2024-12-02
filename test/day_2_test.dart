import 'package:advent_of_code_2024/day_2.dart';
import 'package:test/test.dart';

const input = '''
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
''';

void main() {
  test('Puzzle 1 on input should return 2.', () {
    expect(
      puzzle1(input),
      equals(2),
    );
  });

  test('Puzzle 2 on input should return 4.', () {
    expect(
      puzzle2(input),
      equals(4),
    );
  });

  group("'isReportValid'", () {
    test("'isReportValid' should receive at least two numbers.", () {
      expect(
        isReportValid([1, 2]),
        equals(-1),
      );

      expect(
        () => isReportValid([1]),
        throwsArgumentError,
      );

      expect(
        () => isReportValid([]),
        throwsArgumentError,
      );
    });
    test("'isReportValid' should return false if levels are not increasing/decreasing.", () {
      expect(
        isReportValid([1, 3, 2, 4, 5]),
        equals(1),
      );

      expect(
        isReportValid([1, 3, 2, 4, 5], enableProblemDampener: true),
        equals(-1),
      );
    });

    test("'isReportValid' should return false if levels increase or decrease by more than three.", () {
      expect(
        isReportValid([9, 7, 6, 2, 1]),
        equals(2),
      );

      expect(
        isReportValid([1, 2, 6, 7, 9]),
        equals(1),
      );
    });

    test("'isReportValid' should return false if levels increase or decrease by less than one.", () {
      expect(
        isReportValid([8, 6, 4, 4, 1]),
        equals(2),
      );

      expect(
        isReportValid([1, 4, 4, 6, 8]),
        equals(1),
      );

      expect(
        isReportValid([8, 6, 4, 4, 1], enableProblemDampener: true),
        equals(-1),
      );

      expect(
        isReportValid([1, 4, 4, 6, 8], enableProblemDampener: true),
        equals(-1),
      );
    });
  });
}
