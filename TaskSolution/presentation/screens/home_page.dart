import 'package:flutter/material.dart';
import 'package:searchlist/data/data_model.dart';

import '../../domain/repository.dart';
import '../components/loading_widget.dart';
import '../components/user_tile.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> _users = <User>[];
  List<User> _usersDisplay = <User>[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsers().then((value) {
      setState(() {
        _isLoading = false;
        _users.addAll(value);
        _usersDisplay = _users;
        print(_usersDisplay.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemBuilder: (context, index)
            {
              if (!_isLoading)
              {
                return index == 0 ? _searchBar() : UserTile(user: this._usersDisplay[index - 1]);
              }
              else
              {
                return LoadingView();
              }
            },
            itemCount: _usersDisplay.length + 1,
          ),
        ),
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: TextField(
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          setState(() {
            _usersDisplay = _users.where((u) {
              var fName = u.product_name.toLowerCase();
              var lName = u.product_price.toLowerCase();
              //var job = u.job.toLowerCase();
              return fName.contains(searchText) || lName.contains(searchText) ;
            }).toList();
          });
        },
        // controller: _textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search Users',
        ),
      ),
    );
  }
}
