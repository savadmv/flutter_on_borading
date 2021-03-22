import 'dart:async';

import 'package:flutter/material.dart';

class OnBoardingPageView extends StatefulWidget {
  final String content;
  final Color leftColor;
  final rightColor;
  final VoidCallback onAnimationEnd;

  const OnBoardingPageView(
      {Key key,
      this.content,
      this.leftColor,
      this.rightColor,
      this.onAnimationEnd})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => OnBoardingPageViewState();
}

class OnBoardingPageViewState extends State<OnBoardingPageView>
    with TickerProviderStateMixin {
  bool open = false;
  AnimationController _animation;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animation = AnimationController(
        duration: Duration(seconds: 3),
        vsync: this,
        animationBehavior: AnimationBehavior.preserve)
      ..forward();
    _animation.addListener(() {
      if (_animation.isCompleted) {
        widget.onAnimationEnd();
      }
    });

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    Timer timer = Timer(Duration(milliseconds: 100), () {
      setState(() {
        open = !open;
      });
    });

    timer.tick;
  }

  @override
  void dispose() {
    _animation.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    final double smallLogo = 70;
    final double bigLogo = 90;

    return LayoutBuilder(
      builder: (context, constraints) {
        final Size biggest = constraints.biggest;
        return Scaffold(
          body: Container(
            height: size.height,
            width: size.width,
            child: Stack(children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return AnimatedPositioned(
                    top: (size.height * _animation.value) + 100,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    left: 0,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInCubic,
                      height: 450,
                      width: size.width * 0.60,
                      decoration: BoxDecoration(
                        color: open ? widget.leftColor : widget.rightColor,
                        borderRadius: BorderRadius.circular((size.width) / 2),
                      ),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    bottom: (size.height * _animation.value) + 200,
                    right: 0,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInCubic,
                      height: 450,
                      width: size.width * 0.60,
                      decoration: BoxDecoration(
                        color: open ? widget.rightColor : widget.leftColor,
                        borderRadius: BorderRadius.circular((size.width) / 2),
                      ),
                    ),
                  );
                },
              ),
              AnimatedPositioned(
                  bottom: size.height * 0.15,
                  left: open ? size.width * 0.05 : size.width * 0.10,
                  curve: Curves.easeInSine,
                  duration: Duration(milliseconds: 1600),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.content.split(" ")[0],
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          fontSize: 44,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff28527a)),
                    ),
                  )),
              AnimatedPositioned(
                  bottom: size.height * 0.10,
                  left: open ? size.width * 0.10 : size.width * 0.05,
                  curve: Curves.easeInSine,
                  duration: Duration(milliseconds: 1600),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.content
                          .substring(widget.content.split(" ")[0].length + 1),
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          fontSize: 44,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff28527a)),
                    ),
                  )),
              RelativePositionedTransition(
                size: biggest,
                rect: RectTween(
                  begin: Rect.fromLTWH(biggest.width * 0.18,
                      biggest.height * 0.82, bigLogo, bigLogo),
                  end: Rect.fromLTWH(
                      biggest.width * 0.15, -100, smallLogo, smallLogo),
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.slowMiddle,
                )),
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child:
                        Image.asset('assets/images/product_pic/bananas.png')),
              ),
              RelativePositionedTransition(
                size: biggest,
                rect: RectTween(
                  begin: Rect.fromLTWH(biggest.width * 0.28,
                      biggest.height * 0.92, bigLogo, bigLogo),
                  end: Rect.fromLTWH(
                      biggest.width * 0.26, -100, smallLogo, smallLogo),
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.slowMiddle,
                )),
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset('assets/images/product_pic/carrot.png')),
              ),
              RelativePositionedTransition(
                size: biggest,
                rect: RectTween(
                  begin: Rect.fromLTWH(biggest.width * 0.30,
                      biggest.height * 0.99, bigLogo, bigLogo),
                  end: Rect.fromLTWH(
                      biggest.width * 0.29, -100, smallLogo, smallLogo),
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.slowMiddle,
                )),
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset('assets/images/product_pic/chilli.png')),
              ),
              RelativePositionedTransition(
                size: biggest,
                rect: RectTween(
                  begin: Rect.fromLTWH(biggest.width * 0.05,
                      biggest.height * 0.95, bigLogo, bigLogo),
                  end: Rect.fromLTWH(
                      biggest.width * 0.05, -100, smallLogo, smallLogo),
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.slowMiddle,
                )),
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child:
                        Image.asset('assets/images/product_pic/cucumber.png')),
              ),
              RelativePositionedTransition(
                size: biggest,
                rect: RectTween(
                  begin: Rect.fromLTWH(biggest.width * 0.28,
                      biggest.height * 0.65, bigLogo, bigLogo),
                  end: Rect.fromLTWH(
                      biggest.width * 0.28, -100, smallLogo, smallLogo),
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.slowMiddle,
                )),
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset('assets/images/product_pic/onion.png')),
              ),
              RelativePositionedTransition(
                size: biggest,
                rect: RectTween(
                  begin: Rect.fromLTWH(biggest.width * 0.60,
                      biggest.height * 0.99, bigLogo, bigLogo),
                  end: Rect.fromLTWH(
                      biggest.width * 0.58, -100, smallLogo, smallLogo),
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.slowMiddle,
                )),
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset('assets/images/product_pic/orange.png')),
              ),
              RelativePositionedTransition(
                size: biggest,
                rect: RectTween(
                  begin: Rect.fromLTWH(biggest.width * 0.70,
                      biggest.height * 0.73, bigLogo, bigLogo),
                  end: Rect.fromLTWH(
                      biggest.width * 0.68, -100, smallLogo, smallLogo),
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.slowMiddle,
                )),
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset('assets/images/product_pic/potato.png')),
              ),
              RelativePositionedTransition(
                size: biggest,
                rect: RectTween(
                  begin: Rect.fromLTWH(biggest.width * 0.88,
                      biggest.height * 0.85, bigLogo, bigLogo),
                  end: Rect.fromLTWH(
                      biggest.width * 0.86, -100, smallLogo, smallLogo),
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.slowMiddle,
                )),
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                        'assets/images/product_pic/watermelon.png')),
              ),
            ]),
          ),
        );
      },
    );
  }
}
