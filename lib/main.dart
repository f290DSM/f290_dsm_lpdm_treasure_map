import 'package:flutter/material.dart';

import 'ui/stepped_listview_example.dart';
import 'ui/stepper_example.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SteppedListView(),
    );
  }
}
