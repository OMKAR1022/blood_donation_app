import 'package:blood_donation_app/home_page.dart';
import 'package:flutter/material.dart';

class UsernamePasswordPage extends StatefulWidget {
  @override
  _UsernamePasswordPageState createState() => _UsernamePasswordPageState();
}

class _UsernamePasswordPageState extends State<UsernamePasswordPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Username and Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _confirmpasswordController,
                decoration: const InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Handle username and password selection logic here
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  String confirmpass = _confirmpasswordController.text;

                  // Add your logic to create the account with the selected username and password
                  // For this example, we'll just print the data
                  print('Username: $username');
                  print('Password: $password');
                  print('confirmpass:$confirmpass');
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const home()));
                },
                child: const Text('Finish'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
