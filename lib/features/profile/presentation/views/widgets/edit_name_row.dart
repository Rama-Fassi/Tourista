import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/functions/custom_success_snack_bar.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/profile/presentation/manager/update_name_cubit/update_name_cubit.dart';

import '../../../../../core/utlis/functions/custom_snack_bar.dart';
import '../../../../../core/widgets/loading_widget.dart';

class EditNameRow extends StatefulWidget {
  const EditNameRow({super.key, required this.scereenWidth});
  final double scereenWidth;

  @override
  State<EditNameRow> createState() => _PersonalDetailsViewBodyState();
}

class _PersonalDetailsViewBodyState extends State<EditNameRow> {
  bool isEditing = false;
  late TextEditingController controller;
  late FocusNode focusNode;
  String username = 'Rama';
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: username);
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
                    hintText: 'Enter New Name',
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
                      username = newValue;
                      isEditing = false;
                      FocusScope.of(context).unfocus();
                    });
                  },
                )
              : Text(
                  username,
                  style: AppStyles.styleInterRegular18(context),
                ),
        ),
        BlocListener<UpdateNameCubit, UpdateNameState>(
          listener: (context, state) {
            if (state is UpdateNameSuccess) {
              customSuccessSnackBar(
                  context, 'Name has been Edit successfully.');
            } else if (state is UpdateNameFailure) {
              customSnackBar(context, state.errMessage);
            }
          },
          child: BlocBuilder<UpdateNameCubit, UpdateNameState>(
            builder: (context, state) {
              return state is UpdateNameLoading
                  ? const LoadingWidget()
                  : TextButton(
                      onPressed: () {
                        setState(() {
                          if (isEditing) {
                            username = controller.text;
                            isEditing = false;
                            FocusScope.of(context).unfocus();
                            BlocProvider.of<UpdateNameCubit>(context)
                                .updateName(
                                    name: username); // Hide the keyboard
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
