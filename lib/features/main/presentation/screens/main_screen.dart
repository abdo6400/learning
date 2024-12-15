import 'package:e_learning/core/utils/extensions/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../core/components/global_form_builder/custom_form_builder.dart';
import '../../../../core/entities/field.dart';
import '../../../../core/entities/form.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/enums/string_enums.dart';
import '../../../my_courses/presentation/bloc/my_courses_bloc.dart';
import '../../../my_courses/presentation/screens/my_courses_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static final iconList = <IconData>[
    Icons.home_outlined,
    Icons.school_outlined,
    Icons.notifications_outlined,
    Icons.person_2_outlined
  ];
  static PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  static final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: locator<MyCoursesBloc>()..add(GetMyCoursesEvent()),
          )
        ],
        child: PersistentTabView(
          context,
          controller: _controller,
          navBarHeight: context.ResponsiveValu(kBottomNavigationBarHeight,
              mobile: kBottomNavigationBarHeight,
              tablet: kBottomNavigationBarHeight + 20,
              desktop: kBottomNavigationBarHeight + 50),
          onItemSelected: (int index) {},
          screens: [
            Card(
              child: CustomFormBuilder(FormParams(
                formKey: formKey,
                fields: [
                  for (int i = 0; i < 8; i++)
                    FieldParams(
                      label: StringEnums.noteTitlePlaceholder.name,
                      icon: Icons.title_outlined,
                      validators: [
                        FormBuilderValidators.required(
                            errorText: StringEnums.noteTitleRequired.name.tr()),
                      ],
                    ),
                ],
              )),
            ),
            MyCoursesScreen(),
            Card(
              child: Text("data3"),
            ),
            Card(
              child: Text("data4"),
            ),
          ],
          items: iconList
              .map((e) => PersistentBottomNavBarItem(
                    icon: Icon(
                      e,
                      size: context.ResponsiveValu(25,
                          mobile: 20, tablet: 40, desktop: 50),
                    ),
                    activeColorPrimary: Theme.of(context).colorScheme.primary,
                    inactiveColorPrimary: Theme.of(context).hintColor,
                  ))
              .toList(),
          resizeToAvoidBottomInset: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings(
              duration: Duration(milliseconds: 500),
              curve: Curves.linear,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              animateTabTransition: true,
              duration: Duration(milliseconds: 400),
              screenTransitionAnimationType:
                  ScreenTransitionAnimationType.slide,
            ),
          ),
          navBarStyle: NavBarStyle.style5,
        ),
      ),
    );
  }
}
