import 'dart:io';

class ex2
{
  String name,surname,accno;
  double balance;

  void ex22()
  {

    print("Enter your name");
    name = stdin.readLineSync();

    print("Enter your surname");
    surname = stdin.readLineSync();

    print("Enter your account number");
    accno = stdin.readLineSync();

    print("Enter your balance");
    balance = double.parse(stdin.readLineSync());

    try
    {
      if(balance<50000)
      {
          Exception("Your balance is not enough");
      }
      else
      {
          print("Money succesfully withdraw");
      }
    }
    catch(e)
    {
      print(e);
    }


  }
}