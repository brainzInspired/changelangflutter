import 'package:flutter/material.dart';
import 'package:flutterlangchangeapp/other/localized_laguages.dart';

import 'notifier/languagenotifier.dart';

class Dashboard extends StatefulWidget {
   Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Sample user data
  final String _name = 'brainzed';
  final String _mobile = '9898989899';
  final String _email = 'brainz@gmail.com';
  final String _age = '23';

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
        title: Text(LocalizedStrings.getDashboard('dashboard_label', languageNotifier.currentLanguage)),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
             '${LocalizedStrings.getDashboard('name', languageNotifier.currentLanguage)}$_name',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '${LocalizedStrings.getDashboard('mobile', languageNotifier.currentLanguage)}$_mobile',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '${LocalizedStrings.getDashboard('email', languageNotifier.currentLanguage)}$_email',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '${LocalizedStrings.getDashboard('age', languageNotifier.currentLanguage)}$_age',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
