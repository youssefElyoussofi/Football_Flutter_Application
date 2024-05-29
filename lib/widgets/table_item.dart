import 'package:flutter/material.dart';
import 'package:flutter_application_football/models/league_table_model.dart';

class TableItem extends StatelessWidget {
  const TableItem({
    required this.team,
    super.key,
  });

  final LeagueTableModel team;

  @override
  Widget build(BuildContext context) {
    return Row(
    
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 6,
          child: Row(children: [
             Padding(
        padding: const EdgeInsets.only(left: 10,),
        child: Text(
          team.teamIntRank,
         
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 7,vertical: 5),
        height: 40,
        width: 40,
        decoration:
            BoxDecoration(
              image:  DecorationImage(image: NetworkImage(team.teamImg)),
              borderRadius: BorderRadius.circular(5)),
      ),
    
             Flexible(
              child: Text(team.teamName,overflow: TextOverflow.ellipsis,
                  maxLines: 1,),
            )
          ],),
        ),
         Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text(team.teamIntWin),
            Text(team.teamIntDraw),
            Text(team.teamIntLose),
            Text(team.teamIntPts)
          ],),
        ),
      ],
    );
  }
}