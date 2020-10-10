import 'package:flutter/material.dart';
import 'transition_page.dart';


class AnimatedPage extends StatefulWidget {
  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}


class _AnimatedPageState extends State<AnimatedPage> {
  String text = "... calling ...";
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                settings: const RouteSettings(name: "/transition_page"),  // ルーティング名明記可能
                builder: (contet) {
                  return TransitionPage();
                },
              ),
            ),
          ),
        ],
      ),
      // ----------------------------
      body: Container(
        child: AnimatedSwitcher(   /// [===== AnimatedSwitcher =====]
          duration: Duration(milliseconds: 777),  /// [Animated系は時間とobjectsが変数]
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              child: child,   /// [下のchild:Center()変えるため宣言]
              scale: animation,
            );
          },
          child: Center(
            child: Text(
              text,   /// [（animation対象）]
              key: ValueKey<String>(text),  /// [（animation対象指定）へ、Keyの紐付け必須！]
              style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 25),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(  /// [BNB-> onTap/setState/index紐付け]
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;
            if (i == 0) {
              text = 'どっちが好き？';
            } else if (i == 1) {
              text = 'やっぱり、きりんさんが好きです！';
            } else {
              text = 'でも、ぞうさんの方がもっと好きです！';
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: '電話中',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.texture),
            label: 'きりん',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airline_seat_legroom_normal),
            label: 'ぞう',
          ),
        ],
      ),
    );
  }
}