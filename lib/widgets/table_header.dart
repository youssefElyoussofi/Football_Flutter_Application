

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
           
     
    
            const Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                child: Text('club',overflow: TextOverflow.ellipsis,
                    maxLines: 1,),
              ),
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