import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String _heartBeat = 'heartbeat';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Container(
              width: 120.0,
              height: 120.0,
              child: FlareActor(
                "assets/heart-beat.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: _heartBeat,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
