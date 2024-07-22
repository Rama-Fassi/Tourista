import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class AttractionsViewBody extends StatelessWidget {
  const AttractionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          color: kPrimaryColor,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Attractions',
                      style: AppStyles.styleInterSemiBold23(context)
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.notifications_outlined,
                    size: 25,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        /*     GridView.custom(
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            pattern: [
              WovenGridTile(1),
              WovenGridTile(
                5 / 7,
                crossAxisRatio: 0.9,
                alignment: AlignmentDirectional.centerEnd,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => Tile(index: index),
          ),
        ),*/
      ],
    );
  }
}

class Tile extends StatelessWidget {
  final int index;

  const Tile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
        child: Text(
          '$index',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
