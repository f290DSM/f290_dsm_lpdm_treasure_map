import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({super.key});

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int _currentStep = 0;

  tapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper'),
      ),
      body: Stepper(
        type: StepperType.vertical,
        physics: const ScrollPhysics(),
        currentStep: _currentStep,
        onStepTapped: (step) => tapped(step),
        onStepContinue: continued,
        onStepCancel: cancel,
        steps: [
          Step(
            title: const Text('Cascata'),
            content: const Column(
              children: [
                Text('Parada 01...'),
                Text('Parada 02...'),
                Text('Parada 03...'),
                Text('Parada 04...'),
                Text('Parada 05...'),
              ],
            ),
            isActive: _currentStep >= 0,
            state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text('Cascata'),
            content: const Column(
              children: [
                Text('Parada 01...'),
                Text('Parada 02...'),
                Text('Parada 03...'),
                Text('Parada 04...'),
                Text('Parada 05...'),
              ],
            ),
            isActive: _currentStep >= 1,
            state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text('Cascata'),
            content: const Column(
              children: [
                Text('Parada 01...'),
                Text('Parada 02...'),
                Text('Parada 03...'),
                Text('Parada 04...'),
                Text('Parada 05...'),
              ],
            ),
            isActive: _currentStep >= 2,
            state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
          ),
        ],
      ),
    );
  }
}
