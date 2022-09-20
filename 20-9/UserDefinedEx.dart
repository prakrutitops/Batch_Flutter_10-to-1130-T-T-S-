class UserDefinedEx
{
  void answer()
  {
    //1.with para with return
    int add(int a, int b)
    {
      return a+b;
    }

//2.with para without return type
    sub(int a,int b)
    {
      return a-b;
    }

//3.with return without para
    int mul()
    {
      var a=5;
      var b=2;

      var c=a*b;
      return c;
    }
    //4.without para without return
    div()
    {
      var a=4;
      var b=2;

      var c=a/b;
      print(c);

    }
  }

}