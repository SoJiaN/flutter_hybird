import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverlay extends StatefulWidget {
  @override
  State createState() {
    return new CorrectWrongOverlayState();
  }
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {

  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(vsync: this, duration: new Duration(seconds: 2));
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        onTap: () {
          _iconAnimationController.reset();
          _iconAnimationController.forward();
          print("you tapped this correct_wrong_overlay!!!");
        },
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Colors.lightGreen,
                shape: BoxShape.circle
              ),
              child: new Transform.rotate(
                angle: _iconAnimation.value * pi *2,
                child: new Icon(Icons.done, size: 80.0 * _iconAnimation.value,),
              ),
            ),
            new Padding(padding: EdgeInsets.only(bottom: 20.0)),
            new Text("Correct", style: new TextStyle(color: Colors.black, fontSize: 30.0 * _iconAnimation.value),)
          ],
        ),
      ),
    );
  }
}
