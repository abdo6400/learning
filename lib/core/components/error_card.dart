import 'package:e_learning/core/utils/extensions/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/enums/string_enums.dart';

class ErrorCard extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;
  const ErrorCard({super.key, this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: context.ResponsiveValu(10, mobile: 5, tablet: 15),
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
              (message?.contains(StringEnums.no_internet_connection.name) !=
                          null &&
                      message!
                          .contains(StringEnums.no_internet_connection.name))
                  ? Icons.signal_wifi_connected_no_internet_4_outlined
                  : Icons.error_outline,
              size: context.ResponsiveValu(45,
                  mobile: 40, tablet: 55, desktop: 70),
              color: Theme.of(context).colorScheme.error),
          Text(
            StringEnums.error.name.tr(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: context.ResponsiveValu(16,
                      mobile: 12, tablet: 24, desktop: 30),
                ),
          ),
          if (message != null)
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: context.ResponsiveValu(12,
                        mobile: 8, tablet: 20, desktop: 30),
                  ),
            ),
          TextButton(
              onPressed: () => onRetry!(),
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).scaffoldBackgroundColor),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.error)),
                    ),
                  ),
              child: Text(
                StringEnums.retry.name.tr(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: context.ResponsiveValu(12,
                          mobile: 8, tablet: 20, desktop: 30),
                    ),
              ))
        ],
      ),
    );
  }
}
