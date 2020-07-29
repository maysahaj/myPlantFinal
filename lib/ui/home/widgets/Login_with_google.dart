
import 'package:newFirebase_Project/auth.dart';
import 'package:newFirebase_Project/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newFirebase_Project/provider/myProvider.dart';
import 'package:newFirebase_Project/ui/choosePlant/screen/choosePlantScreen.dart';
import 'package:provider/provider.dart';


class LoginGoogle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: FlatButton(
        color:kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36.0),
        ),
        onPressed: () async{
         Provider.of<MyProvider>(context,listen: false).toggleSpinner();

          try{

            final result =  await Auth.auth.loginUsingGoogle() ;
            print('$result 2222');
            result?
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => ChoosePlantScreen(),
            ),
            ):print('snackBar');
            Provider.of<MyProvider>(context,listen: false).toggleSpinner();

          }catch(e){
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor:Colors.black,
                content: Row(
                  children: <Widget>[
                    Text(
                      'Not connected to the internet',
                      style: TextStyle(color: kPrimaryColor2, fontSize: 18),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.signal_wifi_off,color:kPrimaryColor2 ,)
                  ],
                ),
              ),
            ) ;
            Provider.of<MyProvider>(context,listen: false).toggleSpinner();

          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(FontAwesomeIcons.google,color: Colors.white,),
              SizedBox(width: 15,),
              Text(
                'Connect with Gmail',
                style: TextStyle(
                  color: kBackgroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
