import 'package:flutter/material.dart';

class UserHeaderWidget extends StatelessWidget {
  const UserHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 40,
            child: FlutterLogo(
              size: 45,
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                'Arijeet Chakraborty',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'arijeetc6@gmail.com',
              ),
            ),
          ),
          Icon(
            Icons.person,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.settings,
            size: 30,
          ),
        ],
      ),
    );
  }
}
