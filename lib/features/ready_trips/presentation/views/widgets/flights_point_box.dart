import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class FlightsPointBox extends StatelessWidget {
  const FlightsPointBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Choose a place to go',
          style: AppStyles.styleInterSemiBold18(context),
        ),
        Spacer(),
        PopupMenuButton(
            offset: Offset(21, 45),
            constraints: BoxConstraints.expand(
                height: 200, width: MediaQuery.sizeOf(context).width * .9),
            icon: Icon(Icons.keyboard_arrow_down),
            itemBuilder: (context) => [
                  PopupMenuItem(child: Text('df')),
                  PopupMenuItem(child: Text('df')),
                  PopupMenuItem(child: Text('df')),
                  PopupMenuItem(child: Text('df')),
                  PopupMenuItem(child: Text('df')),
                  PopupMenuItem(child: Text('df')),
                  PopupMenuItem(child: Text('df')),
                  PopupMenuItem(child: Text('df'))
                ]),
      ],
    );
  }
}
