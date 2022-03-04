import 'package:flutter/material.dart';

class DemoNotificationPage extends StatefulWidget {


  final id;

  const DemoNotificationPage({Key? key,this.id}) : super(key: key);

  @override
  _DemoNotificationPageState createState() => _DemoNotificationPageState();
}

class _DemoNotificationPageState extends State<DemoNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id),
      ),
    );
  }
}
