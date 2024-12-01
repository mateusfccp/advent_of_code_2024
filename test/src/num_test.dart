import 'package:advent_of_code_2024/src/num.dart';
import 'package:test/test.dart';

void main() {
  test("'int.distanceTo' should compute the absolute difference between two integers", () {
    expect(
      1.distanceTo(4),
      equals(3),
    );

    expect(
      4.distanceTo(1),
      equals(3),
    );
  });
}
