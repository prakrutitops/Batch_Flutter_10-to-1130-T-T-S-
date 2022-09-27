class List1
{


    List<int> numbersList = List(5);

    void datalist()
    {
          // Fixed-length list

      numbersList[0]=101;
      numbersList[1]=102;
      numbersList[2]=103;
      numbersList[3]=104;
      numbersList[4]=105;

      print(numbersList);

      numbersList[1]=106;
      print(numbersList);
      numbersList[1]=null;
      print(numbersList);


      for (int element in numbersList)
      {                          // Using Individual Element (Objects)
        print(element);
      }

      /*for (int i = 0; i < numbersList.length; i++)
      {              // Using Index
        print(numbersList[i]);
      }*/
    }


    void datalist2()
    {
      List<String> countries = ["USA", "INDIA", "CHINA"];     // Growable List : METHOD 1

      countries.add("UK");

      print(countries);


      List<int> numbersList = List();                         // Growable List: METHOD 2
      numbersList.add(73);    // Insert Operation
      numbersList.add(64);
      numbersList.add(21);
      numbersList.add(12);

      List<int> numbersList2 = List();                         // Growable List: METHOD 2
      numbersList2.add(73);    // Insert Operation
      numbersList2.add(64);
      numbersList2.add(21);
      numbersList2.add(12);

      numbersList.add(101);
      numbersList.addAll(numbersList2);
      numbersList.remove(101);
      numbersList.removeAt(2);
      numbersList.forEach((element) => print(element));   // Using Lambda


    }


}