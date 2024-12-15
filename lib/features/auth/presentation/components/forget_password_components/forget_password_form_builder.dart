import 'package:e_learning/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../../core/components/global_form_builder/custom_form_builder.dart';
import '../../../../../core/entities/field.dart';
import '../../../../../core/entities/form.dart';
import '../../../../../core/utils/enums/string_enums.dart';
import '../custom_sign_button.dart';

class ForgetPasswordFormBuilder extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey;
  final VoidCallback onSubmit;
  const ForgetPasswordFormBuilder(
      {super.key,
      required GlobalKey<FormBuilderState> formKey,
      required this.onSubmit})
      : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomFormBuilder(
            FormParams(
              formKey: _formKey,
              fields: [
                FieldParams(
                  label: StringEnums.email.name,
                  validators: [],
                  icon: Icons.email_outlined,
                ),
              ],
            ),
          ),
          SizedBox(
            height:
                context.ResponsiveValu(20, mobile: 10, tablet: 30, desktop: 35),
          ),
          CustomSignButton(
            buttonLabel: StringEnums.send_email.name,
            iconData: Icons.arrow_forward,
            onSubmit: () {
              if (_formKey.currentState!.saveAndValidate()) {
                onSubmit();
              }
            },
          ),
        ],
      ),
    );
  }
}
