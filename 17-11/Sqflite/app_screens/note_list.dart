//@dart=2.9
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';


import '../models/note.dart';
import '../utils/database_helper.dart';
import 'note_detail.dart';



class NoteList extends StatefulWidget
{


	@override
  State<StatefulWidget> createState()
	{

    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

	DatabaseHelper databaseHelper = DatabaseHelper();
	List<Note> noteList;
	int count = 0;


	@override
  Widget build(BuildContext context) {


    return Scaffold(

	    appBar: AppBar(
		    title: Text('Notes'),
	    ),



	    floatingActionButton: FloatingActionButton(
		    onPressed: () {
		      debugPrint('FAB clicked');
		      navigateToDetail(Note('', '', 2), 'Add Note');
		    },

		    tooltip: 'Add Note',

		    child: Icon(Icons.add),

	    ),
    );
  }






	void navigateToDetail(Note note, String title) async
	{
		bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
			return NoteDetail(note, title);
		}));

		if (result == true) {
		//	updateListView();
		}
	}



}







