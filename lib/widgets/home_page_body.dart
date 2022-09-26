import 'package:flutter/material.dart';
import 'package:justicApp/app/docket_list_samples.dart';
import 'docket_row.dart';
import '../app/constants.dart';
import 'header_with_seachbox.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          SizedBox(height: kDefaultPadding),
          DocketRow(docket: dockets_samples[0],),
          DocketRow(docket: dockets_samples[1],),
          DocketRow(docket: dockets_samples[2],),
          DocketRow(docket: dockets_samples[0],),
          DocketRow(docket: dockets_samples[1],),
          DocketRow(docket: dockets_samples[2],),
        ],
      ),
    );
  }
}
