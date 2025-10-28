import 'package:easy_localization/easy_localization.dart' as ez;
import '../../../core/helper/extensions/widgets_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../languages/locale_keys.g.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/styles.dart';
import '../../helper/phone_helper/phone_length_helper.dart';

class CustomPhoneField extends StatefulWidget {
  const CustomPhoneField({
    super.key,
    this.validator,
    this.controller,
    this.onFieldSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.onSaved,
    this.showTitle = true,
    this.initialCountryCode = '20',
    this.textInputAction = TextInputAction.next,
  });
  final String? Function(String? value, int? maxLength)? validator;
  final TextEditingController? controller;
  final void Function(String? value)? onFieldSubmitted;
  final void Function(String? value)? onSaved;
  final void Function(String? value)? onChanged;
  final void Function()? onEditingComplete;
  final bool showTitle;
  final String initialCountryCode;
  final TextInputAction? textInputAction;

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  late TextEditingController _controller;
  int? _maxLength;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.initializeCountryCode(widget.initialCountryCode);
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
    _updateMaxLength();
  }

  void _updateMaxLength() {
    setState(() {
      _maxLength =
          PhoneHelper.countryPhoneLengths[_controller.selectedCountryCode];
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.clearCountryCode();
      _controller.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final countryCodes = PhoneHelper.countryPhoneLengths.keys.toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        if (widget.showTitle)
          Text(
            LocaleKeys.custom_widget_phone_number.tr(),
            style: Styles.light(
              context,
              14,
            ).copyWith(color: AppColors.backgroundDark),
          ),

        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            obscuringCharacter: "*",
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onSaved: widget.onSaved,
            textInputAction: widget.textInputAction,
            onEditingComplete: widget.onEditingComplete,
            onChanged: widget.onChanged,
            onTapOutside: (pos) {
              FocusScope.of(context).unfocus();
            },
            autofocus: false,
            maxLength: _focusNode.hasFocus ? _maxLength : null,
            validator: (value) => widget.validator?.call(value, _maxLength),
            focusNode: _focusNode,
            controller: _controller,
            maxLines: 1,
            textAlign: TextAlign.start,
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            cursorColor: AppColors.black,
            style: Styles.regular(context, 16),
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: InputDecoration(
              hoverColor: Colors.transparent,
              hintText: LocaleKeys.custom_widget_phone_number.tr(),
              hintStyle: Styles.light(
                context,
                14,
              ).copyWith(color: AppColors.gray5F),
              contentPadding: REdgeInsetsDirectional.only(
                start: 12,
                end: 12,
                bottom: 10,
                top: 10,
              ),
              alignLabelWithHint: true,
              errorStyle: Styles.regular(
                context,
                12,
              ).copyWith(color: AppColors.errorLight),
              focusColor: Colors.black,

              suffixIcon: DropdownButton<String>(
                value: _controller.selectedCountryCode,
                borderRadius: BorderRadius.circular(14),
                menuMaxHeight: 0.7.sh,
                menuWidth: 0.15.sw.clamp(150, 200),
                autofocus: false,
                focusNode: _focusNode,
                padding: EdgeInsetsDirectional.only(end: 12),
                alignment: AlignmentDirectional.centerEnd,
                elevation: 16,
                icon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 5),
                  child: SvgPicture.asset(
                    AppIcons.iconsDownArrow,
                    colorFilter: ColorFilter.mode(
                      AppColors.gray5F,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                underline: SizedBox(),
                items: List.generate(countryCodes.length, (index) {
                  String code = countryCodes[index];
                  String countryName = PhoneHelper.getCountryTitle(
                    code,
                    context.locale.languageCode,
                  );
                  return DropdownMenuItem<String>(
                    value: code,
                    child: Text(
                      context.locale.languageCode == "ar"
                          ? '$countryName (+$code)'
                          : '+$code $countryName',
                      style: Styles.light(
                        context,
                        12,
                      ).copyWith(color: AppColors.gray5F),
                    ),
                  );
                }),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _controller.updateSelectedCountryCode(value);
                      _updateMaxLength();
                    });
                  }
                },
              ),

              prefixIcon: SvgPicture.asset(
                AppIcons.iconsPhone,
                width: 20,
                height: 20,
                fit: BoxFit.scaleDown,
              ),

              errorBorder: customOutLineBorders(
                borderColor: AppColors.errorLight,
              ),
              disabledBorder: customOutLineBorders(),
              border: customOutLineBorders(),
              enabledBorder: customOutLineBorders(),
              focusedBorder: customOutLineBorders(
                borderColor: AppColors.primaryLight,
                borderWidth: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder customOutLineBorders({
  double? borderRadius,
  Color? borderColor,
  double? borderWidth,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius ?? 4),
    borderSide: BorderSide(
      color: borderColor ?? AppColors.gray53,
      width: borderWidth ?? 1,
    ),
  );
}
