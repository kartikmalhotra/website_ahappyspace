import 'package:ahs_website/config/application.dart';
import 'package:ahs_website/shared/bloc/selected_language/select_language_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectLanguageDailog extends StatefulWidget {
  const SelectLanguageDailog({Key? key}) : super(key: key);

  @override
  State<SelectLanguageDailog> createState() => _SelectLanguageDailogState();
}

class _SelectLanguageDailogState extends State<SelectLanguageDailog> {
  List<Map<String, dynamic>> values = [
    {
      'value': Application.preferedLanguage == "en",
      'property': "en",
      'name': "English",
    },
    {
      'value': Application.preferedLanguage == "zu",
      'property': 'zu',
      'name': "Zulu",
    },
    {
      'value': Application.preferedLanguage == "xh",
      'property': 'xh',
      'name': "Xhosa",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(AppLocalizations.of(context)?.select_a_language ?? "")),
      actionsPadding: const EdgeInsets.all(10.0),
      titlePadding: const EdgeInsets.all(20.0),
      actions: [
        ElevatedButton(
          onPressed: () {
            for (int i = 0; i < values.length; i++) {
              if (values[i]['value']) {
                BlocProvider.of<SelectLanguageBloc>(context)
                    .add(LanguageChanged(languageCode: values[i]['property']));
              }
            }
            Navigator.pop(context);
          },
          child: Text(AppLocalizations.of(context)?.apply ?? "",
              style: Theme.of(context).textTheme.subtitle1!),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text(AppLocalizations.of(context)?.cancel ?? "",
              style: Theme.of(context).textTheme.subtitle1),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ...values.map((key) {
            return CheckboxListTile(
              checkColor: Colors.white,
              title: Text(key['name']),
              value: key['value'],
              onChanged: (bool? value) {
                if (mounted) {
                  setState(() {
                    values.map((e) => e['value'] = false).toList();
                    key['value'] = !key['value'];
                  });
                }
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
