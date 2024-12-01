/// Extension methods for the [int] class.
extension IntExtension on int {
  /// Returns the distance between this number and another number.
  int distanceTo(int other) {
    return (this - other).abs();
  }
}
