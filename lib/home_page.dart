
import 'package:flutter/material.dart';

import 'package:flutter_application_football/league_table_cubit.dart';

import 'package:flutter_application_football/widgets/league_table.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(),
        body: Column(
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
        ));
  }

  

}

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeagueCubit, LeagueState>(
      buildWhen: (previous, current) => previous.selectedCategory != current.selectedCategory,
      builder: (context, state) {
        return SizedBox(
       
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              List<String> categoryName =['Premier League','La Liga','Serie A','Bundesliga','Ligue 1'];
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
                      color: isSelected ? Colors.deepPurple.withOpacity(0.1) : Colors.deepPurple.withOpacity(0.05) ,
                     
                  
                      border: isSelected ? const Border(bottom: BorderSide(color: Colors.deepPurple)
                      
                      ) : null ,
                      
                    ),
                    duration: const Duration(milliseconds: 300),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          categoryName[index],
                          style: TextStyle(color: isSelected ? Colors.deepPurple : null,),
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