import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  Size get size => mediaQuery.size;

  double height(double value) => mediaQuery.size.height * value;

  double width(double value) => mediaQuery.size.width * value;
}
