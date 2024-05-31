import 'package:flutter/material.dart';
import 'package:flutter_application_football/bloc/team_matches_cubit.dart';
import 'package:flutter_application_football/widgets/team_match.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TeamMatches extends StatelessWidget {
  const TeamMatches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamLastMatchesCubit, TeamLastMStates>(
      builder: (context, state) {
         if(state is LoadingState){
          return const Center(child: CircularProgressIndicator());
        }else if(state is FailedState){
          return Center(child:Text(state.error));
        }else if(state is MatchesTeamState){
          return Expanded(
            child: 
            ListView(children: [
              Text('Selected Team ${state.matches.first.matchTitle}'),
              ...List.generate(state.matches.length, (index) => TeamMatchWidget(matchInfo: state.matches[index]))
            ],)
            // ListView.builder(
            // itemCount: state.matches.length,
            // itemBuilder: (context, index) {
            //   return TeamMatchWidget(matchInfo: state.matches[index]);
            // },
            //         ),
          );
        }
        else{
          
          return const Center(child: Text(''));
        }
      },
    );
  }
}

