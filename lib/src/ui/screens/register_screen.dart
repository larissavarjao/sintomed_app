import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sintomed_app/routes.dart';
import 'package:sintomed_app/src/stores/user/user_store.dart';
import 'package:sintomed_app/src/ui/widgets/dialog_widget.dart';
import 'package:sintomed_app/src/ui/widgets/loading_widget.dart';
import 'package:sintomed_app/src/ui/widgets/rounded_button_widget.dart';
import 'package:sintomed_app/src/utils/colors.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  UserStore _userStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _userStore = Provider.of<UserStore>(context);
  }

  Future<void> _showErrorDialog(String errorMessage) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DialogWidget(
          text: errorMessage,
          type: DialogType.error,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Observer(
        builder: (_) {
          if (_userStore.loading) {
            return LoadingWidget();
          }

          if (_userStore.error) {
            _showErrorDialog('Ocorreu um erro ao realizar o cadastro.');
          }

          return Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        TextFormField(
                          cursorColor: kPrimaryColor.shade900,
                          decoration: InputDecoration(labelText: 'Nome'),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Digite um nome válido';
                            }
                            return null;
                          },
                          onChanged: _userStore.onChangeFirstName,
                        ),
                        TextFormField(
                          cursorColor: kPrimaryColor.shade900,
                          decoration: InputDecoration(labelText: 'Sobrenome'),
                          onChanged: _userStore.onChangeLastName,
                        ),
                        TextFormField(
                          cursorColor: kPrimaryColor.shade900,
                          decoration:
                              InputDecoration(labelText: 'Nome do Paciente'),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Digite um nome de paciente válido';
                            }
                            return null;
                          },
                          onChanged: _userStore.onChangePacienttName,
                        ),
                        TextFormField(
                          cursorColor: kPrimaryColor.shade900,
                          decoration: InputDecoration(labelText: 'Email'),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Digite um email válido';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          onChanged: _userStore.onChangeEmail,
                        ),
                        TextFormField(
                          cursorColor: kPrimaryColor.shade900,
                          decoration: InputDecoration(labelText: 'Senha'),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Digite uma senha válido';
                            }
                            return null;
                          },
                          obscureText: true,
                          onChanged: _userStore.onChangePassword,
                        ),
                        TextFormField(
                          cursorColor: kPrimaryColor.shade900,
                          decoration:
                              InputDecoration(labelText: 'Confirme sua senha'),
                          validator: (value) {
                            if (value.isEmpty ||
                                !_userStore.isPasswordsEquals) {
                              return 'Senhas não batem';
                            }
                            return null;
                          },
                          obscureText: true,
                          onChanged: _userStore.onChangeConfirmPassword,
                        ),
                      ],
                    ),
                  ),
                  RoundedButtonWidget(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        print('validado');
                        bool isUserRegistered = await _userStore.registerUser();
                        print('isUserRegistered $isUserRegistered');

                        if (isUserRegistered) {
                          print('vou para login');
                          Navigator.pushNamed(context, Routes.login);
                        } else {
                          print('ocorreu um erro');
                          _showErrorDialog(
                              'Ocorreu um erro ao registrar usuário.');
                        }
                      }
                    },
                    text: 'Cadastrar',
                  )
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
