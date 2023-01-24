//@dart=2.9
import 'dart:math';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingM-5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children:[
              Column(
                children:[
                  Image(
                    image: AssetImage('images/logo.png'),
                    height: 70,
                    width: 70,
                  ),
                ]
              ),

              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Image(
                      image: AssetImage('images/name.png'),
                      height: 60,
                      width: 180,
                    ),

                    Image(
                      image: AssetImage('images/tagLine.png'),
                      height: 30,
                      width: 200,
                    ),
                  ]
              ),
              ]
          ),

        /*  const SizedBox(height: kSpaceL),
          Text('Welcome to E-wishes',
            style: Theme.of(context).textTheme.headline6.copyWith(color: kDarkBrown, fontWeight: FontWeight.bold),
          ),*/

         /* Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
          const SizedBox(height: kSpaceL),
          Text('Login here using your username and password.',
            style: Theme.of(context).textTheme.subtitle2.copyWith(color: kDarkBrown.withOpacity(0.5)),
          ),*/
        ],
      ),
    );
  }
}