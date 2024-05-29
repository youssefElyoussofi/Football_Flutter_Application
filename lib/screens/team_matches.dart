import 'package:flutter/material.dart';


class TeamMatches extends StatelessWidget {
  const TeamMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Container(
          margin: EdgeInsets.all(15),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://www.thesportsdb.com/images/media/event/thumb/k7l14a1712648088.jpg'))
          ),
        ),
        const Text('Liverpool vs Atalanta'),
      ],
    );
  }
}