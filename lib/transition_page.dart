import 'package:flutter/material.dart';


class TransitionPage extends StatefulWidget {
  @override
  _TransitionPageState createState() => _TransitionPageState();
}


class _TransitionPageState extends State<TransitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transition"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                settings: const RouteSettings(name: "/xxxx_page"),  // ルーティング名明記可能
                builder: (contet) {
                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}