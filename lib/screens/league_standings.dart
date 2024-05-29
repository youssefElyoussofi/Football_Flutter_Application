import 'package:flutter/material.dart';

import 'package:flutter_application_football/home_page.dart';
import 'package:flutter_application_football/bloc/league_table_cubit.dart';
import 'package:flutter_application_football/widgets/league_table.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeagueStandings extends StatelessWidget {
  const LeagueStandings({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            const Expanded(
              flex: 1,
              child: CategorySelector()),
            Expanded(
              flex: 16,
              child:  BlocBuilder<LeagueCubit,LeagueState>(
                  buildWhen: (previous, current) => previous.leagueTable != current.leagueTable || previous.isLoading != current.isLoading || previous.error != current.error,
                  builder: (context, state) {
                  if(state.isLoading){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  else if(state.error.isNotEmpty){

                    return Center(child: Text(state.error),);

                  }
                  return LeagueTable(leagueTeams: state.leagueTable,);
            
                  },),
                ),
            
          ],
        );
  }
}