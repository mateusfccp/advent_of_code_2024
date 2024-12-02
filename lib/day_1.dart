import 'dart:convert';

import 'package:advent_of_code_2024/src/parsers.dart';
import 'package:meta/meta.dart';

import 'src/iterable.dart';
import 'src/num.dart';

/// Solves the first puzzle of day 1.
int puzzle1(String input) {
  final lists = parseInput(input);
  final first = [...lists.$1]..sort();
  final second = [...lists.$2]..sort();
  final pairs = zip2(first, second);

  int sum = 0;

  for (final pair in pairs) {
    final (a, b) = pair;
    sum = sum + a.distanceTo(b);
  }

  return sum;
}

/// Solves the second puzzle of day 1.
int puzzle2(String input) {
  final lists = parseInput(input);
  final iterator = lists.$1.iterator;

  int sum = 0;

  while (iterator.moveNext()) {
    final key = iterator.current;
    final count = lists.$2.count(key);

    sum = sum + key * count;
  }

  return sum;
}

@visibleForTesting
(List<int>, List<int>) parseInput(String input) {
  final firstColumn = <int>[];
  final secondColumn = <int>[];

  final lines = LineSplitter.split(input);
  for (final line in lines) {
    final [first, second] = lineOfNumbersParser.parse(line).value;

    firstColumn.add(first);
    secondColumn.add(second);
  }

  return (firstColumn, secondColumn);
}
