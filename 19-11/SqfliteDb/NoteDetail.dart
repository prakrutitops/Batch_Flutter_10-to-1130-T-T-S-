//@dart=2.9
import 'package:demotest/Note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'database_helper.dart';


class NoteDetail extends StatefulWidget
{
  final String appBarTitle;
  final Note note;

  NoteDetail(this.note,this.appBarTitle);
  NoteDetailState  createState() => NoteDetailState(this.note,this.appBarTitle);


}

class NoteDetailState extends State<NoteDetail>
{

  final String appBarTitle;
  final Note note;
  DatabaseHelper datasbeHelper = DatabaseHelper();

  static var _priorities = ['High', 'Low'];



  NoteDetailState(this.note,this.appBarTitle);


  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;

        return WillPopScope
          (
            child: Scaffold(
              appBar: AppBar(
                title: Text(appBarTitle),
                leading: IconButton(icon: Icon(
                    Icons.arrow_back),
                    onPressed: ()
                    {
                      // Write some code to control things, when user press back button in AppBar
                     // moveToLastScreen();
                    }
                ),
              ),

              body: Padding(
                padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                child: ListView(
                  children: <Widget>[

                    // First element
                    ListTile(
                      title: DropdownButton(
                          items: _priorities.map((String dropDownStringItem) {
                            return DropdownMenuItem<String> (
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),

                          style: textStyle,

                          value: getPriorityAsString(note.priority),

                          onChanged: (valueSelectedByUser) {
                            setState(() {
                              debugPrint('User selected $valueSelectedByUser');
                              //updatePriorityAsInt(valueSelectedByUser);
                            });
                          }
                      ),
                    ),

                    // Second Element
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: TextField(
                        controller: titleController,
                        style: textStyle,
                        onChanged: (value) {
                          debugPrint('Something changed in Title Text Field');
                          updateTitle();
                        },
                        decoration: InputDecoration(
                            labelText: 'Title',
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            )
                        ),
                      ),
                    ),

                    // Third Element
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: TextField(
                        controller: descriptionController,
                        style: textStyle,
                        onChanged: (value) {
                          debugPrint('Something changed in Description Text Field');
                          updateDescription();
                        },
                        decoration: InputDecoration(
                            labelText: 'Description',
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            )
                        ),
                      ),
                    ),

                    // Fourth Element
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ElevatedButton(
                              /*color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,*/
                              child: Text(
                                'Save',
                                textScaleFactor: 1.5,
                              ),
                              onPressed: () {
                                setState(() {
                                  debugPrint("Save button clicked");
                                  _save();
                                });
                              },
                            ),
                          ),

                          Container(width: 5.0,),

                          Expanded(
                            child: ElevatedButton(
                              /*  color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,*/
                              child: Text(
                                'Delete',
                                textScaleFactor: 1.5,
                              ),
                              onPressed: () {
                                setState(() {
                                  debugPrint("Delete button clicked");
                                  //_delete();
                                });
                              },
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ),
          );
  }
  void updateTitle(){
    note.title = titleController.text.toString();
  }

  // Update the description of Note object
  void updateDescription() {
    note.description = descriptionController.text.toString();
  }
  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0];  // 'High'
        break;
      case 2:
        priority = _priorities[1];  // 'Low'
        break;
    }
    return priority;
  }

  void _save() async
  {

    note.date = DateFormat.yMMMd().format(DateTime.now());

    int result;
    if (note.id != null)
    {  // Case 1: Update operation
     // result = await datasbeHelper.updateNote(note);
    }
    else { // Case 2: Insert Operation
      result = await datasbeHelper.insertNote(note);
    }

    if(result!=0)
    {
    _showAlertDialog('status', 'Note Saved Succesfully');
    }
    else
    {
      _showAlertDialog('status', 'Problem Occured');
    }
  }
  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

}