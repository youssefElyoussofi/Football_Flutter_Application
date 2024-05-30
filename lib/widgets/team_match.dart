
import 'package:flutter/material.dart';
import 'package:flutter_application_football/models/match_team_model.dart';

class TeamMatchWidget extends StatelessWidget {
  const TeamMatchWidget({super.key, required this.matchInfo});
  final MatchTeamModel matchInfo;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: Colors.grey[100]
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            matchInfo.leagueTitle,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          Flexible(
            
            child: FittedBox(
              child: Text(
                matchInfo.matchTitle,
                style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Text(
            '${matchInfo.homeTeamScore} : ${matchInfo.awayTeamScore}',
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(matchInfo.image))),
          ),
          Text(
            '${matchInfo.stadium} , ${matchInfo.country}',
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          Text(
            matchInfo.matchDate,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
