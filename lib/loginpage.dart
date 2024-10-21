import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutterlangchangeapp/other/localized_laguages.dart';
import 'package:flutterlangchangeapp/registrationpage.dart';
import 'notifier/languagenotifier.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  final languageNotifier = LanguageNotifier();
  final TextEditingController searchController = TextEditingController();
  String? selectedLanguage;

  @override
  void initState() {
    super.initState();
    languageNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    languageNotifier.removeListener(() {
      setState(() {});
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizedStrings.getLogin('login', languageNotifier.currentLanguage)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  LocalizedStrings.getLogin('select_language_label', languageNotifier.currentLanguage),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Theme.of(context).colorScheme.onBackground),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    value: selectedLanguage ?? languageNotifier.currentLanguage,
                    hint: Text(
                      LocalizedStrings.getLogin('select_language_label', languageNotifier.currentLanguage),
                      style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                    ),
                    items: LocalizedStrings
                        .language_names[languageNotifier.currentLanguage]!
                        .entries
                        .map<DropdownMenuItem<String>>((entry) {
                      return DropdownMenuItem<String>(
                        value: entry.key,
                        child: Text(
                          entry.value,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLanguage = newValue;
                        if (newValue != null) {
                          languageNotifier.changeLanguage(newValue);
                        }
                      });
                    },
                    dropdownStyleData:  DropdownStyleData(
                      maxHeight: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: searchController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: SizedBox(
                        height: 50,
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: searchController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: LocalizedStrings.getLogin('searchforlanguage', languageNotifier.currentLanguage),
                            hintStyle: TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.onBackground),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value.toString().toLowerCase().contains(searchValue.toLowerCase());
                      },
                    ),
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        searchController.clear();
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 17),
              TextFormField(
                decoration: InputDecoration(
                  labelText: LocalizedStrings.getLogin('username', languageNotifier.currentLanguage),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  _username = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocalizedStrings.getLogin('pleaseenteryourusername', languageNotifier.currentLanguage);
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: LocalizedStrings.getLogin('password', languageNotifier.currentLanguage),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                onChanged: (value) {
                  _password = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocalizedStrings.getLogin('pleaseenteryourpassword', languageNotifier.currentLanguage);
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistrationPage()),
                    );
                  }
                },
                child: Text(LocalizedStrings.getLogin('submit', languageNotifier.currentLanguage)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}