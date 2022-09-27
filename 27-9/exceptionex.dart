import 'A1.dart';
import 'MapExample.dart';
import 'ex1.dart';
import 'ex2.dart';
import 'fileex.dart';

Future delayedPrint(int seconds, String msg)
{
  final duration = Duration(seconds: seconds);
  return Future.delayed(duration).then((value) => msg);
}

void main() async
{

 /* var e = ex2();
  e.ex22();*/
/*
  var f = FileEx1();
  f.f1();
*/

/*var l1 =MyMap();
l1.map1();*/



      print('Life');
    await delayedPrint(2, "Is").then((status)
    {
      print(status);
    });
    print('Good');
  }



