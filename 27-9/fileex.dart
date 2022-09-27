import 'dart:io';

class FileEx1
{

    void f1()
    {

      var f =File("E://a.txt");
      f.writeAsString("Welcome");
      print("success");

    }

}