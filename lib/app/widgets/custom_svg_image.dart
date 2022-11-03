import 'package:flutter/animation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/utils.dart';

class CustomSvgImage extends StatelessWidget {
  final String svgPath;
  final double? height;
  final Color? color;
  const CustomSvgImage({super.key, required this.svgPath, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(svgPath, height: height ?? Utils.extraHighIconSize * 1.3, color: color);
  }
}
