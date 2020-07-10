import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sintomed_app/routes.dart';
import 'package:sintomed_app/src/stores/auth/auth_store.dart';
import 'package:sintomed_app/src/ui/widgets/dialog_widget.dart';
import 'package:sintomed_app/src/ui/pages/register_page.dart';
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

  RegisterPage getFirstNameForm(int index, double progress) {
    return RegisterPage(
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
      formKey: _formsKeys[index],
      progressValue: progress,
    );
  }

  RegisterPage getlastNameForm(int index, double progress) {
    return RegisterPage(
      onWillPop: () => Future.sync(onWillPop),
      labelText: 'Sobrenome',
      onChanged: _authStore.onChangeLastName,
      onContinue: () => nextFormStep(index),
      onCancel: onWillPop,
      formKey: _formsKeys[index],
      progressValue: progress,
    );
  }

  RegisterPage getPacientNameForm(int index, double progress) {
    return RegisterPage(
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
      formKey: _formsKeys[index],
      progressValue: progress,
    );
  }

  RegisterPage getEmailForm(int index, double progress) {
    return RegisterPage(
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
      progressValue: progress,
    );
  }

  RegisterPage getPasswordForm(int index, double progress) {
    return RegisterPage(
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
      progressValue: progress,
    );
  }

  RegisterPage getConfirmPasswordForm(int index, double progress) {
    return RegisterPage(
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
      progressValue: progress,
    );
  }

  List<RegisterPage> getForms(int index, double progress) {
    return [
      getFirstNameForm(index, progress),
      getlastNameForm(index, progress),
      getPacientNameForm(index, progress),
      getEmailForm(index, progress),
      getPasswordForm(index, progress),
      getConfirmPasswordForm(index, progress),
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
    int lastFormItem = _formsKeys.length - 1;
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
                      int formSize = _formsKeys.length;
                      int currentIndex = index + 1;
                      double progress = currentIndex / formSize;
                      List<RegisterPage> forms = getForms(index, progress);
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
