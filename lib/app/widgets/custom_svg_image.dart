import '../../core/utils/utils.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgImage extends StatelessWidget {
  final String svgPath;
  final double? height;
  const CustomSvgImage({super.key, required this.svgPath, this.height});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(svgPath, height: height ?? Utils.extraHighIconSize * 1.3);
  }
}
