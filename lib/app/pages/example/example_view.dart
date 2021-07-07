

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/app/pages/example/example_controller.dart';

class ExamplePage extends View {
  ExamplePage();

  @override
  _ExamplePageView createState() => _ExamplePageView(ExampleController());
}

class _ExamplePageView extends ViewState<ExamplePage, ExampleController> {
  _ExamplePageView(ExampleController controller) : super(controller);


  @override
  Widget get view => Scaffold(key: globalKey, body: body);


  Widget get body =>ControlledWidgetBuilder<ExampleController>(builder: (context, controller)  {
    return InkWell(
      onTap: () {
        controller.onTap();
      },
        child: Text(
          'Example',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),

    );
  });

}
