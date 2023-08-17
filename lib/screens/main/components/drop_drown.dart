import 'package:ahs_website/config/application.dart';
import 'package:ahs_website/shared/bloc/selected_language/select_language_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  late String _dropdownValue;

  @override
  void initState() {
    setDropDown();
    super.initState();
  }

  void setDropDown() {
    if (Application.preferedLanguage == "en") {
      _dropdownValue = 'English';
    } else if (Application.preferedLanguage == "zu") {
      _dropdownValue = 'Zulu';
    } else {
      _dropdownValue = 'Xhosa';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      dropdownColor: Colors.white,
      style: Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(color: Colors.deepPurple),
      iconEnabledColor: Colors.deepPurple,
      borderRadius: BorderRadius.circular(5.0),
      underline: Container(height: 0),
      onChanged: (String? newValue) {
        if (mounted) {
          setState(() {
            _dropdownValue = newValue!;
            BlocProvider.of<SelectLanguageBloc>(context).add(LanguageChanged(
              languageCode: newValue.toLowerCase().substring(0, 2),
            ));
          });
        }
      },
      items: <String>['English', 'Zulu', 'Xhosa']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
