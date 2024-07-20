import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/delete_ticket/delete_ticket_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/the_plan_container.dart';
import 'package:tourista/features/profile/presentation/views/functions/show_confirmation_dialog.dart';

import '../../../../../../core/widgets/loading_widget.dart';
import 'empty_text_widget.dart';

class DisplayTheTicket extends StatefulWidget {
  const DisplayTheTicket({
    super.key,
    required this.screenWidth,
    required this.tripId,
    required this.screenHeight,
    required this.state,
  });

  final double screenWidth;
  final int tripId;
  final double screenHeight;
  final GetUserPrivatePlanSuccess state;

  @override
  State<DisplayTheTicket> createState() => _DisplayTheTicketState();
}

class _DisplayTheTicketState extends State<DisplayTheTicket> {
  bool isTicketEmpty = true;
  @override
  void initState() {
    super.initState();
    widget.state.getUserPrivatePlanModel.ticket == null
        ? isTicketEmpty = true
        : isTicketEmpty = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteTicketCubit, DeleteTicketState>(
      listener: (context, deleteTicketstate) {
        if (deleteTicketstate is DeleteTicketSuccess) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pop();

          setState(() {
            isTicketEmpty = true;
          });
        } else if (deleteTicketstate is DeleteTicketFailure) {
          customSnackBar(context, deleteTicketstate.errMessage);
        } else {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const LoadingWidget();
            },
          );
        }
      },
      child: ThePlanContainer(
        data: 'The Ticket',
        onTap: () {
          ShowConfirmationDialog().showConfirmationDialog(
              context: context,
              titleText: LocaleKeys.Confirmation.tr(),
              contentText: 'Are You sure you want to delete the Ticket?',
              onConfirmPressed: () {
                isTicketEmpty == true
                    ? GoRouter.of(context).pop()
                    : BlocProvider.of<DeleteTicketCubit>(context).deleteTicket(
                        bookingTicketId:
                            widget.state.getUserPrivatePlanModel.ticket!.id!,
                      );
              },
              cancel: true);
        },
        screenwidth: widget.screenWidth,
        withDeleteIcon: true,
        child: isTicketEmpty == false
            ? Text('data')
            : const EmptyTextWidget(
                data: 'Go To Flight and add The perfect Ticket for you',
              ),
      ),
    );
  }
}
