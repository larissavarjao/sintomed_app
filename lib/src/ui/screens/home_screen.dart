import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sintomed_app/src/stores/syntom/syntom_store.dart';
import 'package:sintomed_app/src/ui/widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SyntomStore _syntomStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _syntomStore = Provider.of<SyntomStore>(context);

    // check to see if already called api
    if (!_syntomStore.loading) {
      _syntomStore.getSyntoms();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        if (_syntomStore.loading) {
          return LoadingWidget();
        }

        if (_syntomStore.error) {
          return Center(
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('images/medicine.png'),
                ),
                SizedBox(
                  height: 48.0,
                ),
                Text(
                  'Ocorreu um erro!',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Por favor, tente novamente mais tarde!',
                ),
                RaisedButton(
                  child: Text('Tentar novamente'),
                ),
              ],
            ),
          );
        }

        if (_syntomStore.success &&
            _syntomStore.syntoms != null &&
            _syntomStore.syntoms.isNotEmpty) {
          return ListView.builder(
            itemCount: _syntomStore.syntoms.length,
            itemBuilder: (context, index) {
              return Text(_syntomStore.syntoms[index].name);
            },
          );
        }

        if (_syntomStore.success && _syntomStore.syntoms.isEmpty ||
            _syntomStore.syntoms == null) {
          return Center(
            child: Text(
              'Sem nada ainda',
            ),
          );
        }
      }),
    );
  }
}
