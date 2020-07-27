

import 'package:newFirebase_Project/constant.dart';
import 'package:newFirebase_Project/provider/myProvider.dart';
import 'package:newFirebase_Project/ui/loginAndRegistar/widgets/registerWidgets/registarButton.dart';
import 'package:newFirebase_Project/ui/loginAndRegistar/widgets/registerWidgets/registerForm.dart';
import 'package:newFirebase_Project/ui/loginAndRegistar/widgets/welcomeBack.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: kAppBar(context, 'Register'),
      body: ModalProgressHUD(
        inAsyncCall:Provider.of<MyProvider>(context). spinner,
        child: Column(
          children: <Widget>[
            WelcomeBackText(),
            RegisterForm(),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: RegisterButton(),
            )
          ],
        ),
      ),
    );
  }
}
