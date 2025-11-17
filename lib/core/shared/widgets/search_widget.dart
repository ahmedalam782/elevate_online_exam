import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../helper/classes/debounce.dart';
import '../../languages/locale_keys.g.dart';
import '../../theme/app_icons.dart';
import '../../theme/styles.dart';
import '../../utils/constants/app_numbers.dart';
import 'custom_text_field.dart';

class SearchWidget extends StatefulWidget {
  final Function(String?)? onSearchChanged;
  final String title;
  final TextEditingController searchController;

  const SearchWidget({
    super.key,
    this.onSearchChanged,
    required this.title,
    required this.searchController,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String _animatedHintText = LocaleKeys.global_search_hint.tr();
  int _hintIndex = 0;
  bool _typingForward = true;
  Timer? _typewriterTimer;
  late Debounce _debounce;

  @override
  void initState() {
    super.initState();
    _debounce = Debounce();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _startTypewriterAnimation();
  }

  void _startTypewriterAnimation() {
    _typewriterTimer?.cancel();
    final fullText = LocaleKeys.global_search_hint.tr();
    const typeSpeed = Duration(milliseconds: 60);
    const pauseDuration = Duration(seconds: 5);
    _typewriterTimer = Timer.periodic(typeSpeed, (timer) {
      if (_typingForward) {
        if (_hintIndex < fullText.length) {
          setState(() {
            _hintIndex++;
            _animatedHintText = fullText.substring(0, _hintIndex);
          });
        } else {
          _typingForward = false;
          timer.cancel();
          Future.delayed(pauseDuration, () {
            if (mounted) {
              setState(() {
                _hintIndex = 0;
                _animatedHintText = '';
                _typingForward = true;
              });
              _startTypewriterAnimation();
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _typewriterTimer?.cancel();
    _debounce.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool convertToTabletMode =
            constraints.maxWidth > (AppNumbers.kTabletMaxWidth - 1);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            width: !convertToTabletMode ? null : 354.w.clamp(200, 354),
            child: CustomTextFormField(
              borderRadius: 50.r,
              hintText: _animatedHintText.isEmpty
                  ? LocaleKeys.global_search_hint.tr()
                  : _animatedHintText,
              controller: widget.searchController,
              onChanged: (value) {
                _debounce.call(() {
                  widget.onSearchChanged?.call(value);
                });
              },
              onFieldSubmitted: (value) => widget.onSearchChanged?.call(value),
              textStyle: Styles.light(context, 16),
              prefixIcon: AppIcons.iconsSearch,
            ),
          ),
        );
      },
    );
  }
}
