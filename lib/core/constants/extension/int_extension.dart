/// Extension for int.
extension IntExtension on int {
  /// This method is used to convert int to formatted string.
  /// Example: 10000.toFormattedString() => 10,000
  String toFormattedString() {
    return toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (Match match) => ',',
    );
  }
}
