import 'package:e_learning/core/utils/extensions/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/enums/string_enums.dart';
import '../components/custom_app_bar.dart';
import '../components/forget_password_components/forget_password_form_builder.dart';
import '../components/otp_dialog.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _otpFormKey = GlobalKey<FormBuilderState>();
  void showOtpDialog(context) {
    showDialog(
        barrierColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
        context: context,
        builder: (context) => OtpDialog(
              formKey: _otpFormKey,
              onSubmit: () {},
              onResendOtp: () {},
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: CustomAppBar(canPop: true),
            ),
            Expanded(child: SizedBox()),
            Expanded(
              flex: 5,
              child: Image(image: const AssetImage(Assets.forgetPassword)),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      StringEnums.reset_password.name.tr(),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: context.ResponsiveValu(16,
                                    mobile: 14, tablet: 30, desktop: 35),
                              ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      StringEnums.reset_password_description.name.tr(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: context.ResponsiveValu(13,
                                mobile: 12, tablet: 19, desktop: 35),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
            Expanded(
              flex: 8,
              child: ForgetPasswordFormBuilder(
                formKey: _formKey,
                onSubmit: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
