import 'package:flutter/material.dart';

/// ThemeGetterExtension is an extension class that contains theme getter.
/// for example Navigator.of(context).theme instead of context.theme
extension ThemeGetterExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
