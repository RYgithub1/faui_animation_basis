import 'package:flutter/material.dart';
import 'animated_page.dart';
import 'transition_page.dart';


// double firstSize = 100;


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<FirstPage> {
  // final double firstSize = 100;
  // double firstSize = 100;
  // double _firstSize = 100;
  double firstSize;
  Color firstColor;
  Text firstText;

  /// [----- initState()dispose() -----]
  @override
  void initState() {
    super.initState(); /// [上]
    firstSize = 100;
    firstColor = Colors.orange[200];
    firstText = Text("1_before");
    print("initState");
  }
  // @override
  // void dispose() {
  //   // firstSize.dispose();
  //   // FirstPage().dispose;
  //   firstSize = 100;
  //   super.dispose();  /// [下]
  //   print("dispose");
  // }


  /// [----- build -----]
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              settings: const RouteSettings(name: "/transition_page"),  // ルーティング名明記可能
              builder: (context) {
              return TransitionPage();
            },
            ),
          ),
        ),
        title: Text("FIRST"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                settings: const RouteSettings(name: "/animated_page"),  // ルーティング名明記可能
                builder: (contet) {
                  return AnimatedPage();
                },
              ),
            ),
          ),
        ],
      ),
      // ----------------------------
      body: Center(
        child: AnimatedContainer(  /// [Animated系は時間とobjectsが変数]
          duration: Duration(seconds: 1),
          width: firstSize,
          height: firstSize,
          color: firstColor,
          child: Center(child: firstText),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            firstSize =  200;
            firstColor = Colors.orange[900];
            firstText = Text(
              "1_after",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            );
          });
          print("pushed");
        },
        child: Icon(Icons.star),
      ),
    );
  }
}