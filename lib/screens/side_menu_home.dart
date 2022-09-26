import 'package:flutter/material.dart';
import 'package:justicApp/app/docket_list_samples.dart';
import 'package:justicApp/models/docket_model.dart';
import 'package:justicApp/repositories/docket_repository.dart';
import 'package:justicApp/widgets/home_page_body.dart';
import 'package:justicApp/widgets/side_menu.dart';

import '../app/constants.dart';

class SideMenuHomeScreen extends StatefulWidget {
  SideMenuHomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SideMenuHomeScreenState createState() => _SideMenuHomeScreenState();
}

class _SideMenuHomeScreenState extends State<SideMenuHomeScreen> {
  GlobalKey<ScaffoldState> _key = GlobalKey();

  List<Docket> _dockets = [];// dockets_samples;

  @override
  void initState() {
    super.initState();
  }

  bool isHomePageSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        //leading: _appBar(),
        //leading: _buildAppBar(),
        leading:  IconButton(
          icon: Icon(Icons.menu, color: Colors.white,),
          onPressed: () {
            _key.currentState.openDrawer();
          },
        ),
        //centerTitle: true,
        //title: Text('JusticApp'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: linearGrad,
          ),
        ),
        actions: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
              // child: CircleAvatar(
              //   backgroundImage: ExactAssetImage('assets/Bronze.jpg'),
              // ),
              child: IconButton(
                onPressed: () async {
                  DocketRepository repo = DocketRepository.initialize()..fetchDockets();
                  // print('Here');
                  // repo.entities.forEach((docket) {
                  //   print("Entities: ${docket.court}");
                  // });
                  _dockets = await repo.fetchDockets();
                  setState(() {
                  //  _dockets = repo.entities;
                   _dockets;
                  });
                },
                icon: Icon(
                    Icons.ad_units,
                    color: Colors.white,
                ),
              ),
              // decoration: new BoxDecoration(
              //   border: new Border.all(
              //     color: Colors.orange,
              //     width: 1.0,
              //   ),
              //   borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
              // )
          ),
        ],
      ),
      drawer: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35),
              bottomRight: Radius.circular(35)
          ),
          child: SideMenu(),
      ),
      body: HomePageBody(),
    );
  }

  // Widget _icon(IconData icon, {Color color = Colors.red}) {
  //   return Container(
  //     padding: EdgeInsets.all(10),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.all(Radius.circular(13)),
  //       gradient: linearGrad,
  //       //boxShadow: AppTheme.shadow
  //     ),
  //     child: InkWell(
  //       onTap: () {
  //         _key.currentState.openDrawer();
  //       },
  //       child: Icon(
  //         icon,
  //         color: color,
  //       ),
  //     ),
  //   );
  // }

  // AppBar _buildAppBar() {
  //   return AppBar(
  //     flexibleSpace: Container(
  //       decoration: BoxDecoration(
  //         gradient: linearGrad,
  //       ),
  //     ),
  //     elevation: 0,
  //     leading: IconButton(
  //       icon: Icon(Icons.menu, color: Colors.white,),
  //       onPressed: () {},
  //     ),
  //   );
  // }
  //
  // Widget _appBar() {
  //   return Container(
  //     //padding: AppTheme.padding,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: <Widget>[
  //         RotatedBox(
  //           quarterTurns: 4,
  //           child: _icon(Icons.menu,
  //               color: Colors.white),
  //         ),
  //         ClipRRect(
  //           borderRadius: BorderRadius.all(Radius.circular(13)),
  //           child: Container(
  //             decoration: BoxDecoration(
  //               //gradient: linearGrad,
  //               //color: Colors.red[800],//Theme.of(context).backgroundColor,
  //               boxShadow: <BoxShadow>[
  //                 BoxShadow(
  //                     color: Colors.red[800],//Color(0xfff8f8f8),
  //                     blurRadius: 10,
  //                     spreadRadius: 10),
  //               ],
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}