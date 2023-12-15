import 'package:flutter/material.dart';
import 'package:single_app/ui/dimen/dimen.dart';
import 'package:single_app/ui/user_option.dart';

class UserOptions extends StatelessWidget {
  const UserOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        UserOption(
            svgPath: '',
            child: Icon(
              Icons.edit,
              size: 32,
            ),
            semanticLabel: ''),
        SizedBox(
          width: Dimen.spacingMedium,
        ),
        Padding(
          padding: EdgeInsets.only(top: 24),
          child: UserOption(
              svgPath: '',
              child: Icon(
                Icons.start,
                size: 32,
              ),
              semanticLabel: ''),
        ),
        SizedBox(
          width: Dimen.spacingMedium,
        ),
        UserOption(
            svgPath: '',
            child: Icon(
              Icons.photo,
              size: 32,
            ),
            semanticLabel: ''),
      ]),
    );
  }
}
