import 'package:e_learning/core/utils/extensions/responsive.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../entities/field.dart';

class CustomFormBuilderTextField extends StatelessWidget {
  final FieldParams fieldModel;
  const CustomFormBuilderTextField({
    super.key,
    required this.fieldModel,
  });
  static bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final border = UnderlineInputBorder(
      borderSide:
          BorderSide(color: Theme.of(context).hintColor.withOpacity(0.2)),
    );
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical:
            context.ResponsiveValu(15, mobile: 5, tablet: 30, desktop: 25),
        horizontal:
            context.ResponsiveValu(15, mobile: 5, tablet: 80, desktop: 70),
      ),
      child: StatefulBuilder(
        builder: (BuildContext context, setState) {
          return FormBuilderTextField(
            // onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            name: fieldModel.label,
            obscureText: fieldModel.isPassword ? obscureText : false,
            maxLines: fieldModel.isPassword ? 1 : fieldModel.maxLines,
            initialValue: fieldModel.initialValue,
            decoration: InputDecoration(
              labelText: fieldModel.label.tr(),
              floatingLabelStyle:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).hintColor.withOpacity(0.5),
                        fontSize: context.ResponsiveValu(14,
                            mobile: 10, tablet: 24, desktop: 30),
                      ),
              labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).hintColor.withOpacity(0.5),
                    fontSize: context.ResponsiveValu(14,
                        mobile: 10, tablet: 24, desktop: 30),
                  ),
              hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).hintColor.withOpacity(0.5),
                    fontSize: context.ResponsiveValu(14,
                        mobile: 10, tablet: 24, desktop: 30),
                  ),
              hintFadeDuration: Duration(milliseconds: 1000),
              errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: context.ResponsiveValu(12,
                        mobile: 10, tablet: 20, desktop: 24),
                  ),
              contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
              border: border,
              enabledBorder: border,
              suffixIcon: fieldModel.isPassword
                  ? InkWell(
                      onTap: () => setState(() => obscureText = !obscureText),
                      child: obscureText
                          ? Icon(
                              Icons.visibility_off_outlined,
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.5),
                            )
                          : Icon(
                              Icons.visibility_outlined,
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.5),
                            ),
                    )
                  : null,
              prefixIcon: Container(
                margin: EdgeInsetsDirectional.only(end: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Icon(
                  fieldModel.icon,
                  color: Colors.white,
                ),
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: context.ResponsiveValu(60,
                    mobile: 40, tablet: 75, desktop: 80),
                minHeight: context.ResponsiveValu(45,
                    mobile: 40, tablet: 60, desktop: 65),
              ),
            ),
            validator: FormBuilderValidators.compose(fieldModel.validators),
          );
        },
      ),
    );
  }
}
