
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_football/models/league_table_model.dart';

import 'package:flutter_application_football/widgets/table_header.dart';
import 'package:flutter_application_football/widgets/table_item.dart';

class LeagueTable extends StatelessWidget {
  const LeagueTable({super.key, required this.leagueTeams});

  final List<LeagueTableModel> leagueTeams;

  @override
  Widget build(BuildContext context) {
    return ListView(
          
          children: [
            const TableHeader(),
            ...List.generate(leagueTeams.length, (index) => TableItem(team: leagueTeams[index],))
           
          ],
        );
  }
}