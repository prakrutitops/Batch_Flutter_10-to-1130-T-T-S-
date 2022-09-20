class namedpara
{

    void findvolume(int length, {int breadth, int height})
    {
      print("Length is $length");
      print("Breadth is $breadth");
      print("Height is $height");

      print("Volume is ${length * breadth * height}");
    }

}