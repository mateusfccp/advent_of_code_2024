import 'package:advent_of_code_2024/src/parsers.dart';
import 'package:test/test.dart';

void main() {
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

  test("'lineOfNumbersParser' should parse an input line with one or more integers.", () {
    expect(
      () => lineOfNumbersParser.parse(' ').value,
      throwsException,
    );
    expect(
      lineOfNumbersParser.parse('1 2').value,
      equals([1, 2]),
    );
    expect(
      lineOfNumbersParser.parse('123  456').value,
      equals([123, 456]),
    );
    expect(
      lineOfNumbersParser.parse('1 4 3').value,
      [1, 4, 3],
    );
    expect(
      () => lineOfNumbersParser.parse('1 a').value,
      throwsException,
    );
  });
}
