class A12
{
  String color="black";
}
class B12 extends A12
{
  String color="white";

  void colors()
  {
    print(super.color);//parent class variable refer
    print(color);
  }
}
