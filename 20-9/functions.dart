import 'OptionalParaEx.dart';
import 'UserDefinedEx.dart';
import 'defaultparaex.dart';
import 'namedparaex.dart';

void main()
{
    //1.User Define Function
   /* var u =UserDefinedEx();
    u.answer();*/

  //2.Optional Parameter
   /* var u2 =OptionalParaEx();
    //u2.printCities("Rajkot", "Baroda", "Surat");
    u2.printCities2("Ahmedabad","Junagadh","xyz");*/

    //3.named parameter
   /* var u3 = namedpara();
    u3.findvolume(5,height: 5,breadth: 6);*/

    //4.Default Parameter
    var u4 = defaultparaex();
    u4.default1(5,breadth: 5);
}
