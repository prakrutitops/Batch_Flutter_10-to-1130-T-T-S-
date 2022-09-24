abstract class Shape
{
   void draw();

   int x;
   int y;

   void myNormalFunction()
   {
      print("Normal Function");
   }
}
class Circle extends Shape
{
  @override
  void draw()
  {

    print("Drawing Circle.....");
  }

}
class Rectangle extends Shape
{
  @override
  void draw()
  {
    print("Drawing Rectangle.....");
  }

}