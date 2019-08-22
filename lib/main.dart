import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:dots_indicator/dots_indicator.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
            body: PView()
        )
    );
  }
}

class PView extends StatefulWidget {

  @override
  _PVState createState() => new _PVState();
}

class _PVState extends State<PView> {
  final _controller = new PageController();
  final List<Widget> _pages = [
    FirstScreen(),
    SecondScreen(),
  ];
  int page = 0;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
            children: <Widget>[
              Positioned(
                  child: PageView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    controller: _controller,
                    itemCount: _pages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _pages[index % _pages.length];
                    },
                    onPageChanged: (int p) {
                      setState(() {
                        page = p;
                      });
                    },
                  )
              )
            ]
        )
    );
  }
}


class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => new _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> firBoxAnimation;
  Animation<double> secBoxAnimation;
  Animation<double> thrBoxAnimation;
  Animation<Offset> textAnimation;
  Animation<double> fadeInAnimation;



  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    firBoxAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.050,
              0.200,
              curve: Curves.decelerate,

            )
        )
    );

    secBoxAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(
                0.250,
                0.400,
                curve: Curves.decelerate
            )
        )
    );

    thrBoxAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(
                0.450,
                0.600,
                curve: Curves.decelerate
            )
        )
    );

    textAnimation =
        Tween<Offset>(begin: Offset(0, -1.5), end: Offset(0.0, 0.4)).animate(
            CurvedAnimation(parent: controller, curve: Interval(
                0.620, 0.920, curve: Curves.fastOutSlowIn
            )
            ));

    fadeInAnimation = Tween<double>(begin: 0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.935, 1.0
        ))
    );

    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    alignment: Alignment.topCenter,
                    child: SlideTransition(position: textAnimation,
                        child:
                        RichText(
                          text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '   All your team communication\n',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22)
                                ),
                                TextSpan(
                                    text: 'in one place, instantly searchable.',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22)
                                )
                              ]
                          ),
                        )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: ScaleTransition(
                      scale: firBoxAnimation,
                      child: Image.asset('assets/second.png'),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 50, top: 20),
                      child: ScaleTransition(
                        scale: secBoxAnimation,
                        child: Image.asset('assets/first.png'),
                      )
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 20),
                      child: ScaleTransition(
                        scale: thrBoxAnimation,
                        child: Image.asset('assets/third.png'),
                      )
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 30),
                            child: FadeTransition(opacity: fadeInAnimation,
                              child: DotsIndicator(
                                dotsCount: 4,
                                position: 0,
                                decorator: DotsDecorator(
                                    color: Colors.grey,
                                    activeColor: const Color(0xD9263238)
                                ),
                              ),),
                          ),
                          Container(
                              width: 250,
                              padding: EdgeInsets.only(top: 20),
                              child: FadeTransition(
                                opacity: fadeInAnimation,
                                child: RaisedButton(
                                    color: const Color(0xFF2E7D32),
                                    onPressed: () {},
                                    child: Text('Get Started',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                                ),
                              )
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 20),
                              child: FadeTransition(
                                opacity: fadeInAnimation,
                                child: Text('Sign in', style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                ),
                              )
                          )
                        ],
                      )
                  )
                ],
              )
          );
        }
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => new _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> imgAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    imgAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.500,
              0.950,
              curve: Curves.decelerate,

            )
        )
    );
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              backgroundColor: Colors.white,
              body:
              Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 40),
                      alignment: Alignment.topCenter,
                      child:
                      RichText(
                        text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Talk with coworkers in ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22)
                              ),
                              TextSpan(
                                  text: 'channels\n',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22)
                              ),
                              TextSpan(
                                text: 'based on projects, departments,\n or shared interests.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                              )
                            ]
                        ),
                        textAlign: TextAlign.center,
                      )
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: ScaleTransition(
                      scale: imgAnimation,
                      child: Image.asset('assets/second_screen.png'),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 30),
                            child: DotsIndicator(
                              dotsCount: 4,
                              position: 1,
                              decorator: DotsDecorator(
                                  color: Colors.grey,
                                  activeColor: const Color(0xD9263238)
                              ),
                            ),
                          ),
                          Container(
                            width: 250,
                            padding: EdgeInsets.only(top: 20),
                            child: RaisedButton(
                                color: const Color(0xFF2E7D32),
                                onPressed: () {
                                },
                                child: Text('Get Started',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Text('Sign in', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            ),
                          )
                        ],
                      )
                  )
                ],
              )
          );
        });
  }
}
