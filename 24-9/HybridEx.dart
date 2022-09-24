class P1
{
  void p1()
  {
    print("p1");
  }
}
class Q1 extends P1
{
  void q1()
  {
    print("q1");
  }
}
class R1
{
  void r1()
  {
    print("r1");
  }
}
class S1 extends Q1 implements R1
{
  @override
  void r1()
  {
    // TODO: implement r1
    print("r1");
  }

}