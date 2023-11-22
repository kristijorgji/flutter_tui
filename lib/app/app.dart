import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:single_app/pages/home_page.dart';
import 'package:single_app/ui/app_colors.dart';
import 'package:single_app/ui/dimen/dimen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _buildThemeData(),
      home: const HomePage(),
    );
  }

  ThemeData _buildThemeData() {
    final base = ThemeData.light();
    return base.copyWith(
      appBarTheme: base.appBarTheme.copyWith(
        color: AppColors.Black,
      ),
      // accentColor: AppColors.Primary,
      textTheme: _buildTextTheme(base.textTheme),
    );
  }

  TextTheme _buildTextTheme(TextTheme base) {
    return GoogleFonts.poppinsTextTheme(base.copyWith(
      bodyText1: base.bodyText1!.copyWith(
        fontSize: Dimen.body2Text,
        height: 1.5,
        fontWeight: FontWeight.w400,
      ),
    ));
  }
}
