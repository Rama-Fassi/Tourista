import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/features/profile/presentation/manager/all_reviews_cubit/all_reviews_cubit.dart';
import '../../../../../core/utlis/styles.dart';
import 'display_all_user_reviews.dart';
import 'rating_column.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({
    super.key,
    required this.scereenWidth,
  });
  final double scereenWidth;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AllReviewsCubit>(context).getAllReviews();
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: RatingColumn(
            //  initialRating: rating,
            // onRatingUpdate: (updatedRating) {
            //  setState(() {
            //    rating = updatedRating;
            //  });
            //  },
            //   communtController: communtController,
            // rating: rating,
            //  comment: comment,
            scereenWidth: screenWidth,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Most Recent:',
              style: AppStyles.styleInterMedium19(context),
            ),
          ),
        ),
        DisplayAllUserReviews(
          screenWidth: screenWidth,
        )
      ],
    );
  }
}
