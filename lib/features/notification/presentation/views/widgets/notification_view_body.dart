import 'package:flutter/widgets.dart';
import 'package:tourista/features/notification/presentation/views/widgets/notification_card.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
          child: GestureDetector(
            onTap: () {},
            child: NotificationCard(
              title:
                  'Attractionfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccfff',
            ),
          ),
        );
      },
    );
  }
}
