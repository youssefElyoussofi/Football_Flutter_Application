import 'package:flutter/material.dart';

import 'package:flutter_application_football/bloc/league_table_cubit.dart';
import 'package:flutter_application_football/bloc/nav_buttom_bar_cubit.dart';
import 'package:flutter_application_football/screens/rounds_matches.dart';
import 'package:flutter_application_football/screens/team_matches.dart';
import 'package:flutter_application_football/screens/league_standings.dart';
import 'package:flutter_application_football/screens/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Widget> screens = [
    const RoundsMatches(),
    const LeagueStandings(),
     const TeamMatches(),
    const Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Football Leagues',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: BlocBuilder<NavBarCubit,int>(
          builder: (context, state) {
            return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  context.read<NavBarCubit>().updateIndex(value);
                },
               
                currentIndex: state,
                items: const [
                  BottomNavigationBarItem(
                      label: 'Matches', icon: Icon(Icons.sports_soccer)),
                  BottomNavigationBarItem(
                      label: 'Standings', icon: Icon(Icons.grid_view)),
                      BottomNavigationBarItem(
                      label: 'League', icon: Icon(Icons.event_note)),
                  BottomNavigationBarItem(
                      label: 'Settings', icon: Icon(Icons.settings)),
                ]);
          },
        ),
        body: BlocBuilder<NavBarCubit, int>(
          builder: (context, state) {
            return screens[state];
          },
        ));
  }
}

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeagueCubit, LeagueState>(
      buildWhen: (previous, current) =>
          previous.selectedCategory != current.selectedCategory,
      builder: (context, state) {
        return SizedBox(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              List<String> categoryName = [
                'Premier League',
                'La Liga',
                'Serie A',
                'Bundesliga',
                'Ligue 1'
              ];
              final category = state.categories[index];
              final isSelected = category == state.selectedCategory;
              return GestureDetector(
                onTap: () {
                  context.read<LeagueCubit>().selectLeague(category);
                },
                child: FittedBox(
                  child: AnimatedContainer(
                    margin: EdgeInsets.only(left: 2),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.deepPurple.withOpacity(0.1)
                          : Colors.deepPurple.withOpacity(0.05),
                      border: isSelected
                          ? const Border(
                              bottom: BorderSide(color: Colors.deepPurple))
                          : null,
                    ),
                    duration: const Duration(milliseconds: 300),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          categoryName[index],
                          style: TextStyle(
                            color: isSelected ? Colors.deepPurple : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
