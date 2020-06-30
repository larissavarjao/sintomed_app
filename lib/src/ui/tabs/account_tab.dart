import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sintomed_app/routes.dart';
import 'package:sintomed_app/src/stores/auth/auth_store.dart';

class AccountTab extends StatefulWidget {
  @override
  _AccountTabState createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  AuthStore _authStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _authStore = Provider.of<AuthStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: RaisedButton(
            onPressed: () async {
              await _authStore.logOutUser();
              Navigator.of(context).pushReplacementNamed(Routes.splash);
            },
            child: Text('Sair'),
          ),
        ),
      ),
    );
  }
}
