class A1
{
  void a1()
  {
    print("a1");
  }


}
class B1
{
  void b1()
  {
    print("b1");
  }
}
class C1 implements A1,B1
{
  @override //annotation
  void a1() {
    print("a1");

  }

  @override
  void b1() {
    print("b1");
  }

}