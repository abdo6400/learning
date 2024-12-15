import 'package:e_learning/core/components/global_form_builder/custom_form_builder.dart';
import 'package:e_learning/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../../core/entities/field.dart';
import '../../../../../core/entities/form.dart';
import '../../../../../core/utils/enums/string_enums.dart';
import '../custom_sign_button.dart';
import '../sign_with_social.dart';

class RegisterFormBuilder extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey;
  final VoidCallback onSubmit;
  final VoidCallback onSignWithSocial;
  const RegisterFormBuilder({
    super.key,
    required GlobalKey<FormBuilderState> formKey,
    required this.onSubmit,
    required this.onSignWithSocial,
  }) : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomFormBuilder(FormParams(
            formKey: _formKey,
            fields: [
              FieldParams(
                label: StringEnums.user_name.name,
                icon: Icons.person_outline,
                validators: [],
              ),
              FieldParams(
                label: StringEnums.email.name,
                icon: Icons.email_outlined,
                validators: [],
              ),
              FieldParams(
                label: StringEnums.phone.name,
                icon: Icons.phone_outlined,
                validators: [],
              ),
              FieldParams(
                label: StringEnums.password.name,
                isPassword: true,
                icon: Icons.lock_outline,
                validators: [],
              ),
            ],
          )),
          SizedBox(
            height:
                context.ResponsiveValu(10, mobile: 5, tablet: 20, desktop: 25),
          ),
          CustomSignButton(
            buttonLabel: StringEnums.sign_up.name,
            onSubmit: () {
              if (_formKey.currentState!.saveAndValidate()) {
                onSubmit();
              }
            },
          ),
          SizedBox(
            height:
                context.ResponsiveValu(10, mobile: 5, tablet: 20, desktop: 25),
          ),
          SignWithSocial(
            buttonLabel: StringEnums.sign_with_google.name,
            onPressed: () => onSignWithSocial(),
          )
        ],
      ),
    );
  }
}
