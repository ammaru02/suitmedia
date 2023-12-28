import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  
  final List<Map<String, dynamic>> users = List.generate(
    10,
    (index) => {
      'firstName': 'Firstname',
      'lastName': 'Lastname',
      'email': 'email@example.com',
      'avatarUrl': 'https://via.placeholder.com/150',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen',style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0, 
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(users[index]['avatarUrl']),
              ),
              title: Text('${users[index]['firstName']} ${users[index]['lastName']}'),
              subtitle: Text(users[index]['email']),
            ),
          );
        },
      ),
    );
  }
}
