import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helper/classes/debounce.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import 'custom_text_field.dart';

class SearchWidget extends StatefulWidget {
  final Function(String?)? onSearchChanged;
  final TextEditingController searchController;
  final void Function(String?)? onFieldSubmitted;
  final String hintTitle;
  const SearchWidget({
    super.key,
    this.onSearchChanged,
    required this.searchController,
    this.onFieldSubmitted,
    required this.hintTitle,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late final Debounce _debounce;

  String _fullHint = '';
  String _animatedHint = '';
  int _hintIndex = 0;
  Timer? _typingTimer;

  @override
  void initState() {
    super.initState();
    _debounce = Debounce();
    _animatedHint = '';
    _fullHint = widget.hintTitle; // Your full hint text

    _startTypingAnimation();
  }

  void _startTypingAnimation() {
    _animatedHint = '';
    _hintIndex = 0;

    _typingTimer?.cancel();
    _typingTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_hintIndex < _fullHint.length) {
        setState(() {
          _animatedHint += _fullHint[_hintIndex];
          _hintIndex++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _debounce.dispose();
    _typingTimer?.cancel();
    widget.searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.searchController,
      onChanged: (value) {
        _debounce(() {
          if (widget.onSearchChanged != null) {
            widget.onSearchChanged!(value);
          }
        });
      },
      onFieldSubmitted: widget.onFieldSubmitted,
      suffixWidget: AnimatedRotation(
        turns: widget.searchController.text.isNotEmpty ? 0.25 : 0,
        duration: Duration(
          milliseconds: widget.searchController.text.isNotEmpty ? 500 : 200,
        ),
        curve: Curves.easeInOut,
        child: AnimatedScale(
          scale: widget.searchController.text.isNotEmpty ? 1 : 0,
          duration: Duration(
            milliseconds: widget.searchController.text.isNotEmpty ? 200 : 500,
          ),
          curve: Curves.easeInOut,
          child: IconButton(
            onPressed: () {
              widget.searchController.clear();
            },
            icon: Icon(Icons.close, color: AppColors.gray87),
          ),
        ),
      ),
      prefixWidget: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        builder: (context, scale, child) {
          return Transform.scale(scale: scale, child: child);
        },
        child: SvgPicture.asset(
          AppIcons.iconsSearch,
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
        ),
      ),
      hintText: _animatedHint,
      maxLine: 1,
    );
  }
}
