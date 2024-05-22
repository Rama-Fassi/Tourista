import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/city_select_location_card.dart';

class CitySelectLocationListView extends StatelessWidget {
  const CitySelectLocationListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop({"id": 1, "city": "damascus"});
                  },
                  child: const CitySelectLocationCard()),
            );
          }),
    );
  }
}
