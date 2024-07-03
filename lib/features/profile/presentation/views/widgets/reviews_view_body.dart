import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/functions/custom_success_snack_bar.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/profile/presentation/manager/add_review_cubit/add_review_cubit.dart';

import '../../../data/models/all_reviews_model/all_reviews_model.dart';
import 'user_review_post.dart';

class ReviewsViewBody extends StatefulWidget {
  const ReviewsViewBody(
      {super.key, required this.scereenWidth, required this.allReviewsModel});
  final double scereenWidth;
  final AllReviewsModel allReviewsModel;

  @override
  State<ReviewsViewBody> createState() => _ReviewsViewBodyState();
}

class _ReviewsViewBodyState extends State<ReviewsViewBody> {
  int _selectedStars = 0;
  late TextEditingController communtController;
  String communt = '';

  @override
  void initState() {
    super.initState();
    listenController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      addReviewDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
          itemCount: widget.allReviewsModel.reviewsCount,
          itemBuilder: (context, index) {
            return UserReviewPost(
              screenWidth: screenWidth,
              circleAvatarName:
                  '${widget.allReviewsModel.reviews![index].user!.name}'
                      .substring(0, 2)
                      .toUpperCase(),
              userName: widget.allReviewsModel.reviews![index].user!.name ?? '',
              starsCount: widget.allReviewsModel.reviews![index].review ?? 5,
              userCommunt: widget.allReviewsModel.reviews![index].comment ?? '',
              userCommuntCreatedDate:
                  'written ${widget.allReviewsModel.reviews![index].createdAt}'
                      .substring(0, 19),
            );
          }),
    );
  }

  void listenController() {
    communtController = TextEditingController();
    communtController.addListener(() {
      communt = communtController.text;
      setState(() {});
    });
  }

  void addReviewDialog(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: Colors.white,
          iconPadding: const EdgeInsets.all(8),
          icon: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: kPrimaryColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();

                // i want to close this add dialog when tap how
                if (kDebugMode) {
                  print('Selected Stars: $_selectedStars');
                }
              },
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text('Put Your Reviews',
              style: AppStyles.styleSourceBold25(context)
                  .copyWith(color: kPrimaryColor)),
          titlePadding: EdgeInsets.zero,
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedStars = index + 1;
                          });
                        },
                        child: Icon(
                          Icons.star,
                          color: index < _selectedStars
                              ? Colors.orange
                              : Colors.grey,
                          size: 33,
                        ),
                      );
                    }),
                  ),
                  const Gap(20),
                  SizedBox(
                    height: 150,
                    child: TextField(
                      controller: communtController,
                      maxLines: null,
                      expands: true,
                      decoration: const InputDecoration(
                        hintText: 'Add Your Communt',
                        labelStyle: TextStyle(
                          textBaseline: TextBaseline.alphabetic,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          actions: [
            BlocListener<AddReviewCubit, AddReviewState>(
              listener: (context, state) {
                if (state is AddReviewSuccess) {
                  Navigator.of(context).pop();

                  customSuccessSnackBar(
                      context, 'Your Review Added Successfully');
                } else if (state is AddReviewFailure) {
                  customSnackBar(context, state.errMessage);
                }
              },
              child: BlocBuilder<AddReviewCubit, AddReviewState>(
                builder: (context, state) {
                  return state is AddReviewLoading
                      ? const SpinKitThreeBounce(
                          color: kGreenColor,
                          size: 30,
                        )
                      : CustomButton(
                          onTap: () {
                            BlocProvider.of<AddReviewCubit>(context).addReview(
                                review: _selectedStars.toString(),
                                comment: communt);
                          },
                          text: 'Done',
                          width: 95,
                          borderRadius: 5,
                          height: 40,
                          style: AppStyles.styleSourceBold20(context)
                              .copyWith(color: Colors.white),
                          color: kPrimaryColor);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    communtController.dispose(); // Dispose the TextEditingController
    super.dispose();
  }
}
