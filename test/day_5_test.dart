import 'package:advent_of_code_2024/day_5.dart';
//import 'package:petitparser/src/debug/trace.dart';
import 'package:test/test.dart';

const input = '''
47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47
''';

const expectedBeforenessMap = {
  47: [53, 13, 61, 29],
  97: [13, 61, 47, 29, 53, 75],
  75: [29, 53, 47, 61, 13],
  61: [13, 53, 29],
  29: [13],
  53: [29, 13],
};

void main() {
  test('Part 1 on input should return 143.', () {
    expect(part1(input), equals(143));
  });

  test('Part 2 on input should return 123.', () {
    expect(part2(input), equals(123));
  });

  test(
    "'getUpdateFirstInvalidItem' should get the index of the first invalid item in an update based on a beforeness map.",
    () {
      expect(
        getUpdateFirstInvalidItem([75, 47, 61, 53, 29], expectedBeforenessMap),
        equals(null),
      );

      expect(
        getUpdateFirstInvalidItem([97, 13, 75, 29, 47], expectedBeforenessMap),
        equals(2),
      );
    },
  );

  test(
    "'rectifyUpdate' should properly reorder an update based on a beforeness map.",
    () {

      final case1 = [75, 97, 47, 61, 53];
      rectifyUpdate(case1, expectedBeforenessMap, start: 1);
      expect(
        case1,
        equals([97, 75, 47, 61, 53]),
      );

      final case2 = [61, 13, 29];
      rectifyUpdate(case2, expectedBeforenessMap, start: 1);
      expect(
        case2,
        equals([61, 29, 13]),
      );
      
      final case3 = [97, 13, 75, 29, 47];
      rectifyUpdate(case3, expectedBeforenessMap, start: 2);
      expect(
        case3,
        equals([97, 75, 47, 29, 13]),
      );
    },
  );

  test("'rulesParser' should properly parse a list of rules.", () {
    expect(
      rulesParser.parse(input).value,
      equals(expectedBeforenessMap),
    );
  });

  test("'ruleParser' should properly parse a rule line.", () {
    expect(
      ruleParser.parse('1|2').value,
      equals((1, 2)),
    );

    expect(
      ruleParser.parse('10|22').value,
      equals((10, 22)),
    );

    expect(
      () => ruleParser.parse('a|2').value,
      throwsException,
    );

    expect(
      () => ruleParser.parse('42').value,
      throwsException,
    );
  });

  test("'updateParser' should parse a line into a update list.", () {
    expect(
      updateParser.parse('1,2,3,4').value,
      equals([1, 2, 3, 4]),
    );

    expect(
      updateParser.parse('10,22,33,44').value,
      equals([10, 22, 33, 44]),
    );

    expect(
      () => updateParser.parse('a,2').value,
      throwsException,
    );

    expect(
      updateParser.parse('42').value,
      equals([42]),
    );
  });
}
