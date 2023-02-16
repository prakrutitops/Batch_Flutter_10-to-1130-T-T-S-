import 'package:flutter/material.dart';

import '../../data/data_model.dart';


class UserTile extends StatelessWidget {
  final User user;

  UserTile({required this.user});

  /*String userTitle() {
    String title = "";
    if (user.gender == "Male") {
      title = "Mr.";
    } else if (user.gender == "Female") {
      title = "Ms.";
    }
    return title;
  }
*/
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Hero(
              tag: user.product_name,
              child: CircleAvatar(
               // backgroundImage: NetworkImage(user.product),
              ),
            ),
            title: Text('${user.product_name} ${user.product_price}'),
            //subtitle: Text(user.product_name),
            /*onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      //builder: (context) => UserDetailsPage(user: user)));
            },*/
          ),
          Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}
