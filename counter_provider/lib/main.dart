import 'package:counter_provider/providers/CounterModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context);
    return MaterialApp(
      title: "Flutter demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterWidget(),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //final counter = Provider.of<CounterModel>(context);
    return Scaffold(
      body: Center(
        child: Consumer<CounterModel>(
          builder: (BuildContext context, CounterModel value, Widget? child) {
            return Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Optional: Center vertically
              children: [
                Text(
                  "counter value:${value.counter} ",
                  style: const TextStyle(fontSize: 29),
                ),

                ElevatedButton(
                  onPressed: () {
                    value.increment();
                  },
                  child: const Text("Increment"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
