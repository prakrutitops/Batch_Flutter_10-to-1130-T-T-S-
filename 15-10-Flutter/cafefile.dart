//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/SecondScreen.dart';

class MyCafe extends StatefulWidget
{
  @override
  _MyStateCafe createState() => _MyStateCafe() ;


}

class _MyStateCafe extends State<MyCafe>
{
  bool one = false;
  bool two = false;
  bool three = false;
  var total =0;
  var data="";
  var amount =0;
  var amount2 =0;
  var amount3 =0;




  @override
  Widget build(BuildContext context)
  {
      return MaterialApp(

          home: Scaffold(

            appBar: AppBar(

              title:Text("Cafe Orderting App"),

            ),
              body: Container(

          padding: new EdgeInsets.all(22.0),
        child: Column(

            children: <Widget>[
              SizedBox(width: 10,),
              Text('Menu',style: TextStyle(fontSize: 20.0), ),
              CheckboxListTile
                (
                  //secondary: Image.asset("",width: 250,height: 250,),

                  title: const Text('Pizza'),
                  subtitle: Text('Rs.100'),
                  value: this.one,
                  onChanged: (bool value)
                  {
                    setState(() {

                      this.one=value;
                      if(one==true)
                      {
                          amount+=100;
                      }
                      else
                      {
                        amount-=100;
                      }

                    });

                    /*setState(() {

                      this.one = value;


                      //print("MyCheckbox1 :"+one.toString());
                      data+="\n Pizza @ rs.100";
                    });*/
                  }
              ),

              CheckboxListTile
                (

                  secondary: const Icon(Icons.food_bank),
                  title: const Text('Burger'),
                  subtitle: Text('Rs.50'),
                  value: this.two,
                  onChanged: (bool value)
                  {
                      setState(() {

                        this.two = value;
                        if(two==true)
                        {
                          amount+=50;
                        }
                        else
                        {
                          amount-=50;
                        }
                      });

                    /*setState(() {


                      //amount+=50;
                      data+="\n Burger @ rs.50";
                      // print("MyCheckbox2 :"+two.toString());
                    });*/
                  }
              ),

              CheckboxListTile
                (

                  secondary: const Icon(Icons.food_bank),
                  title: const Text('Coffee'),
                  subtitle: Text('Rs.70'),
                  value: this.three,
                  onChanged: (bool value)
                  {

                    setState(() {

                      this.three = value;
                      if(three==true)
                      {
                        amount+=70;
                      }
                      else
                      {
                        amount-=70;
                      }
                    });

                    /*setState(() {

                      this.three = value;
                     // amount+=70;
                      data+="\n Coffee @ rs.70";

                      //print("MyCheckbox2 :"+three.toString());


                    });*/
                  }
              ),
              ElevatedButton(
                  onPressed: ()
                  {


                    print("\n Bill \n $data \n Total: $amount");

                  },
                  child: Text("Order")
              )

            ]
        ),

      ),
          ),

      );
  }

}