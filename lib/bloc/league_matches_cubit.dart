// States

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_football/models/match_league_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MatchesState extends Equatable {
  const MatchesState();

  @override
  List<Object?> get props => [];
}

class MatchesInitial extends MatchesState {}

class MatchesLoading extends MatchesState {}

class MatchesLoaded extends MatchesState {
  final List<MatchLeagueModel> matches;
  final String leagueId;
  final int round;

  const MatchesLoaded(this.matches, this.leagueId, this.round);

  @override
  List<Object?> get props => [matches, leagueId, round];
}

class MatchesError extends MatchesState {
  final String message;

  const MatchesError(this.message);

  @override
  List<Object?> get props => [message];
}

 // Cubit 

class MatchesCubit extends Cubit<MatchesState> {
  MatchesCubit() : super(MatchesInitial()) {
    getMatches('4328', 38);
  }

  final Map<String, Map<String, List<int>>> categories = {
    'English Premier League': {'4328': [38, 37, 36, 35,34,33]},
    'German Bundesliga': {'4331': [34, 32, 31, 30,29,28,]},
    'Italian Serie A': {'4332': [38, 37, 36, 35,34,33]},
    'Spanish La Liga': {'4335': [38, 37, 36, 35,34,33]},
    'French Ligue 1': {'4334': [38, 37, 36, 35,34,33]},    
    'Liga Portugal': {'4344': [34,33 ,32, 31, 30,29,]},
    'Belgian Pro League': {'4338': [ 30,29,28,27,26,25]},
    'Dutch Eredivisie': {'4337': [34, 33,32, 31, 30,29,]},
    'Turkish Super Lig': {'4339': [38, 37, 36, 35,34,33]},
    'Danish Superliga': {'4340': [22,21,20,19,18,17]},
    'Scottish Premiership': {'4330': [33,32,31,30,29,28]},
  };

  Future<void> getMatches(String leagueId, int round) async {
    emit(MatchesLoading());
    try {
      final dio = Dio();
      Response response = await dio.get(
          'https://www.thesportsdb.com/api/v1/json/3/eventsround.php?id=$leagueId&r=$round&s=2023-2024');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> jsonLeagueMatches = jsonData['events'];

      List<MatchLeagueModel> leagueMatches = [];
      for (var element in jsonLeagueMatches) {
        leagueMatches.add(MatchLeagueModel.fromJson(element));
      }

      emit(MatchesLoaded(leagueMatches, leagueId, round));
    } catch (e) {
      emit(const MatchesError('Failed to load matches'));
    }
  }

  void updateLeague(String leagueName) {
    final leagueId = categories[leagueName]?.keys.first;
    final round = categories[leagueName]?.values.first.first;
    if (leagueId != null && round != null) {
      getMatches(leagueId, round);
    }
  }

  void updateRound(String leagueId, int round) {
    getMatches(leagueId, round);
  }
}
