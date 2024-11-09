import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tots_material/main.dart';
import 'package:tots_material/utils/colors/tots_colors.dart';
import 'package:tots_material/utils/formatters/upercase_first_letter.dart';

class InputTextPrincipal extends StatefulWidget {
  final List<TextInputFormatter>? formaters;
  final TextInputType? textInputType;
  final bool? isPassword;
  final bool? visibleText;
  final String? errorText;
  final String? labelText;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmited;
  final TextEditingController controller;
  const InputTextPrincipal({
    super.key,
    this.formaters,
    this.textInputType,
    this.isPassword,
    this.visibleText,
    this.errorText,
    this.focusNode,
    this.validator,
    this.textInputAction,
    this.onChanged,
    this.onSubmited,
    required this.controller,
    this.labelText,
  });

  @override
  State<InputTextPrincipal> createState() => _InputTextPrincipalState();
}

class _InputTextPrincipalState extends State<InputTextPrincipal> {
  bool isVisibleText = false;

  @override
  initState() {
    super.initState();

    isVisibleText = widget.isPassword ?? false;
  }

  Widget getIcon() {
    if (widget.isPassword ?? false) {
      return Container(
        margin: EdgeInsets.only(
          right: 5,
          top: widget.errorText != null ? 0 : 10,
          bottom: widget.errorText != null ? 18 : 0,
        ),
        child: GestureDetector(
          child: SvgPicture.asset(
            isVisibleText ? TotsIcons.eyePasswod : TotsIcons.eyePasswod,
            height: 30,
          ),
          onTap: () {
            setState(() {
              isVisibleText = !isVisibleText;
            });
          },
        ),
      );
    } else {
      return Container();
    }
  }

  List<TextInputFormatter> getFormatForTypeInput() {
    if (widget.formaters != null) return widget.formaters!;
    switch (widget.textInputType) {
      case TextInputType.name:
        return [UppercaseFirstLetterFormatter()];
      case TextInputType.number:
      case TextInputType.phone:
        return [
          FilteringTextInputFormatter.digitsOnly,
          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: widget.errorText != null ? Alignment.centerRight : Alignment.topRight,
      children: [
        TextFormField(
          obscureText: isVisibleText,
          validator: widget.validator,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          focusNode: widget.focusNode,
          inputFormatters: getFormatForTypeInput(),
          decoration: InputDecoration(
            fillColor: TotsColors.bgInput,
            labelText: widget.labelText,
            isCollapsed: false,
            alignLabelWithHint: false,
            errorText: widget.errorText,
            errorStyle: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 3,
            ),
            focusedBorder: const UnderlineInputBorder(),
            border: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
          ),
          style: TotsTextStyles.labelStyle,
          controller: widget.controller,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmited,
        ),
        getIcon(),
      ],
    );
  }
}
