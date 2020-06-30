import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  final Future<SharedPreferences> _sharedPreference;
  static final token = 'token';

  SharedPrefService(this._sharedPreference);

  Future<String> get authToken async {
    return _sharedPreference.then((pref) {
      return pref.getString(token);
    });
  }

  Future<void> saveAuthToken(String authToken) async {
    return _sharedPreference.then((pref) {
      pref.setString(token, authToken);
    });
  }

  Future<void> removeAuthToken() async {
    return _sharedPreference.then((pref) {
      pref.remove(token);
    });
  }

  Future<bool> get isLoggedIn async {
    return _sharedPreference.then((pref) {
      return pref.getString(token) != null;
    });
  }
}
