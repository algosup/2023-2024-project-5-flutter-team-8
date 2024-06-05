import 'package:flutter/material.dart';

class WrapWidgetDemo extends StatefulWidget {
  final String title = 'Wrap Widget, Chips Demo';

  @override
  State<StatefulWidget> createState() {
    return _WrapWidgetDemoState();
  }
}

class _WrapWidgetDemoState extends State<WrapWidgetDemo> {
  late GlobalKey<ScaffoldState> _key;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          rowChips(),
        ],
      ),
    );
  }

  Widget rowChips() {
    return Row(
      children: <Widget>[
        chipForRow('Test', Colors.red),
      ],
    );
  }

  Widget chipForRow(String label, Color color) {
  return Chip(
    labelPadding: EdgeInsets.all(5.0),
    label: Text(
      label,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: color,
    elevation: 6.0,
    shadowColor: Colors.grey[60],
    padding: EdgeInsets.all(6.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0), // Adjust the value as needed
    ),
  );
}
}

void main() {
  runApp(MaterialApp(
    home: WrapWidgetDemo(),
  ));
}
