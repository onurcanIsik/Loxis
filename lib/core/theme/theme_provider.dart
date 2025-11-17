import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loxis/core/theme/theme.dart';

final themeProvider = Provider<ThemeData>((ref) {
  return LoxisTheme.dark;
});
