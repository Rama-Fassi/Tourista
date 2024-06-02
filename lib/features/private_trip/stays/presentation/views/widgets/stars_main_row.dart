import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/core/utlis/app_assets.dart';

class StarsMainRow extends StatelessWidget {
  const StarsMainRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          5, (index) => SvgPicture.asset(Assets.imagesIconsYellowStars)),
    );
  }
}
