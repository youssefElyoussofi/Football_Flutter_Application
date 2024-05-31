
import 'package:flutter/material.dart';
import 'package:flutter_application_football/bloc/league_matches_cubit.dart';
import 'package:flutter_application_football/widgets/match_league.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoundsMatches extends StatelessWidget {
  const RoundsMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MatchesCubit(),
      child: Column(
        children: [
         
          Expanded(
            child: BlocBuilder<MatchesCubit, MatchesState>(
              builder: (context, state) {
                final cubit = context.read<MatchesCubit>();
                if (state is MatchesLoaded) {
                  final leagueName = cubit.categories.keys.firstWhere(
                      (key) => cubit.categories[key]?.keys.first == state.leagueId);
                  final rounds = cubit.categories[leagueName]?.values.first;

                  return Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                              flex: 2,
                            child: FittedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey,width: 0.5)),
                                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                child: DropdownButton<String>(
                                  underline: const SizedBox(),
                                  padding: const EdgeInsets.symmetric(horizontal: 15),                        
                                  value: leagueName,
                                  onChanged: (value) {
                                    if (value != null) {
                                      cubit.updateLeague(value);
                                    }
                                  },
                                  items: cubit.categories.keys
                                      .map((String key) {
                                        return DropdownMenuItem<String>(
                                
                                          value: key,
                                          child: Text(key),
                                        );
                                      })
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                              flex: 1,
                            child: Container(
                               decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey,width: 0.5)),
                              child: DropdownButton<int>(
                                underline: const SizedBox(),
                                  padding: const EdgeInsets.symmetric(horizontal: 15), 
                                value: state.round,
                                onChanged: (value) {
                                  if (value != null) {
                                    cubit.updateRound(state.leagueId, value);
                                  }
                                },
                                items: rounds
                                    ?.map((int round) {
                                      return DropdownMenuItem<int>(
                                        value: round,
                                        child: Text('$round'),
                                      );
                                    })
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.matches.length,
                          itemBuilder: (context, index) {
                            final match = state.matches[index];
                            return MatchLeagueWidget(matchLeague: match);
                          },
                        ),
                      ),
                    ],
                  );
                } else if (state is MatchesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MatchesError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.message),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            cubit.emit(MatchesInitial());
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(child: Text('Select a league and round'));
              },
            ),
          ),
        ],
      ),
    );
  }
}


