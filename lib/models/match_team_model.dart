

class MatchTeamModel{
  
  final String leagueTitle;
  final String matchTitle;
  final String homeTeamScore;
  final String awayTeamScore;
  final String image;
  final String stadium;
  final String country;
  final String matchDate;

  MatchTeamModel({required this.leagueTitle, required this.matchTitle, required this.homeTeamScore, required this.awayTeamScore, required this.image, required this.stadium, required this.country, required this.matchDate});

  factory MatchTeamModel.fromJson(json){
    return MatchTeamModel(leagueTitle: json["strLeague"], matchTitle: json["strEvent"], homeTeamScore: json["intHomeScore"], awayTeamScore: json["intAwayScore"], image: json["strThumb"], stadium: json["strVenue"], country: json["strCountry"], matchDate: json["dateEvent"]);
  }

  
}