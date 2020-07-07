import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sintomed_app/routes.dart';
import 'package:sintomed_app/src/stores/auth/auth_store.dart';
import 'package:sintomed_app/src/ui/widgets/dialog_widget.dart';
import 'package:sintomed_app/src/ui/widgets/field_register_widget.dart';
import 'package:sintomed_app/src/ui/widgets/loading_widget.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  List<GlobalKey<FormState>> _formsKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];
  final _formsPageViewController = PageController();
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

  FieldRegisterWidget getFirstNameForm(int index) {
    return FieldRegisterWidget(
        onWillPop: () => Future.sync(onWillPop),
        labelText: 'Nome',
        validator: (value) {
          if (value.isEmpty) {
            return 'Digite um nome válido';
          }
          return null;
        },
        onChanged: _authStore.onChangeFirstName,
        onContinue: () => nextFormStep(index),
        formKey: _formsKeys[index]);
  }

  FieldRegisterWidget getlastNameForm(int index) {
    return FieldRegisterWidget(
        onWillPop: () => Future.sync(onWillPop),
        labelText: 'Sobrenome',
        onChanged: _authStore.onChangeLastName,
        onContinue: () => nextFormStep(index),
        onCancel: onWillPop,
        formKey: _formsKeys[index]);
  }

  FieldRegisterWidget getPacientNameForm(int index) {
    return FieldRegisterWidget(
        onWillPop: () => Future.sync(onWillPop),
        labelText: 'Nome do Paciente',
        validator: (value) {
          if (value.isEmpty) {
            return 'Digite um nome de paciente válido';
          }
          return null;
        },
        onChanged: _authStore.onChangePacienttName,
        onContinue: () => nextFormStep(index),
        onCancel: onWillPop,
        formKey: _formsKeys[index]);
  }

  FieldRegisterWidget getEmailForm(int index) {
    return FieldRegisterWidget(
      onWillPop: () => Future.sync(onWillPop),
      labelText: 'Email',
      validator: (value) {
        if (value.isEmpty) {
          return 'Digite um email válido';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      onChanged: _authStore.onChangeEmail,
      onContinue: () => nextFormStep(index),
      onCancel: onWillPop,
      formKey: _formsKeys[index],
    );
  }

  FieldRegisterWidget getPasswordForm(int index) {
    return FieldRegisterWidget(
      onWillPop: () => Future.sync(onWillPop),
      labelText: 'Senha',
      validator: (value) {
        if (value.isEmpty) {
          return 'Digite uma senha válida';
        }
        return null;
      },
      obscureText: true,
      onChanged: _authStore.onChangePassword,
      onContinue: () => nextFormStep(index),
      onCancel: onWillPop,
      formKey: _formsKeys[index],
    );
  }

  FieldRegisterWidget getConfirmPasswordForm(int index) {
    return FieldRegisterWidget(
      onWillPop: () => Future.sync(onWillPop),
      labelText: 'Confirme sua senha',
      validator: (value) {
        if (value.isEmpty || !_authStore.isPasswordsEquals) {
          return 'Senhas não batem';
        }
        return null;
      },
      obscureText: true,
      onChanged: _authStore.onChangeConfirmPassword,
      onContinue: () => nextFormStep(index),
      onCancel: onWillPop,
      formKey: _formsKeys[index],
      isLastForm: true,
    );
  }

  List<FieldRegisterWidget> getForms(int index) {
    return [
      getFirstNameForm(index),
      getlastNameForm(index),
      getPacientNameForm(index),
      getEmailForm(index),
      getPasswordForm(index),
      getConfirmPasswordForm(index),
    ];
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

  void nextFormStep(int index) async {
    int lastFormItem = getForms(index).length - 1;
    bool isLastForm = index == lastFormItem;
    if (!isLastForm && _formsKeys[index].currentState.validate()) {
      _formsPageViewController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else if (isLastForm && _formsKeys[index].currentState.validate()) {
      bool isUserRegistered = await _authStore.registerUser();

      if (isUserRegistered) {
        Navigator.pushNamed(context, Routes.login);
      } else {
        _showErrorDialog('Ocorreu um erro ao registrar usuário.');
      }
    }
  }

  bool onWillPop() {
    if (_formsPageViewController.page.round() ==
        _formsPageViewController.initialPage) {
      return true;
    }

    _formsPageViewController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Observer(
        builder: (_) {
          if (_authStore.loading) {
            return LoadingWidget();
          }

          if (_authStore.error) {
            _showErrorDialog('Ocorreu um erro ao realizar o cadastro.');
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: PageView.builder(
                    controller: _formsPageViewController,
                    itemBuilder: (BuildContext context, int index) {
                      List<FieldRegisterWidget> forms = getForms(index);
                      print('forms $forms');
                      return forms[index];
                    },
                  ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
