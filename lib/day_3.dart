import 'package:petitparser/petitparser.dart';

/// Solves the first part of day 3.
int part1(String input) => corruptedOperationsParser.parse(input).value;

/// Solves the first part of day 3.
int part2(String input) {
  return corruptedWithDontsParser.parse(input).value.whereType<int>().reduce((a, b) => a + b);
}

/// Parses a single operation.
final mulOperationParser = //
    (_integerParser.skip(before: string('mul('), after: char(',')) & _integerParser.skip(after: char(')'))) //
        .map((value) => (value[0] as int) * (value[1] as int));

final doOperationParser = string('do()');

final dontOperationParser = string("don't()");

final tokensParser = mulOperationParser | ignoredParser;

final ignoredParser = (dontOperationParser & doOperationParser.neg().star() & doOperationParser).flatten();

/// Parses a corrupted operation line.
final corruptedOperationsParser = TrimmingParser(
  mulOperationParser,
  mulOperationParser.neg(),
  mulOperationParser.neg(),
).star().map((value) => value.reduce((a, b) => a + b));

// TODO: maybe some day use petitparser to parse the whole thing.
final corruptedWithDontsParser = TrimmingParser(
  tokensParser,
  tokensParser.neg(),
  tokensParser.neg(),
).star();

/// Parses a single integer.
final _integerParser = digit().plus().flatten().map(int.parse);
