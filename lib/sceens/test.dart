import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  AnimatedText({Key? key}) : super(key: key);

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  Timer? timer;
  String buttonText = "play";

  ///* let's make list from word
  List<String> _totalChar = "money".split("");
  List<String> _visibleChar = [];

  int currentIndex = 0;

  _textAnimationSetUp() async {
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        if (currentIndex < _totalChar.length)
          _visibleChar.add(
              "${currentIndex > 0 ? "-" : ""}${_totalChar[currentIndex++]}");
        else
          timer.cancel();
      });
    });
  }

  get _textStyle => TextStyle(
    fontSize: 40,
  );

  @override
  void dispose() {
    if (timer != null && timer!.isActive) timer!.cancel();
    super.dispose();
  }

  _play() async {
    setState(() {
      currentIndex = 0;
      _visibleChar.clear();
      buttonText = "restart";
    });
    if (timer != null && timer!.isActive) timer!.cancel();
    _textAnimationSetUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              //* removing everything except  letter and -
              _visibleChar
                  .toString()
                  .replaceAll(" ", "")
                  .replaceAll(",", '')
                  .replaceAll("[", '')
                  .replaceAll("]", ""),
              style: _textStyle,
            ),
            ElevatedButton(
              onPressed: () {
                _play();
                setState(() {});
              },
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}