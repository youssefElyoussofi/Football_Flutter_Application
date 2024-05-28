class LeagueTableModel {
  final String teamId;
  final String teamName;
  final String teamIntRank;
  final String teamIntWin;
  final String teamIntLose;
  final String teamIntDraw;
  final String teamIntPts;
  final String teamImg;

  LeagueTableModel(
      {required this.teamId,
      required this.teamName,
      required this.teamImg,
      required this.teamIntRank,
      required this.teamIntWin,
      required this.teamIntLose,
      required this.teamIntDraw,
      required this.teamIntPts});

  factory LeagueTableModel.fromJson(json) {
    return LeagueTableModel(
        teamImg: json['strTeamBadge'],
        teamId: json['idTeam'],
        teamName: json['strTeam'],
        teamIntRank: json['intRank'],
        teamIntWin: json['intWin'],
        teamIntLose: json['intLoss'],
        teamIntDraw: json['intDraw'],
        teamIntPts: json['intPoints']);
  }
}
