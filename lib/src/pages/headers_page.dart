import 'package:disenios/src/theme/theme.dart';
import 'package:disenios/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final accentColor = Provider.of<ThemeChanger>(context).currentTheme.accentColor;

    return Scaffold(
      body: HeaderWaveGradient()
    );
  }
}

