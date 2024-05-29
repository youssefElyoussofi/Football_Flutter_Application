import 'dart:convert';

import 'package:flutter_application_football/models/league_table_model.dart';
import 'package:http/http.dart' as http;

class ServiceApi{

  

  Future<List<LeagueTableModel>> getLeagueTable(String url) async {

    http.Response response = await http.get(Uri.https(url));
    if (response.statusCode == 200){
      Map<String,dynamic> data = jsonDecode(response.body);

      List<dynamic> leagueData = data['table'];

      List<LeagueTableModel> leagueTableList = [];

      for (var element in leagueData) {
        leagueTableList.add(LeagueTableModel.fromJson(element));
        
      }
      return leagueTableList;


      
    }else{
      throw Exception("there is error on status code ${response.statusCode}");
    }

  }

}

