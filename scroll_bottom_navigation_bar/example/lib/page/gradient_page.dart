import 'package:flutter/material.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';

class GradientPage extends StatefulWidget {
  @override
  _GradientPageState createState() => _GradientPageState();
}

class _GradientPageState extends State<GradientPage> {
  ScrollController controller;

  static const _items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Page 1",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Page 2",
    ),
  ];

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.bottomNavigationBar.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Snap scroll")),
      body: ValueListenableBuilder<int>(
        valueListenable: controller.bottomNavigationBar.tabNotifier,
        builder: (context, value, child) => Snap(
          key: PageStorageKey(value),
          controller: controller.bottomNavigationBar,
          child: ListView.builder(
            controller: controller, // Controller is also here
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text('$index'),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: ScrollBottomNavigationBar(
        controller: controller, // Note the controller here
        items: _items,
        backgroundGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue,
            Colors.green,
          ],
        ),
      ),
    );
  }
}
