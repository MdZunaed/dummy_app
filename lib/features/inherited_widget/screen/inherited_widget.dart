import 'package:flutter/material.dart';

// Step 1: Create the InheritedWidget
class CounterInheritedWidget extends InheritedWidget {
  final int counter;

  // Constructor to pass down the counter data
  const CounterInheritedWidget({
    super.key, // Updated for the latest structure
    required this.counter,
    required super.child,
  });

  // Access the counter value from the widget tree
  static CounterInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
  }

  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}

// Step 2: Create the StatefulWidget that will use the InheritedWidget
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key}); // Updated constructor with `super.key`

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  // Function to increment the counter
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Step 3: Wrap your MaterialApp or widget tree with the InheritedWidget
    return CounterInheritedWidget(
      counter: _counter,
      child: Scaffold(
        appBar: AppBar(title: Text('Inherited Widget')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Counter: ${CounterInheritedWidget.of(context)?.counter ?? 0}',
                style: TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text('Increment Counter'),
              ),
              CounterDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}

// Step 4: Create another widget that uses the inherited counter data
class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = CounterInheritedWidget.of(context)?.counter ?? 0;

    return Text(
      'Counter value is: $counter',
      style: TextStyle(fontSize: 20),
    );
  }
}
