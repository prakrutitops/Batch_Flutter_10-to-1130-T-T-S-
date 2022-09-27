class MyMap
{
  void map1()
  {
    Map<String, int> countryDialingCode =
    {         // Method 1: Using Literal
      "USA": 1,
      "INDIA": 91,
      "PAKISTAN": 92
    };

    print(countryDialingCode);

    Map<String, String> fruits = Map();             // Method 2: Using Constructor
    fruits["apple"] = "red";
    fruits["banana"] = "yellow";
    fruits["guava"]  = "green";

    fruits.containsKey("apple");                        // returns true if the KEY is present in Map
    //fruits.update("apple", (value) => "green");         // Update the VALUE for the given KEY
   // fruits.remove("apple");                             // removes KEY and it's VALUE and returns the VALUE
    print(fruits.isEmpty);                                     // returns true if the Map is empty
    print(fruits.length);                                      // returns number of elements in Map
//	fruits.clear();
    print(fruits);


  }

                 // Deletes all elements
}