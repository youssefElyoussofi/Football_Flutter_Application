import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_football/models/league_table_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 class LeagueState extends Equatable{
  final List<String> categories;
  final String selectedCategory;
  final String error;
  final List<LeagueTableModel> leagueTable;
  final bool isLoading;

  const LeagueState({required this.error,required this.isLoading,required this.selectedCategory, required this.categories,required this.leagueTable});
 
  @override

  List<Object?> get props => [selectedCategory,categories,isLoading,error];

  LeagueState copyWith({bool? isLoading,List<String>? categories,String? selectedCategory,List<LeagueTableModel>? leagueTable,String? error}){
    return LeagueState(error: error?? this.error,selectedCategory: selectedCategory?? this.selectedCategory, categories: categories??this.categories, leagueTable: leagueTable??this.leagueTable, isLoading: isLoading??this.isLoading );}
  

}

class InitialState extends LeagueState {
InitialState():super(categories: ['4328','4332','4335','4331','4334'],leagueTable: [],selectedCategory: '4328',isLoading: false,error: '');


}



class LeagueCubit extends Cubit<LeagueState> {
  LeagueCubit() : super(InitialState()){
    getLeagueTableByCategory(state.selectedCategory);
  }

  void selectLeague(String leagueID){
    emit(state.copyWith(selectedCategory: leagueID));
    getLeagueTableByCategory(leagueID);
  }

  Future<void> getLeagueTableByCategory(String leagueID) async {
    emit(state.copyWith(isLoading: true));
    try {
      final dio = Dio();

      final response = await dio.get(
          'https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=$leagueID&s=2023-2024');

      Map<String, dynamic> data = response.data;

      List<dynamic> leagueData = data['table'];

      List<LeagueTableModel> leagueTableData = [];

      for (var element in leagueData) {
        leagueTableData.add(LeagueTableModel.fromJson(element));
      }
      emit(state.copyWith(isLoading: false,leagueTable: leagueTableData,));
    } catch (e) {
      emit(state.copyWith(error: e.toString(),isLoading: false));
    }
  }

  
}


   
  
