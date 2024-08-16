import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/attractions/presentation/manager/get_attractions_cubit/get_attractions_cubit.dart';
import 'attractions_grid_view.dart';
import 'custom_attractions_shimmer.dart';
import 'empty_attractions.dart';

class AttractionsViewBody extends StatelessWidget {
  const AttractionsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetAttractionsCubit>(context).getAttractions();
    double height = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<GetAttractionsCubit, GetAttractionsState>(
          builder: (context, state) {
            if (state is GetAttractionsLoading) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Adjust for fitting your custom width
                      childAspectRatio:
                          0.55, // Aspect ratio for the custom widget
                      crossAxisSpacing: 20.0,
                    ),
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return CustomAttractionsShimmer(height: height);
                    },
                  ),
                ),
              );
            } else if (state is GetAttractionsSuccess) {
              return state.attractionsModel.attraction!.isEmpty
                  ? const EmptyAttractions()
                  : Expanded(
                      child: AttractionsGridView(
                      attractionsModel: state.attractionsModel,
                    ));
            } else if (state is GetAttractionsFailure) {
              return Text(state.errMessage);
            } else {
              return const SizedBox();
            }
          },
        )
      ],
    );
  }
}
