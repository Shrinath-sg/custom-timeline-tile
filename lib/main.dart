import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_timeline_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Timeline'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          for (var i = 0; i < 3; i++)
            TimelineTile(
              leadingChild:  Text('14\nFeb',style: Theme.of(context).textTheme.titleSmall,),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Container(
                    color: Colors.grey.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "My data " * Random().nextInt(30),
                      ),
                    )),
              ),
            ),
        ],
      ),
    );
  }
}
