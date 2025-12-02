import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/config/di/injectable_config.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_app_bar.dart';
import 'package:elevate_online_exam/features/change_password/presentation/view/widgets/change_password_body.dart';
import 'package:elevate_online_exam/features/change_password/presentation/view_model/cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});
  final cubit = getIt<ChangePasswordCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.change_password_title.tr()),
      body: BlocProvider<ChangePasswordCubit>(
        create: (context) => cubit,
        child: ChangePasswordBody(),
      ),
    );
  }
}
