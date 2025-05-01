import 'package:dummy_app/features/riverpod/provider/dummy_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class DummyRiverPod extends ConsumerStatefulWidget {
  const DummyRiverPod({super.key});

  @override
  ConsumerState<DummyRiverPod> createState() => _DummyRiverPodState();
}

class _DummyRiverPodState extends ConsumerState<DummyRiverPod> {

  void increment(){
    ref.read(counterProvider.notifier).state++;
  }
  void decrement(){
    ref.read(counterProvider.notifier).state--;
  }

  void toggleSwitch(newValue){
    ref.read(switchProvider.notifier).state = newValue;
  }

  @override
  Widget build(BuildContext context) {
    print("rebuilding scaffold");
    return Scaffold(
      appBar: AppBar(title: const Text("Dummy Riverpod")),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Center(child: Text(count.toString(), style: const TextStyle(fontSize: 25))),
            Consumer(
                builder: (context, ref, child) {
                  final count = ref.watch(counterProvider); // rebuild only this widget
                  print("rebuilding counter");
                  return Text(count.toString(), style: const TextStyle(fontSize: 25));
                }
            ),
            Consumer(
                builder: (context, ref, child) {
                  final value = ref.watch(switchProvider); // rebuild only this widget
                  print("rebuilding switch");
                  return Switch(value: value, onChanged: (newValue){
                    toggleSwitch(newValue);
                  });
                }
            ),
          ],
        ),
      ),

      floatingActionButton: Row(mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          FloatingActionButton(onPressed: decrement , child: const Icon(Icons.remove)),
          FloatingActionButton(onPressed: increment, child: const Icon(Icons.add)),
        ],
      ),
    );
  }
}

// In stateless-widget: we cant use ref.watch() outside the build context

// class DummyRiverPod extends ConsumerWidget {
//   const DummyRiverPod({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final count = ref.watch(counterProvider); This will rebuild the whole tree
//     print("rebuilding scaffold");
//     return Scaffold(
//       appBar: AppBar(title: const Text("Dummy Riverpod")),
//       body: Center(
//         child: Column(
//           spacing: 10,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             //Center(child: Text(count.toString(), style: const TextStyle(fontSize: 25))),
//             Consumer(
//               builder: (context, ref, child) {
//                 final count = ref.watch(counterProvider); // rebuild only this widget
//                 print("rebuilding counter");
//                 return Text(count.toString(), style: const TextStyle(fontSize: 25));
//               }
//             ),
//             Consumer(
//                 builder: (context, ref, child) {
//                   final value = ref.watch(switchProvider); // rebuild only this widget
//                   print("rebuilding switch");
//                   return Switch(value: value, onChanged: (newValue){
//                     ref.read(switchProvider.notifier).state = newValue;
//                   });
//                 }
//             ),
//           ],
//         ),
//       ),
//
//       floatingActionButton: Row(mainAxisSize: MainAxisSize.min,
//         spacing: 10,
//         children: [
//           FloatingActionButton(onPressed: (){
//             ref.read(counterProvider.notifier).state--;
//           }, child: const Icon(Icons.remove)),
//           FloatingActionButton(onPressed: (){
//             ref.read(counterProvider.notifier).state++;
//           }, child: const Icon(Icons.add)),
//         ],
//       ),
//     );
//   }
// }


