

import 'package:book/bloc/pagecontrollerbloc.dart';
import 'package:book/theme/theme_provider.dart';
import 'package:book/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final themeProvider = Provider.of<PageControlProvider>(context);
    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<PageControlProvider>(context , listen: false);
        provider.togglemode(value);
      },
    );
  }
}