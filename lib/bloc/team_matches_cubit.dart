


import 'package:dio/dio.dart';
import 'package:flutter_application_football/models/match_team_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamLastMStates{}

class InitialState extends TeamLastMStates{
  
}
class LoadingState extends TeamLastMStates{

  
}
class FailedState extends TeamLastMStates{
  final String error;

  FailedState({required this.error});
  
}
class MatchesTeamState extends TeamLastMStates{
  final List<MatchTeamModel> matches;

  MatchesTeamState({required this.matches});
  
}


class TeamLastMatchesCubit extends  Cubit<TeamLastMStates> {
  TeamLastMatchesCubit() : super(InitialState()){
    getTeamLastMatches('133613');
  }


  getTeamLastMatches(String teamID) async {
    emit(LoadingState());
    try {
  final dio = Dio();
  Response response = await dio.get('https://www.thesportsdb.com/api/v1/json/3/eventslast.php?id=$teamID');
  Map<String,dynamic> data = response.data;
  
  List<dynamic> dataMatches = data["results"];
  List<MatchTeamModel> matches = [];
  for (var element in dataMatches) {
    matches.add(MatchTeamModel.fromJson(element));
  }
  emit(MatchesTeamState(matches: matches));
} catch (e) {
  emit(FailedState(error: e.toString()));
}
  }


}

