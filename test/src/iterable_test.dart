import 'package:advent_of_code_2024/src/iterable.dart';
import 'package:test/test.dart';

void main() {
  test(
    "'Iterable.count' should count the elements of an iterable.",
    () {
      expect(
        [1, 2, 3, 3, 3, 4].count(3),
        equals(3),
      );
      expect(
        [1, 2, 3, 3, 3, 4].count(4),
        equals(1),
      );
      expect(
        [1, 2, 3, 3, 3, 4].count(5),
        equals(0),
      );
    },
  );

  test("'zip2' should pair the contents of two iterables.", () {
    expect(
      zip2(
        [1, 2, 3, 3, 3, 4],
        [3, 3, 3, 4, 5, 9],
      ),
      equals([
        (1, 3),
        (2, 3),
        (3, 3),
        (3, 4),
        (3, 5),
        (4, 9),
      ]),
    );
  });
}
