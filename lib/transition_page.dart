import 'package:flutter/material.dart';
import 'first_page.dart';


class TransitionPage extends StatefulWidget {
  @override
  _TransitionPageState createState() => _TransitionPageState();
}


/// [with SingleTickerProviderStateMixin]必要
class _TransitionPageState extends State<TransitionPage> with SingleTickerProviderStateMixin {
  /// [===== initial =====]
  AnimationController animationController;
  Animation animationTween;

  /// [===== initsate()&&dispose() =====]
  @override
  void initState() {
    super.initState();  /// [上]
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animationTween = Tween<double>(
      begin: 1.0,  // bigin開始時_のスケール
      end: 5.0,    // end終了時_のスケール->5倍想定
    ).animate(animationController);
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();  /// [下]
  }

  /// [===== build() =====]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transition"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                settings: const RouteSettings(name: "/first_page"),  // ルーティング名明記可能
                builder: (contet) {
                  return FirstPage();
                },
              ),
            ),
          ),
        ],
      ),
      // ------------
      body: Center(
        child: ScaleTransition(  /// [ScaleTransition]
          scale: animationTween,   // reqiuired scale
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.pink[200],
              borderRadius: BorderRadius.circular(30),
            )
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {animationController.forward();},  /// [animation再生]
              icon: Icon(Icons.play_arrow),
            ),
            IconButton(
              onPressed: () {animationController.stop();},  /// [animation停止]
              icon: Icon(Icons.stop),
            ),
            IconButton(
              onPressed: () {animationController.repeat();},  /// [animation反復]
              icon: Icon(Icons.loop),
            ),
          ],
        ),
      ),

    );
  }
}