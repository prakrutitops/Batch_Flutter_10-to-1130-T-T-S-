//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutterproject/screens/user/boarding/widgets/header.dart';
import 'package:flutterproject/screens/user/boarding/widgets/next_page_button.dart';
import 'package:flutterproject/screens/user/boarding/widgets/onboarding_page_indicator.dart';
import 'package:flutterproject/screens/user/boarding/widgets/pages/community/community_dark_card_content.dart';
import 'package:flutterproject/screens/user/boarding/widgets/pages/community/community_light_card_content.dart';
import 'package:flutterproject/screens/user/boarding/widgets/pages/community/community_text_column.dart';
import 'package:flutterproject/screens/user/boarding/widgets/pages/onboarding_page.dart';
import 'package:flutterproject/screens/user/boarding/widgets/pages/relationships/index.dart';
import 'package:flutterproject/screens/user/boarding/widgets/pages/work/work_dark_card_content.dart';
import 'package:flutterproject/screens/user/boarding/widgets/pages/work/work_light_card_content.dart';
import 'package:flutterproject/screens/user/boarding/widgets/pages/work/work_text_column.dart';
import 'package:flutterproject/screens/user/login/Login.dart';

import '../../constants.dart';

class Onboarding extends StatefulWidget
{
  @override
  OnboardingState createState() => OnboardingState();


}

class OnboardingState extends State<Onboarding>
{
  int _currentPage = 1;
  bool get isFirstPage => _currentPage == 1;

  Widget _getpage()
  {
    switch(_currentPage)
    {

      case 1:
        return const OnboardingPage
          (
            number: 1,
            lightCardChild: CommunityLightCardContent(),
            darkCardChild: CommunityDarkCardContent(),
            textColumn: CommunityTextColumn(),
        );
        break;

      case 2:
        return const OnboardingPage
          (
          number: 2,
          lightCardChild: EducationLightCardContent(),
          darkCardChild: EducationDarkCardContent(),
          textColumn: EducationTextColumn(),
        );
        break;

      case 3:
        return const OnboardingPage(
          number: 3,
          lightCardChild: WorkLightCardContent(),
          darkCardChild: WorkDarkCardContent(),
          textColumn: WorkTextColumn(),
        );
        break;

      default:
        throw Exception("Page with number '$_currentPage' does not exist.");

    }
  }
  void _goToLogin()
  {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
    //print('Login called');
  }

  void _setNextPage(int nextPageNumber)
  {
    setState(()
    {
      _currentPage = nextPageNumber;
    });
  }
  void _nextPage()
  {
    switch (_currentPage)
    {
      case 1:
        _setNextPage(2);
        break;
      case 2:
        _setNextPage(3);
        break;
      case 3:
        _goToLogin();
        break;
    }
  }
  @override
  Widget build(BuildContext context)
  {

      return Scaffold(
          backgroundColor: kBrown,
          body: SafeArea(
          child: Padding(

            padding: const EdgeInsets.all(kPaddingL),
            child: Column(
              children: <Widget>[
                Header
                  (
                    onSkip: _goToLogin
                  ),
                Expanded
                  (
                    child: _getpage()
                  ),
                  OnboardingPageIndicator
                  (
                    currentPage: _currentPage,
                    child: NextPageButton(onPressed: _nextPage),
                  ),
              ],
            ),

          ))

      );

  }

}