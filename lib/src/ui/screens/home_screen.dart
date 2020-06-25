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

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        print('error ${widget.store.error}');
        print('success ${widget.store.success}');
        print('loading ${widget.store.loading}');
        print('list ${widget.store.syntomsTypes}');
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
                  'Por favor, tente novamente mais tarde.',
                ),
                RaisedButton(
                  child: Text('Tentar novamente'),
                ),
              ],
            ),
          );
        }

        if (widget.store.success &&
            widget.store.syntomsTypes != null &&
            widget.store.syntomsTypes.isNotEmpty) {
          return ListView.builder(
            itemCount: widget.store.syntomsTypes.length,
            itemBuilder: (context, index) {
              return Text(widget.store.syntomsTypes[index].name);
            },
          );
        }

        if (widget.store.success && widget.store.syntomsTypes.isEmpty ||
            widget.store.syntomsTypes == null) {
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
