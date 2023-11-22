import 'package:flutter/material.dart';
import 'package:single_app/pages/user_page/user_view.dart';
class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UserPageState();
}

class _UserPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:_body(),
    );
  }

  Widget _body() {
    return UserView();
  }
}