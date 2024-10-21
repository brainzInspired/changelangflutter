class LocalizedStrings {
  static final Map<String, Map<String, String>> login_lang_page = {
    'English': {
      'login': 'Login',
      'language': 'Select your preferred language here',
      'username': 'UserName',
      'password': 'Password',
      'select_language_label': 'Select Language',
      'submit': 'Submit',
      'searchforlanguage': 'Search for a language...',
      'pleaseenteryourusername': 'Please enter your username',
      'pleaseenteryourpassword': 'Please enter your password'
    },
    'Hindi': {
      'login': 'लॉगिन',
      'language': 'यहां अपनी पसंदीदा भाषा चुनें',
      'username': 'उपयोगकर्ता नाम',
      'password': 'पासवर्ड',
      'select_language_label': 'भाषा चुनें',
      'submit': 'जमा करें',
      'searchforlanguage': 'एक भाषा खोजें...',
      'pleaseenteryourusername': 'कृपया अपना उपयोगकर्ता नाम दर्ज करें',
      'pleaseenteryourpassword': 'कृपया अपना पासवर्ड दर्ज करें'
    }
  };

  static final Map<String, Map<String, String>> register_page = {
    'English': {
      'registration': 'Registration',
      'name': 'Name',
      'mobile': 'Mobile',
      'email': 'Email',
      'age': 'Age',
      'username': 'Username',
      'password': 'Password',
      'submit': 'Submit',
      'searchforlanguage': 'Search for a language...',
      'select_language_label': 'Select Language',
      'pleaseenteryourname': 'Please enter your name',
      'pleaseentermobilenumber': 'Please enter your mobile number',
      'pleaseenteryouremail': 'Please enter your email',
      'pleaseentervalidemail': 'Please enter a valid email',
      'pleaseenteryourage': 'Please enter your age',
      'pleaseenteryourusername': 'Please enter your username',
      'pleaseenteryourpassword': 'Please enter your password',
    },
    'Hindi': {
      'registration': 'पंजीकरण',
      'name': 'नाम',
      'mobile': 'मोबाइल',
      'email': 'ईमेल',
      'age': 'आयु',
      'username': 'उपयोगकर्ता नाम',
      'password': 'पासवर्ड',
      'submit': 'प्रस्तुत करें',
      'searchforlanguage': 'भाषा शोधा...',
      'select_language_label': 'भाषा चुनें',
      'pleaseenteryourname': 'कृपया अपना नाम दर्ज करें',
      'pleaseentermobilenumber': 'कृपया अपना मोबाइल नंबर दर्ज करें',
      'pleaseenteryouremail': 'कृपया अपना ईमेल दर्ज करें',
      'pleaseentervalidemail': 'कृपया एक मान्य ईमेल दर्ज करें',
      'pleaseenteryourage': 'कृपया अपनी उम्र दर्ज करें',
      'pleaseenteryourusername': 'कृपया अपना उपयोगकर्ता नाम दर्ज करें',
      'pleaseenteryourpassword': 'कृपया अपना पासवर्ड दर्ज करें'
    }
  };


  static final Map<String, Map<String, String>> dash_lang_page = {
    'English': {
      'searchforlanguage': 'Search for a language...',
      'dashboard_label': 'Language App',
      'name': 'Name',
      'mobile': 'Mobile',
      'email': 'Email',
      'age': 'Age',
      'select_language_label': 'Select Language'
    },
    'Hindi': {
      'searchforlanguage': 'भाषा शोधा...',
      'dashboard_label': 'भाषा ऐप',
      'name': 'नाम',
      'mobile': 'मोबाइल',
      'email': 'ईमेल',
      'age': 'आयु',
      'select_language_label': 'भाषा चुनें'
    }
  };

  static final Map<String, Map<String, String>> language_names = {
    'English': {
      'English': 'English',
      'Hindi': 'हिन्दी',
    },
    'Hindi': {
      'English': 'English',
      'Hindi': 'हिन्दी',
    },
  };

  static String getLogin(String key, String language) {
    return login_lang_page[language]![key]!;
  }

  static String getRegister(String key, String language) {
    return register_page[language]![key]!;
  }

  static String getDashboard(String key, String language) {
    return dash_lang_page[language]![key]!;
  }

  static String getLanguageName(String languageCode, String selectedLanguage) {
    return language_names[selectedLanguage]![languageCode]!;
  }
}
