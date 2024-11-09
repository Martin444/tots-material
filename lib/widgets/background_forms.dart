import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tots_material/utils/colors/tots_colors.dart';
import 'package:tots_material/widgets/custom_form.dart';

class BackgroundForms extends StatelessWidget {
  const BackgroundForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -82,
          right: -70,
          child: ClipPath(
            clipper: BlobClipper(),
            child: Container(
              width: 300,
              height: 300,
              color: TotsColors.principalTheme,
            ),
          ),
        ),
        Positioned(
          bottom: -172,
          left: 50,
          child: ClipPath(
            clipper: BlobClipper(),
            child: Container(
              width: 300,
              height: 300,
              color: TotsColors.principalTheme,
            ),
          ),
        ),
        Positioned(
          top: 380,
          left: -110,
          child: ClipPath(
            clipper: BlobClipper(),
            child: Container(
              width: 170,
              height: 170,
              color: TotsColors.principalTheme,
            ),
          ),
        ),
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 50,
              sigmaY: 50,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ),
      ],
    );
  }
}
