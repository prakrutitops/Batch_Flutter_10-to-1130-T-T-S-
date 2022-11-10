import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget
{
  @override
  IntroScreen createState() => IntroScreen();

}

class IntroScreen extends State<OnBoardingScreen>
{
  @override
  Widget build(BuildContext context)
  {

      return IntroductionScreen(

        globalBackgroundColor: Colors.deepOrangeAccent,
        pages: [

          PageViewModel
            (
              title: "Fractional shares",
              body: "Instead of having to buy an entire share, invest any amount you want.",

            ),

          PageViewModel
            (
            title: "Fractional shares2",
            body: "Instead of having to buy an entire share, invest any amount you want.",

          ),

          PageViewModel
            (
            title: "Fractional shares3",
            body: "Instead of having to buy an entire share, invest any amount you want.",

          ),

        ],

        onDone: () => goHomepage(context), //go to home page on done
        onSkip: () => goHomepage(context), // You can override on skip
        showSkipButton: true,
        dotsFlex: 0,
        nextFlex: 0,
        skip: Text('Skip', style: TextStyle(color: Colors.white),),
        next: Icon(Icons.arrow_forward, color: Colors.white,),
        done: Text('Getting Stated', style: TextStyle(
            fontWeight: FontWeight.w600, color:Colors.white
        ),),

      /*  dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0), //size of dots
          color: Colors.white, //color of dots
          activeSize: Size(22.0, 10.0),
          //activeColor: Colors.white, //color of active dot
          activeShape: RoundedRectangleBorder( //shave of active dot
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),*/



      );

  }

  goHomepage(BuildContext context)
  {


  }
}
