import 'dart:io';

import 'package:advent_of_code_2024/day_1.dart' as day_1;
import 'package:advent_of_code_2024/day_2.dart' as day_2;
import 'package:advent_of_code_2024/day_3.dart' as day_3;
import 'package:advent_of_code_2024/day_4.dart' as day_4;
import 'package:advent_of_code_2024/day_5.dart' as day_5;

/// A function that solves a part given an input.
typedef PuzzleSolver<T> = T Function(String input);

void main(List<String> arguments) async {
  final String dataDirectory;

  if (arguments.length == 1) {
    dataDirectory = arguments[0];
  } else {
    throw ArgumentError('Expected one argument: the data directory.');
  }

  stdout.writeln('***** Advent of Code 2024 *****\n');

  stdout.writeln('Solving challenges from $dataDirectory...\n');

  Future<void> solveDay<T>(int day, int partNumber, PuzzleSolver<T> solver) async {
    final input = await File('$dataDirectory/day_$day').readAsString();
    final result = solver(input);
    stdout.writeln('Day $day, part $partNumber: $result');
  }

  // Day 1
  await solveDay(1, 1, day_1.part1);
  await solveDay(1, 2, day_1.part2);

  // Day 2
  await solveDay(2, 1, day_2.part1);
  await solveDay(2, 2, day_2.part2);

  // Day 3
  await solveDay(3, 1, day_3.part1);
  await solveDay(3, 2, day_3.part2);

  // Day 4
  await solveDay(4, 1, day_4.part1);
  await solveDay(4, 2, day_4.part2);

  // Day 5
  await solveDay(5, 1, day_5.part1);
  await solveDay(5, 2, day_5.part2);
}
