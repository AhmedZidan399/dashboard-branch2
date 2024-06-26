import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dashboard2/dashboard/controller/DashController.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Welcome To Our Program',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white54,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
         
          SizedBox(
            height: 20,
          ),

          // Button for Page 1
          // ListTile(
          //   title: ElevatedButton(
          //     onPressed: () {
          //       // Navigate to Page 1 (UserPage) using DashController
          //       context.read<DashController>().onChangeIndex(0); // Change page index to 1 (UserPage)
          //     },
          //     child: Text('Home'),
          //   ),
          // ),
          // Other buttons for other pages
          ListTile(
            title:  ElevatedButton(
              
              onPressed: () {
                context
                    .read<DashController>()
                    .onChangeIndex(1); // Change page index to 1 (UserPage)
              },
              child: Text('User'),
            ),
          ),
          // ListTile(
          //   title: ElevatedButton(
          //     onPressed: () {
          //       context
          //           .read<DashController>()
          //           .onChangeIndex(2); // Change page index to 1 (UserPage)
          //     },
          //     child: Text('Services'),
          //   ),
          // ),
          ListTile(
            title: ElevatedButton(
              onPressed: () {
                context
                    .read<DashController>()
                    .onChangeIndex(3); // Change page index to 1 (UserPage)
              },
              child: Text('About'),
            ),
          )
        ],
      ),
    );
  }
}
