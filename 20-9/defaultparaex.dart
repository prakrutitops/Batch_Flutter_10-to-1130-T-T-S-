class defaultparaex
{

  void default1(int length, {int breadth = 2, int height = 20})
  {
    print("Lenght is $length");
    print("Breadth is $breadth");
    print("Height is $height");

    print("Volume is ${length * breadth * height}");
  }

}