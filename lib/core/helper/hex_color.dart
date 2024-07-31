import 'dart:ui';

/// HexColor is a class that contains a method to convert hex color to color.
class HexColor extends Color {
  /// HexColor is a constructor that takes a hex color and converts it to color.
  HexColor(String? hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String? hexColor) {
    var varHex = hexColor ?? 'FF000000';
    varHex = varHex.toUpperCase().replaceAll('#', '');
    if (varHex.length == 6) {
      varHex = 'FF$varHex';
    }
    return int.parse(varHex, radix: 16);
  }
}
