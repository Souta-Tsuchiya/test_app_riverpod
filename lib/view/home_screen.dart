import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app_riverpod/state_provider.dart';
import 'package:test_app_riverpod/view/sub_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeNum = ref.watch(homeNumProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      floatingActionButton:
      FloatingActionButton(child: Text("ToSub"), onPressed: () => moveSubScreen(context)),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(homeNum.toString(), style: TextStyle(fontSize: 50.0),),
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
        ),
      ),
    );
  }

  moveSubScreen(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SubScreen()));
  }

  addOne(WidgetRef ref) {
    final notifier = ref.read(homeNumProvider.notifier);
    notifier.state++;
  }

  clear(WidgetRef ref) {
    final notifier = ref.read(homeNumProvider.notifier);
    notifier.state = 0;
  }
}
