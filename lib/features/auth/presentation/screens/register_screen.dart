import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/enums/string_enums.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_bottom_bar.dart';
import '../components/custom_top_bar.dart';
import '../components/register_components/register_form_builder.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  // _formKey.currentState?.fields['email']
  // ?.invalidate('Email already taken.');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(flex: 1, child: CustomAppBar()),
            Expanded(
              flex: 4,
              child: CustomTopBar(
                title: StringEnums.sign_up.name,
                image: Assets.login,
                message: StringEnums.appMessage.name,
              ),
            ),
            Expanded(
              flex: 8,
              child: RegisterFormBuilder(
                formKey: _formKey,
                onSignWithSocial: () {},
                onSubmit: () {},
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomBar(
          title: StringEnums.already_have_account.name,
          subTitle: StringEnums.login.name,
          route: AppRoutes.login,
        ),
      ),
    );
  }
}
