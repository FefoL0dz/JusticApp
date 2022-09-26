import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:justicApp/models/docket_model.dart';

const resource = 'assets/sumulas.json';
class DocketRepository {

  static DocketRepository initialize() {
    return new DocketRepository()
      .._populateRepository();
  }

  List<Docket> _dockets;
  List<Docket> get entities => _dockets;

  DocketRepository() {
    _dockets = new List<Docket>();
  }

  Future<List<Docket>> fetchDockets() async {
    final body = await rootBundle
        .loadString(resource);
    return parseDockets(body);
  }
  
  List<Docket> parseDockets(String body) {
    final parsed = jsonDecode(body).cast<Map<String, dynamic>>();
    _dockets = parsed.map<Docket>((json) => Docket.fromJson(json)).toList();
    return _dockets;
  }

  void _populateRepository() async {
    _dockets = await fetchDockets();
  }
}