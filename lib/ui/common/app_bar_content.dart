import 'package:flutter/material.dart';
import 'package:single_app/ui/common/logo_white_text.dart';

class AppBarContent extends StatelessWidget {
  const AppBarContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LogoWhiteText(),
      ],
    );
  }
}
