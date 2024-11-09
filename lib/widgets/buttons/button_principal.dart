import 'package:flutter/material.dart';
import 'package:tots_material/utils/colors/tots_colors.dart';
import 'package:tots_material/utils/styles/tots_text_styles.dart';

class ButtonPrincipal extends StatefulWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool load;
  final bool disabled = false;

  const ButtonPrincipal({
    super.key,
    required this.title,
    this.onPressed,
    required this.load,
  });

  @override
  State<ButtonPrincipal> createState() => _ButtonPrincipalState();
}

class _ButtonPrincipalState extends State<ButtonPrincipal> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(38),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: widget.disabled || widget.onPressed == null
              ? WidgetStateProperty.all(TotsColors.bgButton)
              : WidgetStateProperty.all(TotsColors.bgButton),
          overlayColor: WidgetStateProperty.all(
            const Color.fromARGB(255, 97, 97, 97).withOpacity(0.1),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        onPressed: widget.disabled || widget.onPressed == null ? null : widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            !widget.load
                ? Flexible(
                    child: Column(
                      children: [
                        Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: TotsTextStyles.btnTextStyle,
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(TotsColors.loadColorWithe),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
