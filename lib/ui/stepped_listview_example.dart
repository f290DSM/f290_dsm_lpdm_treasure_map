import 'package:flutter/material.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

class SteppedListView extends StatefulWidget {
  const SteppedListView({super.key});

  @override
  State<SteppedListView> createState() => _SteppedListViewState();
}

class _SteppedListViewState extends State<SteppedListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepped ListView'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StepperListView(
          showStepperInLast: false,
          stepAvatar: (BuildContext context, value) {
            return const PreferredSize(
              preferredSize: Size.fromRadius(20),
              child: CircleAvatar(backgroundColor: Colors.purple),
            );
          },
          stepContentWidget: (BuildContext context, value) {
            final stepData = value as StepperItemData;
            return ListTile(
              title: Text('${stepData.id}'),
              subtitle: Text('${stepData.content}'),
            );
          },
          stepperData: [
            StepperItemData(
                avatar: 'Avatar 01',
                id: '1',
                content: 'Mussum ipsum cacildis vidis litrus abertis'),
            StepperItemData(
                avatar: 'Avatar 02',
                id: '2',
                content: 'Mussum ipsum cacildis vidis litrus abertis'),
            StepperItemData(
                avatar: 'Avatar 03',
                id: '3',
                content: 'Mussum ipsum cacildis vidis litrus abertis'),
            StepperItemData(
              avatar: 'Avatar 04',
              id: '4',
              content: const Card(
                child: ListTile(
                  title: Text('Title'),
                  subtitle: Text('Mussum ipsum cacildis vidis litro abertis'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
