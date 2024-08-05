import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_todo_list/app_color.dart';
import 'package:new_todo_list/provider/app_config_provider.dart';
import 'package:new_todo_list/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'language_bottom_sheet.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var appConfigProvider = Provider.of<AppConfigProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(locale.language,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 18)),
        ),
        InkWell(
          onTap: (){
            showLanguageBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.only(right: 10 , left: 10 , top: 10 , bottom: 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              border: Border.all(color: AppColor.primaryAppColor)

            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Text(
                  appConfigProvider.appLanguage == 'en'
                      ? locale.english
                      : locale.arabic,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColor.primaryAppColor),
                ),
                Icon(Icons.arrow_drop_down , size: 35,color: AppColor.primaryAppColor,)
            ],
          ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(locale.theme,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 18)),
        ),
        InkWell(
          onTap: (){
            showthemeBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.only(right: 10 , left: 10 , top: 10 , bottom: 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              border: Border.all(color: AppColor.primaryAppColor)

            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Text(
                  appConfigProvider.appTheme == ThemeMode.light
                      ? locale.light_mode
                      : locale.dark_mode,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColor.primaryAppColor),
                ),
                Icon(Icons.arrow_drop_down , size: 35,color: AppColor.primaryAppColor,)
            ],
          ),
          ),
        ),
      ],
    );

  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context)=> LanguageBottomSheet());
  }
  void showthemeBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context)=> ThemeBottomSheet());
  }
}
