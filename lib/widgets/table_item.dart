import 'package:flutter/material.dart';
import 'package:flutter_application_football/bloc/nav_buttom_bar_cubit.dart';
import 'package:flutter_application_football/bloc/team_matches_cubit.dart';
import 'package:flutter_application_football/models/league_table_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: GestureDetector(
            onTap: () {
              var liverpoolLastMatches = BlocProvider.of<TeamLastMatchesCubit>(context);
          liverpoolLastMatches.getTeamLastMatches(team.teamId);
              context.read<NavBarCubit>().updateIndex(2);
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text(
                    team.teamIntRank,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: NetworkImage(team.teamImg)),
                      borderRadius: BorderRadius.circular(5)),
                ),
                Flexible(
                  child: Text(
                    team.teamName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
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
            ],
          ),
        ),
      ],
    );
  }
}
