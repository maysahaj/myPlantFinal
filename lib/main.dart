

import 'package:flutter/material.dart';
import 'package:newFirebase_Project/features/admin/UI/admin_home.dart';
import 'package:provider/provider.dart';
import 'features/admin/providers/adminProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<AdminProvider>(
          create: (context) {
            return AdminProvider();
          },
        ),
 
     
      ],
      child: MaterialApp(
        title:'plantApp',
        home:AdminHome()

        )
      
      
    );
  }
}
