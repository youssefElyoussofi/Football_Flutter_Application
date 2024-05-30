

import 'package:flutter/material.dart';
import 'package:flutter_application_football/models/match_league_model.dart';

class MatchLeagueWidget extends StatelessWidget {
  const MatchLeagueWidget({
    required this.matchLeague,
    super.key,
  });

  final MatchLeagueModel matchLeague;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 15,right: 25,top: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey,width: 0.5),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100]),
      child: Column(
    
        mainAxisSize: MainAxisSize.min,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Flexible(
               child: Row(children: [
                   Padding(
                     padding: const EdgeInsets.only(right: 15,top: 5,left: 10),
                     child: Image.network(matchLeague.teamhomeImg,scale: 10,),
                   ),
                  Flexible(
                    child: FittedBox(
                      child: Text(matchLeague.teamHomeName,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w500),)),
                  ),
               ],),
             ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(matchLeague.teamHomeScore,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Flexible(
               child: Row(children: [
                   Padding(
                     padding: const EdgeInsets.only(right: 15,top: 5,left: 10),
                     child: Image.network(matchLeague.teamAwayImg,scale: 10,),
                   ),
                  Flexible(
                    child: FittedBox(
                      child: Text(matchLeague.teamAwayName,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w500),)),
                  ),
               ],),
             ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(matchLeague.teamAwayScore,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                ),
            ],
          ),
          const Divider(),
          Text("${matchLeague.stadium} , ${matchLeague.country}",style: const TextStyle(fontSize: 18,color: Colors.grey),),
          Text(matchLeague.date,style: const TextStyle(fontSize: 18,color: Colors.grey),),
      
        ],
      ),
    );
  }
}