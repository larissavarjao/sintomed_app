import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sintomed_app/src/stores/syntom_type/syntom_type_store.dart';
import 'package:sintomed_app/src/ui/widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  final SyntomTypeStore store = SyntomTypeStore();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.store.getSyntomsTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (widget.store.loading) {
          return LoadingWidget();
        }

        if (widget.store.error) {
          return Center(
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('images/medicine.png'),
                ),
                Text(
                  'Ocorreu um erro!',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Por favor, tente novamente mais tarde.',
                ),
                RaisedButton(
                  child: Text('Tentar novamente'),
                ),
              ],
            ),
          );
        }

        if (widget.store.syntomsTypes.isNotEmpty) {
          return ListView.builder(
            itemCount: widget.store.syntomsTypes.length,
            itemBuilder: (context, index) {
              return Text(widget.store.syntomsTypes[index].name);
            },
          );
        }

        if (widget.store.syntomsTypes.isEmpty) {
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
