import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sintomed_app/routes.dart';
import 'package:sintomed_app/src/stores/auth/auth_store.dart';
import 'package:sintomed_app/src/ui/widgets/error_widget.dart';
import 'package:sintomed_app/src/ui/widgets/loading_widget.dart';
import 'package:sintomed_app/src/ui/widgets/button_widget.dart';
import 'package:sintomed_app/src/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  AuthStore _authStore;
  bool loading = false;
  bool error = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _authStore = Provider.of<AuthStore>(context);
  }

  Widget _getLoginForm() {
    Color _cursorColor = kPrimaryColor.shade900;
    bool _disabled = loading || error;
    print('_disabled $_disabled');

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            cursorColor: _cursorColor,
            decoration: InputDecoration(labelText: 'Email'),
            enabled: !_disabled,
            validator: (value) {
              if (_authStore.email.isEmpty) {
                return 'Digite um email válido';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            onChanged: _authStore.onChangeEmail,
          ),
          TextFormField(
            cursorColor: _cursorColor,
            decoration: InputDecoration(labelText: 'Senha'),
            enabled: !_disabled,
            validator: (value) {
              if (_authStore.password.isEmpty) {
                return 'Digite uma senha válido';
              }
              return null;
            },
            obscureText: true,
            onChanged: _authStore.onChangePassword,
          ),
          _authStore.loginError ? Text('Error') : Container(),
        ],
      ),
    );
  }

  Widget _getLoginButton() {
    bool _disabled = loading || error;
    return ButtonWidget(
      onPressed: !_disabled
          ? () async {
              setState(() {
                loading = true;
              });
              if (_formKey.currentState.validate()) {
                var result = await _authStore.logInUser();

                if (result == true) {
                  await Navigator.pushNamed(context, Routes.home);
                } else {
                  setState(() {
                    error = true;
                  });
                }
              }

              setState(() {
                loading = false;
              });
            }
          : null,
      text: 'Login',
      type: ButtonType.raised,
    );
  }

  Widget _getLoginScreen() {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _getLoginForm(),
              _getLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          print('_authStore.loginLoading ${_authStore.loginLoading}');
          print('loading ${loading}');
          print('_authStore.loginError ${_authStore.loginError}');
          print('_authStore.error ${_authStore.error}');
          return Stack(
            children: <Widget>[
              _getLoginScreen(),
              loading ? LoadingWidget() : Container(),
              error ? ErroWidget() : Container(),
            ],
          );
        },
      ),
    );
  }
}
