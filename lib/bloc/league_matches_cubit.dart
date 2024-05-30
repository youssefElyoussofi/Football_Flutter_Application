

import 'package:equatable/equatable.dart';
import 'package:flutter_application_football/models/match_league_model.dart';

class LeagueMatchState extends Equatable{

    final List<String> categories; 
    final String categorySelected;
    final List<MatchLeagueModel> matchesLeague; 
    final bool isLoading;
    final String error;

  const LeagueMatchState({required this.categories, required this.categorySelected, required this.matchesLeague, required this.isLoading, required this.error});
  @override
 
  List<Object?> get props => [categories,categorySelected,isLoading,error];

}

class InitialState extends LeagueMatchState{
  InitialState():super(categories: [],categorySelected: '',error: '',isLoading: false,matchesLeague:[] );
}