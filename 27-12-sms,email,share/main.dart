//@dart=2.9
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{

  _sendingMails() async {
    var url = Uri.parse("mailto:abc@gmail.com");
   /* if (await canLaunchUrl(url))
    {
      await launchUrl(url);
    }*/ /*else {
      throw 'Could not launch $url';
    }*/
  }

  _sendingSMS() async {
    var url = Uri.parse("sms:8849817263");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context)
  {
      return MaterialApp(

        home: Scaffold
          (
          appBar: AppBar
          (
            title: const Text('Mail and SMS'),
            backgroundColor: Colors.green,
          ),
          body:SafeArea(
              child: Center(

                  child: Column(

                    children: [

                          ElevatedButton(onPressed: (){

                            _sendingSMS();

                          }, child: Text("SMS")),
                          SizedBox(),
                           ElevatedButton(onPressed: ()
                               {
                                 var url = Uri.parse("mailto:abc@gmail.com");
                                 launchUrl(url);

                               }, child: Text("Email")),

                      SizedBox(),
                      ElevatedButton(onPressed: ()
                      {


                         // Navigator.push(context, MaterialPageRoute(builder: (context) => ShareAppData2()));




                      }, child: Text("Share"))

                    ],

                  )


              ),


          )



      ));
  }

}
