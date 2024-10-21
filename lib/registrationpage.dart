import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutterlangchangeapp/dashboard.dart';

import 'notifier/languagenotifier.dart';
import 'other/localized_laguages.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _mobile = '';
  String _email = '';
  String _age = '';
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
        title: Text(LocalizedStrings.getRegister('registration', languageNotifier.currentLanguage)),
        actions: [
          DropdownButton<String>(
            icon: Row(
              children: [
                Icon(Icons.language, color: Colors.white), // Icon for language selection
                SizedBox(width: 40), // Add some spacing between the icon and text
              ],
            ),
            underline: const SizedBox(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                languageNotifier.changeLanguage(newValue); // Use changeLanguage
              }
            },
            items: LocalizedStrings.language_names[languageNotifier.currentLanguage]!.entries.map<DropdownMenuItem<String>>((entry) {
              return DropdownMenuItem<String>(
                value: entry.key,
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Text(entry.value,style: TextStyle(color:  Theme.of(context).colorScheme.onBackground)),
                  ],
                ),
              );
            }).toList(),
            dropdownColor: Theme.of(context).colorScheme.inversePrimary,
          ),
        ],
      ),
      body: SingleChildScrollView( // Make the body scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: LocalizedStrings.getRegister('name', languageNotifier.currentLanguage),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    _name = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocalizedStrings.getRegister('pleaseenteryourname', languageNotifier.currentLanguage);
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: LocalizedStrings.getRegister('mobile', languageNotifier.currentLanguage),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    _mobile = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocalizedStrings.getRegister('pleaseentermobilenumber', languageNotifier.currentLanguage);
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: LocalizedStrings.getRegister('email', languageNotifier.currentLanguage),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    _email = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocalizedStrings.getRegister('pleaseenteryouremail', languageNotifier.currentLanguage);
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return LocalizedStrings.getRegister('pleaseentervalidemail', languageNotifier.currentLanguage);
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: LocalizedStrings.getRegister('age', languageNotifier.currentLanguage),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _age = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocalizedStrings.getRegister('pleaseenteryourage', languageNotifier.currentLanguage);
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: LocalizedStrings.getRegister('username', languageNotifier.currentLanguage),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    _username = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocalizedStrings.getRegister('pleaseenteryourusername', languageNotifier.currentLanguage);
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: LocalizedStrings.getRegister('password', languageNotifier.currentLanguage),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    _password = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocalizedStrings.getRegister('pleaseenteryourpassword', languageNotifier.currentLanguage);
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
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    }
                  },
                  child: Text(LocalizedStrings.getRegister('submit', languageNotifier.currentLanguage)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}