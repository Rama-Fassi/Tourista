import 'package:flutter/material.dart';

class StaysViewBody extends StatelessWidget {
  const StaysViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Container(
          width: width,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  color: Colors.grey.withOpacity(.1))
            ],
          ),
          child: Text("data"),
        ),
      ],
    );
  }
}
