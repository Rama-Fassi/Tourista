import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/features/profile/presentation/manager/update_phone_cubit/update_phone_cubit.dart';

import '../../../../../core/utlis/functions/custom_snack_bar.dart';

class EditPhoneRow extends StatefulWidget {
  const EditPhoneRow({super.key, required this.scereenWidth});
  final double scereenWidth;

  @override
  State<EditPhoneRow> createState() => _PersonalDetailsViewBodyState();
}

class _PersonalDetailsViewBodyState extends State<EditPhoneRow> {
  bool isEditing = false;
  late TextEditingController controller;
  late FocusNode focusNode;
  String userPhone = '0985392515';
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: userPhone);
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: isEditing
              ? TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    hintText: 'Enter New phone',
                    hintStyle: AppStyles.styleInterRegular18(context),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                  ),
                  onSubmitted: (newValue) {
                    setState(() {
                      userPhone = newValue;
                      isEditing = false;
                      FocusScope.of(context).unfocus();
                    });
                  },
                )
              : Text(
                  userPhone,
                  style: AppStyles.styleInterRegular18(context),
                ),
        ),
        BlocListener<UpdatePhoneCubit, UpdatePhoneState>(
          listener: (context, state) {
            if (state is UpdatePhoneSuccess) {
              GoRouter.of(context)
                  .pushReplacement(AppRouter.kverifyNewPhoneview, extra: {
                'phoneNumber': state.updatePhoneModel.userPhone,
              });
            } else if (state is UpdatePhoneFailure) {
              customSnackBar(context, state.errMessage);
            }
          },
          child: BlocBuilder<UpdatePhoneCubit, UpdatePhoneState>(
            builder: (context, state) {
              return state is UpdatePhoneLoading
                  ? const LoadingWidget()
                  : TextButton(
                      onPressed: () {
                        setState(() {
                          if (isEditing) {
                            userPhone = controller.text;
                            isEditing = false;
                            FocusScope.of(context).unfocus();
                            BlocProvider.of<UpdatePhoneCubit>(context)
                                .updatePhone(
                                    phone: userPhone); // Hide the keyboard
                          } else {
                            isEditing = true;
                            focusNode.requestFocus(); // Show the keyboard
                          }
                        });
                      },
                      child: isEditing
                          ? const Icon(Icons.check)
                          : SvgPicture.asset(Assets.imagesIconsPenEditIcon),
                    );
            },
          ),
        ),
      ],
    );
  }
}
