import 'package:flutter/material.dart';

class message extends StatefulWidget {
  const message({super.key});

  @override
  State<message> createState() => _messageState();
}

class _messageState extends State<message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Message Filed'),),
      body: Column(
        children: [
          SizedBox(height: 100,width: double.infinity,
            child:  Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60'),
                ),
                title: Text('omkar'),
                subtitle: Text('New Message arrived'),
              ),
            ),
          ),
          SizedBox(height: 100,width: double.infinity,
            child:  Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://plus.unsplash.com/premium_photo-1689551670902-19b441a6afde?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZSUyMHBpY3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                ),
                title: Text('Monica'),
                subtitle: Text('New Message arrived'),
              ),
            ),
          ),
          SizedBox(height: 100,width: double.infinity,
            child:  Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=400&q=60'),
                ),
                title: Text('Joy'),
                subtitle: Text('New Message arrived'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
