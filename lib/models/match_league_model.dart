class MatchLeagueModel {
  final String teamhomeImg;
  final String teamHomeName;
  final String teamHomeScore;
  final String teamAwayImg;
  final String teamAwayName;
  final String teamAwayScore;
  final String stadium;
  final String country;
  final String date;

  MatchLeagueModel(
      {required this.teamhomeImg,
      required this.teamHomeName,
      required this.teamHomeScore,
      required this.teamAwayImg,
      required this.teamAwayName,
      required this.teamAwayScore,
      required this.stadium,
      required this.country,
      required this.date});

  factory MatchLeagueModel.fromJson(json) {
    return MatchLeagueModel(
        teamhomeImg: json['strHomeTeamBadge'],
        teamHomeName: json['strHomeTeam'],
        teamHomeScore: json['intHomeScore'],
        teamAwayImg: json['strAwayTeamBadge'],
        teamAwayName: json['strAwayTeam'],
        teamAwayScore: json['intAwayScore'],
        stadium: json['strVenue'],
        country: json['strCountry'],
        date: json['dateEvent']);
  }
}
