import 'dart:async';

import 'package:flutter/material.dart';

import 'components/on_bording_page_view.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  bool anim = false;
  bool open = false;
  int _index = 0;

  final _controller = PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer timer = Timer(Duration(milliseconds: 100), () {
      setState(() {
        open = !open;
      });
    });

    timer.tick;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _index = index;
              });
            },
            children: [
              OnBoardingPageView(
                leftColor: Color(0xff8ac4d0),
                rightColor: Color(0xffF4D160),
                onAnimationEnd: () => onAnimationEnd(),
                content: "Easy to buy",
              ),
              OnBoardingPageView(
                leftColor: Color(0xfff0a500),
                rightColor: Color(0xffe6d5b8),
                onAnimationEnd: () => onAnimationEnd(),
                content: "Continues tracking ",
              ),
              OnBoardingPageView(
                leftColor: Color(0xff5b6d5b),
                rightColor: Color(0xff484018),
                onAnimationEnd: () => onAnimationEnd(),
                content: "Fast delivery",
              ),
            ],
          ),
          Positioned(
            child: InkWell(
                onTap: () {},
                child: Text(
                  "Skip >>",
                  style: theme.textTheme.button,
                )),
            top: 60,
            right: 30,
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                        width: 10,
                        duration: Duration(milliseconds: 800),
                        height: 10,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _index == index ? Colors.black : Colors.grey,
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }

  onAnimationEnd() {
    _controller.animateToPage(_index == 2 ? 0 : _index + 1,
        duration: Duration(milliseconds: 900), curve: Curves.ease);
  }
}


