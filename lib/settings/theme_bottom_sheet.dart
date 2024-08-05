import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_todo_list/app_color.dart';
import 'package:new_todo_list/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var appConfigProvider = Provider.of<AppConfigProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                appConfigProvider.changetheme(ThemeMode.light);
              },
              child: appConfigProvider.appTheme == ThemeMode.light
                  ? getSelctedWidget(locale.light_mode)
                  : getUnSelectedWidget(locale.light_mode)),
          SizedBox(
            height: MediaQuery.of(context).size.height * .010,
          ),
          InkWell(
              onTap: () {
                appConfigProvider.changetheme(ThemeMode.dark);
              },
              child: appConfigProvider.appTheme == ThemeMode.dark
                  ? getSelctedWidget(locale.dark_mode)
                  : getUnSelectedWidget(locale.dark_mode)),
        ],
      ),
    );
  }

  Widget getSelctedWidget(String text) {
    var locale = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 22, color: AppColor.primaryAppColor),
        ),
        Icon(
          Icons.check,
          color: AppColor.primaryAppColor,
        )
      ],
    );
  }

  getUnSelectedWidget(String text) {
    return Text(text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 22));
  }
}
