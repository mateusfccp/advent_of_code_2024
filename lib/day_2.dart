import 'dart:convert';

import 'package:advent_of_code_2024/src/parsers.dart';
import 'package:meta/meta.dart';

/// Solves the first part of day 2.
int part1(String input) => _solvePart(input);

/// Solves the first part of day 2.
int part2(String input) => _solvePart(input, enableProblemDampener: true);

int _solvePart(String input, {bool enableProblemDampener = false}) {
  final lines = LineSplitter.split(input);
  final reports = [
    for (final line in lines) //
      lineOfNumbersParser.parse(line).value,
  ];

  int valid = 0;

  for (final report in reports) {
    if (isReportValid(report, enableProblemDampener: enableProblemDampener) == -1) {
      valid++;
    }
  }

  return valid;
}

@visibleForTesting
int isReportValid(List<int> report, {bool enableProblemDampener = false}) {
  if (report.length < 2) throw ArgumentError('Report must have at least two numbers.');

  final iterator = report.iterator;

  iterator.moveNext();

  int index = 0;
  int current = iterator.current;
  int currentDifference = 0;

  while (iterator.moveNext()) {
    final next = iterator.current;
    final difference = current - next;
    bool shouldFail = false;

    if (currentDifference < 0 && difference > 0 || currentDifference > 0 && difference < 0) {
      shouldFail = true;
    }

    if (difference.abs() case < 1 || > 3) {
      shouldFail = true;
    }

    if (shouldFail && enableProblemDampener) {
      for (int i = 0; i < report.length; i++) {
        final impureReport = [...report]..removeAt(i);
        if (isReportValid(impureReport, enableProblemDampener: false) == -1) {
          shouldFail = false;
          break;
        }
      }
    }

    if (shouldFail) {
      return index;
    }

    current = next;
    currentDifference = difference;
    index++;
  }

  return -1;
}
