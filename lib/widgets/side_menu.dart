import 'package:flutter/material.dart';
import 'file:///C:/Users/felip/Desktop/justicApp/lib/app/constants.dart';
//import 'package:wave_drawer/wave_drawer.dart';
//TODO: implement sidebar
//Side bar to my apps with stack
class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // Set the transparency here
        canvasColor: Colors.transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
      ),
      child: Drawer(
        // backgroundColor: Colors.white,
        // boundaryColor: Colors.red[200],
        // boundaryWidth: 2.0,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              ClipRRect(
                // borderRadius: BorderRadius.only(
                //     bottomRight: Radius.circular(60)
                // ),
                child: DrawerHeader(
                  child: Text('Drawer Header'),
                  decoration: BoxDecoration(
                    gradient: linearGrad,
                    //color: Theme.of(context).primaryColor,
                    //backgroundBlendMode: BlendMode.darken,
                  ),
                ),
              ),
              ListTile(
               title: Text('Item 1', style: TextStyle(color: Colors.white, fontSize: 18),),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2', style: TextStyle(color: Colors.white, fontSize: 18),),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
      ),
    );
  }
}
