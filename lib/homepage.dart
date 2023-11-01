import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> users =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  AppBar(
       title: Text('Hello there'),
     ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context,index){
          final user = users [index];
          final name = user['name']['first'];
          final email = user ['email'];
          final imageUrl = user['picture']['thumbnail'];

        return ListTile(
          leading: CircleAvatar(child: Image.network(imageUrl),),
          title: Text(name),
          subtitle: Text(email),
        );
      },),


      floatingActionButton:FloatingActionButton(
        onPressed: fetchusers,
      ),
    );
  }
  void fetchusers() async
  {
    print('fetch users called!');
    const url ='https://randomuser.me/api/?results=12';
    final uri= Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    users =json ['results'];
    // setState(() {
      users = json ['results'];

    // });
    print('fetchUsers completed');
  }
}
