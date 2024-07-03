import 'package:flutter/material.dart';

class FavReadyTrips extends StatelessWidget {
  const FavReadyTrips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      right: 16,
      child: Container(
        transformAlignment: Alignment.center,
        width: 24,
        height: 24,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: const Icon(
          Icons.favorite_border_rounded,
          color: Colors.red,
          size: 20,
        ),
      ),
    );
  }
}
