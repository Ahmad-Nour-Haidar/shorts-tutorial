import 'package:flutter/material.dart';

extension on BuildContext {

  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;


  /// Returns The current [Locale] of the app as specified in the [Localizations] widget.
  Locale get locale => Localizations.localeOf(this);
}
