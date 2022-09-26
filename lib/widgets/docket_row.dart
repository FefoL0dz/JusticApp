import 'package:flutter/material.dart';
import 'package:justicApp/app/constants.dart';
import 'package:justicApp/models/docket_model.dart';

class DocketRow extends StatelessWidget {

  final Docket docket;
  const DocketRow({Key key, this.docket}) : assert(docket != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('clicked at ${docket.toString()}');
      },
      child: new Container(
        height: 150.0,
        margin: new EdgeInsets.all(10.0),
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
            gradient: linearGrad,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 5,
              blurRadius: 8,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                child: new CircleAvatar(
                  radius: 35.0,
                  backgroundImage: NetworkImage('http://1.bp.blogspot.com/-UPLZE7d8dtI/UJ6XPf8zB3I/AAAAAAAAAGs/vZDkJepX7ow/s1600/S%25C3%25BAmula.jpg'),
                ),
            ),
            new Expanded(child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text('Súmula: ${docket.sv}', style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                new SizedBox(height: 8.0,),
                new Text(docket.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: false,
                  style: new TextStyle(fontSize: 12.0, color: Colors.white70),),
                new SizedBox(height: 10.0,),
                // new Row(children: <Widget>[
                //   new Column(children: <Widget>[
                //     new Text('2342', style: new TextStyle(fontSize: 12.0, color: Colors.white)),
                //     new Text('Popularity', style: new TextStyle(fontSize: 10.0, color: Colors.white)),
                //   ],),
                //   new Column(children: <Widget>[
                //     new Text('2342', style: new TextStyle(fontSize: 12.0, color: Colors.white)),
                //     new Text('Like', style: new TextStyle(fontSize: 10.0, color: Colors.white)),
                //   ],),
                //   new Column(children: <Widget>[
                //     new Text('2342', style: new TextStyle(fontSize: 12.0, color: Colors.white)),
                //     new Text('Followed', style: new TextStyle(fontSize: 10.0, color: Colors.white)),
                //   ],)
                // ],),
              ],
            ),
            ),
            new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(docket.court.toString(), style: new TextStyle(fontSize: 30.0, color: Colors.white70),),
                    new Text('tribunal', style: new TextStyle(fontSize: 14.0, color: Colors.white70),),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
