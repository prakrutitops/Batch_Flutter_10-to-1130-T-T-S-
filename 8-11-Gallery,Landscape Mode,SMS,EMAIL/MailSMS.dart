import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';
class EmailSms extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
    home: Scaffold
      (
      appBar: AppBar
        (
        title: const Text('Geeks for Geeks'),
        backgroundColor: Colors.green,
        ),
        body: Center(

          child:Column(

                children: [

                  ElevatedButton(
                    onPressed: () {
                        _sendingsms();
                    },
                    child: Text("SEND SMS"),),

                  ElevatedButton(
                    onPressed: () async
                    {
                      print("Email sending start");
                      final Email email = Email(
                        body: 'Email body',
                        subject: 'Email subject',
                        recipients: ['example@example.com'],
                        cc: ['cc@example.com'],
                        bcc: ['bcc@example.com'],
                        attachmentPaths: ['/path/to/attachment.zip'],
                        isHTML: false,
                      );

                      await FlutterEmailSender.send(email);
                    },

                      child:Text("SEND EMAIL")

                  )

                ],

          )

        ),
    ));
  }

   _sendingemail() async
   {

     final Uri params = Uri
       (
       scheme: 'mailto',
       path: 'vyas.prakruti@gmail.com',
     );
     String  url = params.toString();
     if (await canLaunch(url)) {
       await launch(url);
     } else {
       print( 'Could not launch $url');
     }
    /* print("start sending email");
     var url = Uri.parse("mailto:vyas.prakruti@gmail.com");
      if(await canLaunchUrl(url))
      {
        await launchUrl(url);
      }
      else
      {
        throw 'Could not launch $url';
      }*/
   }

   _sendingsms() async
   {
     print("start sending sms");
     var url = Uri.parse("sms:8849817263");
     if (await canLaunchUrl(url)) {
   await launchUrl(url);
   } else {
   throw 'Could not launch $url';
   }
   }

}