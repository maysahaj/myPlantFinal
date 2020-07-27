import 'package:flutter/material.dart';
import 'package:newFirebase_Project/constant.dart';

class WelcomeBackText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Text(
        'Welcome back!',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 32.0,
          color: kPrimaryColor2,
        ),
      ),
    );
  }
}
