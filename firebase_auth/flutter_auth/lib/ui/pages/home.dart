import 'package:flutter/material.dart';
import '../../model/user_repository.dart';
import 'package:provider/provider.dart';
import './splash.dart';
import './login.dart';
import './user_info.dart';

class AuthHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UserRepository user, _) {
        switch (user.status) {
          case Status.Uninitialized:
            return Splash();
          case Status.Unauthenticated:
          case Status.Authenticating:
            return LoginPage();
          case Status.Authenticated:
            return UserInfoPage(user: user.user);
        }
      },
    );
  }
}