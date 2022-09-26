import 'dart:math';

import 'package:flutter/material.dart';
class SearchApp extends StatelessWidget {
  // runApp(MaterialApp(
  //   home: SearchApp(),
  // ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search App"),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),
      drawer: Drawer(),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final List<String> _tags = [
    " Art. 05°, XXXVI CF",
    " contribuição social",
    " ato jurídico",
    " ato jurídico perfeito",
    " garantia constitucional",
    " direito fundamental",
    " validade",
    " FGTS",
    " lei complementar",
    " LC"
  ];

  final _recentTags = [
    " ato jurídico perfeito",
    " garantia constitucional",
    " direito fundamental",
    " validade",
    " FGTS",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
    ), onPressed: () {
      close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Card(
      color: Colors.yellow,
      shape: StadiumBorder(),
      child: Center(
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? _recentTags
        : _tags.where(
            (element) => element.startsWith(' $query')
    ).toList();

    return ListView.builder(itemBuilder: (context, index) => ListTile(
      onTap: () {
        query = suggestionList[index];
        showResults(context);
      },
      leading: Icon(
          Random.secure().nextInt(10) % 2 == 0 ?
          Icons.description_outlined
              : Icons.description),
      title: RichText(
        text: TextSpan(text: suggestionList[index].substring(0, query.length + 1),
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        children: [TextSpan(
          text: suggestionList[index].substring(query.length + 1),
          style: TextStyle(color: Colors.grey),
        )
        ]),
      ),
    ),
    itemCount: suggestionList.length,);
  }

}