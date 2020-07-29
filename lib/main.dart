import 'package:newFirebase_Project/auth.dart';
import 'package:newFirebase_Project/provider/db_provider.dart';
import 'package:newFirebase_Project/provider/myProvider.dart';
import 'package:newFirebase_Project/provider/order_provider.dart';
import 'package:newFirebase_Project/ui/admin/adminOrderScreen.dart';
import 'package:newFirebase_Project/ui/home/homeScreen.dart';
import 'package:newFirebase_Project/ui/choosePlant/screen/choosePlantScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/splash/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool check = await Auth.auth.getIsLogin();
 String userId = await Auth.auth.getUserId() ;
  print('userId = $userId' );
  Widget screen ;


  if(userId=='LaR7PFdnEQesbuDig6ZGDv7N18q1'){
   screen = AdminOrderScreen();
   print('Admin');
 }else{
    if (check == null || check == false) {
      screen = HomeScreen();
    } else {
      screen = ChoosePlantScreen();
    }
  }


  runApp(MyApp(screen));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget screen;

  MyApp(this.screen);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyProvider>(
          create: (context) => MyProvider(),
        ),
        ChangeNotifierProvider<DBProvider>(
          create: (context) => DBProvider(),
        ),
        ChangeNotifierProvider<OrderProvider>(
          create: (context) => OrderProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Splash(  screen ),
      ),
    );
  }
}
