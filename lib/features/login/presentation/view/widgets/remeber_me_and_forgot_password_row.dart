import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/routes/routes.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RemeberMeAndForgotPasswordRow extends StatefulWidget {
  const RemeberMeAndForgotPasswordRow({super.key});

  @override
  State<RemeberMeAndForgotPasswordRow> createState() =>
      _RemeberMeAndForgotPasswordRowState();
}

class _RemeberMeAndForgotPasswordRowState
    extends State<RemeberMeAndForgotPasswordRow> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  value: context.read<LoginCubit>().isRememberMe,
                  onChanged: (value) {
                    setState(() {
                      context.read<LoginCubit>().isRememberMe = value ?? false;
                    });
                  },
                ),
              ),
              SizedBox(width: 8),
              Text(
                LocaleKeys.login_remember_me.tr(),
                style: Styles.regular(context, 13, color: Color(0xff0F0F0F)),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              // You can navigate to the forgot password screen here
              context.push(Routes.forgetPassword);
            },
            child: Text(
              LocaleKeys.login_forgot_password.tr(),
              style: Styles.regular(
                context,
                12,
                color: Color(0xff0C1015),
              ).copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
