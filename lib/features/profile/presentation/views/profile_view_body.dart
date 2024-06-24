import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/manager/sign_out_cubit/sign_out_cubit.dart';

import '../../../../core/utlis/app_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () async {
              await context.setLocale(const Locale('en'));
            },
            child: const Text('English')),
        ElevatedButton(
            onPressed: () async {
              await context.setLocale(const Locale('ar'));
            },
            child: const Text("العربية")),
        BlocListener<SignOutCubit, SignOutState>(
          listener: (context, state) async {
            if (state is SignOutSuccess) {
              await Hive.box(kTokenBox).delete(kTokenRef);
              print(Hive.box(kTokenBox).get(kTokenRef));
              GoRouter.of(context).pushReplacement(AppRouter.kSignIN);
            }
          },
          child: ElevatedButton(
              onPressed: () async {
                await BlocProvider.of<SignOutCubit>(context).signOut();
              },
              child: const Text("sign out")),
        ),
      ],
    ));
  }
}
