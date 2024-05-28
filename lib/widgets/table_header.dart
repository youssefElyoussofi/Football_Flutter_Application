

import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
    
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 6,
          child: Row(children: [
            const Padding(
        padding: EdgeInsets.only(left: 10,),
        child: Text(
          '1',
         
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 7,vertical: 5),
        height: 40,
        width: 40,
        decoration:
            BoxDecoration(
              image: const DecorationImage(image: NetworkImage('')),
              borderRadius: BorderRadius.circular(5)),
      ),
    
            const Flexible(
              child: Text('club name',overflow: TextOverflow.ellipsis,
                  maxLines: 1,),
            )
          ],),
        ),
        const Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text('W'),
            Text('D'),
            Text('L'),
            Text('Pts')
          ],),
        ),
      ],
    );
  }
}