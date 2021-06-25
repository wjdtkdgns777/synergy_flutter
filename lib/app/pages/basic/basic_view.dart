import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'basic_controller.dart';
class CounterPage extends View {
  @override
  // Dependencies can be injected here
  State<StatefulWidget> createState() => CounterState();
}

class CounterState extends ViewState<CounterPage, CounterController> {
  CounterState() : super(CounterController());

  @override
  Widget get view => MaterialApp(
    title: 'Flutter Demo',
    home: Scaffold(
      key: globalKey, // using the built-in global key of the `View` for the scaffold or any other
      // widget provides the controller with a way to access them via getContext(), getState(), getStateKey()
      body: Column(
        children: <Widget>[
          Center(
            // show the number of times the button has been clicked
            child: ControlledWidgetBuilder<CounterController>(
                builder: (context, controller) {
                  return Text(controller.counter.toString());
                }
            ),
          ),
          // you can refresh manually inside the controller
          // using refreshUI()
          ControlledWidgetBuilder<CounterController>(
              builder: (context, controller) {
                return MaterialButton(onPressed: controller.increment);
              }
          ),
        ],
      ),
    ),
  );
}