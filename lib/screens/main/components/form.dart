import 'package:ahs_website/config/application.dart';
import 'package:ahs_website/constants/const.dart';
import 'package:ahs_website/responsive.dart';
import 'package:ahs_website/utils/services/network_service.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  late String _messageHintText;
  late bool _showLoader;
  String? _formSubmition;

  @override
  void initState() {
    _showLoader = false;
    super.initState();
    focusListener();
  }

  void focusListener() async {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        _messageHintText = '';
      } else {
        _messageHintText = AppLocalizations.of(context)?.hint_message ?? "";
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _messageHintText = AppLocalizations.of(context)?.hint_message ?? "";

    // Build a Form widget using the _formKey created above.
    return Center(
      child: Padding(
        padding: EdgeInsets.all(!Responsive.isMobile(context) ? 25.0 : 15.0),
        child: InkWell(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            decoration: BoxDecoration(
                color: blueColor, borderRadius: BorderRadius.circular(20.0)),
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: <Widget>[
                Opacity(
                  opacity: _showLoader ? 0.3 : 1,
                  child: Form(
                    key: _formKey,
                    child: NotificationListener(
                      child: Scrollbar(
                        controller: _scrollController,
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          controller: _scrollController,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                AppLocalizations.of(context)
                                        ?.send_us_a_message ??
                                    "",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(height: 15.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      text: AppLocalizations.of(context)!
                                          .first_name,
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '*',
                                            style: DefaultTextStyle.of(context)
                                                .style
                                                .copyWith(
                                                    color: Colors.red,
                                                    fontSize: 18)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                controller: _firstNameController,
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                ),
                                validator: (firstName) {
                                  if (firstName?.isEmpty ?? false) {
                                    return "Enter a value";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15.0),
                              Text(AppLocalizations.of(context)?.surname ?? "",
                                  style: Theme.of(context).textTheme.subtitle1),
                              TextFormField(
                                controller: _surnameController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              RichText(
                                text: TextSpan(
                                  text: AppLocalizations.of(context)!.email,
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '*',
                                        style: DefaultTextStyle.of(context)
                                            .style
                                            .copyWith(
                                                color: Colors.red,
                                                fontSize: 18)),
                                  ],
                                ),
                              ),
                              TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                ),
                                validator: (email) {
                                  if (!email!.contains('@') &&
                                      !email.contains('.')) {
                                    return AppLocalizations.of(context)
                                            ?.valid_email ??
                                        "";
                                  }
                                  return null;
                                },
                                // The validator receives the text that the user has entered.
                              ),
                              const SizedBox(height: 15.0),
                              Text(
                                  AppLocalizations.of(context)?.cell_phone ??
                                      "",
                                  style: Theme.of(context).textTheme.subtitle1),
                              _buildPhonePickerItem(),
                              const SizedBox(height: 15.0),
                              RichText(
                                text: TextSpan(
                                  text: AppLocalizations.of(context)!.message,
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '*',
                                        style: DefaultTextStyle.of(context)
                                            .style
                                            .copyWith(
                                                color: Colors.red,
                                                fontSize: 18)),
                                  ],
                                ),
                              ),
                              TextFormField(
                                minLines: 6,
                                controller: _messageController,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                focusNode: focusNode,
                                inputFormatters: [
                                  /// Limiting to 50 Characters
                                  LengthLimitingTextInputFormatter(50),
                                ],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: _messageHintText,
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                ),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)
                                            ?.message ??
                                        "";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  if (_formSubmition != null &&
                                      _formSubmition!.isNotEmpty) ...[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.pinkAccent,
                                        border: Border.all(
                                            color: const Color(0xFFdefff0)),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(30.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          _formSubmition ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ] else ...[
                                    Container()
                                  ],
                                  ElevatedButton(
                                    onPressed: () async {
                                      // Validate returns true if the form is valid, or false otherwise.
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          _showLoader = true;
                                        });

                                        var response = await Network.sendData(
                                            http.Client(),
                                            "https://websiteahappyspacemailer-r3iqxnqupq-el.a.run.app/api/send-mail",
                                            {
                                              "first_name":
                                                  _firstNameController.text,
                                              "surname":
                                                  _surnameController.text,
                                              "email": _emailController.text,
                                              "phone": _phoneController.text,
                                              "message":
                                                  _messageController.text,
                                            });

                                        setState(() {
                                          _showLoader = false;
                                        });
                                        if ((response["has_error"] ?? true) ==
                                            false) {
                                          _formSubmition =
                                              response["error_message"];
                                          clearFormData();
                                          setState(() {});
                                          await Future.delayed(
                                              const Duration(seconds: 5), () {
                                            setState(() {
                                              _formSubmition = null;
                                            });
                                          });
                                        } else {
                                          _formSubmition =
                                              response["error_message"] ??
                                                  "Something went wrong";
                                          setState(() {});
                                          await Future.delayed(
                                            const Duration(seconds: 5),
                                            () {
                                              setState(() {
                                                _formSubmition = null;
                                              });
                                            },
                                          );
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10.0),
                                      child: Text(
                                          AppLocalizations.of(context)?.send ??
                                              "",
                                          style: const TextStyle(
                                              color: Colors.black)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (_showLoader) ...[
                  const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhonePickerItem() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 0,
          child: CountryCodePicker(
            hideMainText: true,
            showCountryOnly: true,
            onInit: ((value) {
              _phoneController.text = value?.dialCode ?? "";
            }),
            onChanged: ((value) {
              setState(() {
                Application.countryCode = value.code!;
                _phoneController.text = value.dialCode!;
              });
            }),
            initialSelection: Application.countryCode,
            // flag can be styled with BoxDecoration's `borderRadius` and `shape` fields
            flagDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
            ),
            showFlag: true,
          ),
        ),
        Expanded(
          flex: 1,
          child: TextField(
            controller: _phoneController,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.0),
              ),
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
      ],
    );
  }

  void clearFormData() async {
    _phoneController.text = _firstNameController.text = _surnameController
        .text = _emailController.text = _messageController.text = "";
  }
}
