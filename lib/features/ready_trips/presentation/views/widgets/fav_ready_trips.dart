import 'package:flutter/material.dart';

class FavReadyTrips extends StatefulWidget {
  const FavReadyTrips({
    super.key,
  });

  @override
  State<FavReadyTrips> createState() => _FavReadyTripsState();
}

class _FavReadyTripsState extends State<FavReadyTrips> {
  bool isFav = false;
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
        child: GestureDetector(
          onTap: () {
            setState(() {
              isFav = !isFav;
            });
          },
          child: Icon(
            isFav ? Icons.favorite : Icons.favorite_border_rounded,
            color: Colors.red,
            size: 20,
          ),
        ),
      ),
    );
  }
}
