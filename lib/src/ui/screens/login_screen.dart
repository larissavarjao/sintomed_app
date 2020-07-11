import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sintomed_app/routes.dart';
import 'package:sintomed_app/src/stores/auth/auth_store.dart';
import 'package:sintomed_app/src/ui/widgets/error_widget.dart';
import 'package:sintomed_app/src/ui/widgets/loading_widget.dart';
import 'package:sintomed_app/src/ui/widgets/rounded_button_widget.dart';
import 'package:sintomed_app/src/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
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
      body: Observer(
        builder: (_) {
          if (_authStore.loading) {
            return LoadingWidget();
          }

          if (_authStore.error) {
            return ErroWidget();
          }

          return SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            cursorColor: kPrimaryColor.shade900,
                            decoration: InputDecoration(labelText: 'Email'),
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
                            cursorColor: kPrimaryColor.shade900,
                            decoration: InputDecoration(labelText: 'Senha'),
                            validator: (value) {
                              if (_authStore.password.isEmpty) {
                                return 'Digite uma senha válido';
                              }
                              return null;
                            },
                            obscureText: true,
                            onChanged: _authStore.onChangePassword,
                          ),
                        ],
                      ),
                    ),
                    RoundedButtonWidget(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          var result = await _authStore.logInUser();

                          if (result) {
                            await Navigator.pushNamed(context, Routes.home);
                          }
                        }
                      },
                      text: 'Login',
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
