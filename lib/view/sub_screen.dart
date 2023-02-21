import 'package:flutter/material.dart';
import 'package:test_app_riverpod/view/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app_riverpod/state_provider.dart';

class SubScreen extends ConsumerWidget {
  const SubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subNum = ref.watch(subNumProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("SubScreen"),
      ),
      floatingActionButton:
          FloatingActionButton(child: Text("Home"), onPressed: () => moveHomeScreen(context)),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              subNum.toString(),
              style: TextStyle(fontSize: 50.0),
            ),
            ElevatedButton(
              child: Text("＋"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
              onPressed: () => addOne(ref),
            ),
            ElevatedButton(
                onPressed: () => clear(ref),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                child: Text(
                  "クリアー",
                  style: TextStyle(fontSize: 20.0),
                ))
          ],
        ),
      )),
    );
  }

  moveHomeScreen(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  addOne(WidgetRef ref) {
    final notifier = ref.read(subNumProvider.notifier);
    notifier.state++;
  }

  clear(WidgetRef ref) {
    final notifier = ref.read(subNumProvider.notifier);
    notifier.state = 0;
  }
}
