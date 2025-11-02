import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/theme/app_icons.dart';
import 'package:elevate_online_exam/features/app_layout/presentation/view_model/cubit/icon_bottom_nav_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/languages/locale_keys.g.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../view_model/cubit/app_layout_cubit.dart';
import '../../view_model/cubit/app_layout_states.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final appLayoutCubit = context.read<AppLayoutCubit>();
    return BlocBuilder<AppLayoutCubit, AppLayoutStates>(
      builder: (context, state) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: state.changeIndexState?.currentIndex == 0
                  ? IconBottomNavContainer(iconPath: AppIcons.iconsHome)
                  : SvgPicture.asset(
                      AppIcons.iconsHome,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryLight,
                        BlendMode.srcIn,
                      ),
                    ),
              label: LocaleKeys.app_layout_explore.tr(),
            ),
            BottomNavigationBarItem(
              icon: state.changeIndexState?.currentIndex == 1
                  ? IconBottomNavContainer(iconPath: AppIcons.iconsResults)
                  : SvgPicture.asset(
                      AppIcons.iconsResults,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryLight,
                        BlendMode.srcIn,
                      ),
                    ),
              label: LocaleKeys.app_layout_result.tr(),
            ),
            BottomNavigationBarItem(
              icon: state.changeIndexState?.currentIndex == 2
                  ? IconBottomNavContainer(iconPath: AppIcons.iconsPerson)
                  : SvgPicture.asset(
                      AppIcons.iconsPerson,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryLight,
                        BlendMode.srcIn,
                      ),
                    ),
              label: LocaleKeys.app_layout_profile.tr(),
            ),
          ],
          currentIndex: state.changeIndexState?.currentIndex ?? 0,
          onTap: (index) {
            appLayoutCubit.changeIndex(index);
          },
        );
      },
    );
  }
}
