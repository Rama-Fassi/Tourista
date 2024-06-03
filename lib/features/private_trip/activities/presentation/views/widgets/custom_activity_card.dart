import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/features/private_trip/activities/data/models/tourism_activities/activity_model.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utlis/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'custom_check_box.dart';

class CustomActivityCard extends StatefulWidget {
  const CustomActivityCard({
    super.key,
    required this.screenWidth,
    required this.activityName,
    required this.activityDescription,
    required this.activityImages,
    required this.activityModel,
  });

  final double screenWidth;
  final String? activityImages;
  final String? activityName;
  final String? activityDescription;
  final ActivityModel? activityModel;

  @override
  State<CustomActivityCard> createState() => _CustomActivityCardState();
}

class _CustomActivityCardState extends State<CustomActivityCard> {
  
  bool _isChecked = false;

void _toggleCheckbox(bool? value) {
    setState(() {
      if (value != null) {
        _isChecked = value;
      } else {
        _isChecked = false; 
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: widget.screenWidth * .9,
        height: height * 0.17,
        child: Row(
          children: [
            Align(
              alignment: Alignment.center,
              child: CustomCheckbox(
                value: _isChecked,
                onChanged: _toggleCheckbox,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .85,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                            image: NetworkImage(
                                '$kPhotoBAseUrl${widget.activityImages!}'),
                            fit: BoxFit.cover)),
                    width: MediaQuery.of(context).size.width * .3,
                  ),
                  const Gap(8),
                  AspectRatio(
                    aspectRatio: 1.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 2,
                          widget.activityName!,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.styleQuickBold22(context),
                        ),
                        Text(
                          maxLines: 3,
                          widget.activityDescription!,
                          style: AppStyles.styleInterRegular14(context),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CustomButton(
                              onTap: () {
                                GoRouter.of(context).push(
                                    AppRouter.kActivityDetailsView,
                                    extra: widget.activityModel);
                              },
                              text: "Details",
                              width: 55,
                              borderRadius: 10,
                              height: 23,
                              style: AppStyles.styleSourceBold12(context),
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
