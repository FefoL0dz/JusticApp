import 'package:flutter/material.dart';
import 'package:justicApp/screens/side_menu_home.dart';

import 'constants.dart';

class BindingEffectDocketApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true, //TODO: Should be removed
      title: 'Binding Effect Docket App',
      theme: ThemeData(
        cursorColor: Colors.grey[700],
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,),
      home: SideMenuHomeScreen(),
    );
  }
}