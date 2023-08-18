import 'package:blood_donation_app/LoginPage.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'message.dart';
import 'message_page.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _selectedIndex = 0;
  List<String> selectedFilters = [];

  final List<String> filters = [
    'A+',
    'O+',
    'AB+',
    'A-',
    'B+',
    'O-',
    'B-',
    'AB-'
  ];
  List<String> locations = [
    'New York City',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Miami',
    'San Francisco',
    'Seattle',
    'Boston',
    'Denver',
    'Atlanta',
  ];

  List<String> filteredLocations = [];

  @override
  void initState() {
    filteredLocations = locations;
    super.initState();
  }

  void filterLocations(String searchQuery) {
    setState(() {
      if (searchQuery.isNotEmpty) {
        filteredLocations = locations
            .where((location) =>
                location.toLowerCase().startsWith(searchQuery.toLowerCase()))
            .toList();
      } else {
        filteredLocations = locations;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _showLocationSelectionDialog(context);
    });
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Text(
            'Pune',
            style: TextStyle(color: Colors.blue),
          ),
          GestureDetector(
              onTap: () {
                _showLocationSelectionDialog(context);
              },
              child: const Icon(Icons.location_on_outlined)),
        ],
        backgroundColor: Colors.redAccent.withOpacity(0.4),
        title: const Text('Blood Donation'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Stack(
                children: [
                  SearchBar(
                    hintText: 'Search location',
                    onChanged: filterLocations,
                    onTap: () {
                      setState(() {
                        filteredLocations = locations;
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 18, left: 335),
                    child: Icon(Icons.location_on_rounded),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    spacing: 8.0,
                    children: filters.map((filter) {
                      return FilterChip(
                        label: Text(filter),
                        selected: selectedFilters.contains(filter),
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              selectedFilters.add(filter);
                            } else {
                              selectedFilters.remove(filter);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
            Center(
              child: Container(
                width: 500,
                height: 380,
                child: Card(
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60'),
                          radius: 50.0,
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Sam',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5.0),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'Blood Group: O+',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Contact No: 123-456-7890',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Location: Mumbai',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Last Date of Blood Donation: 2023-08-06',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 15.0),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const msg()));
                            },
                            child: const Text('Message'))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 500,
                height: 390,
                child: Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjd8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60'),
                          radius: 50.0,
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Rushi',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5.0),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'Blood Group: A+',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Contact No: 123-456-7890',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Location: Kothrud',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Last Date of Blood Donation: 2023-08-06',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 15.0),
                        ElevatedButton(onPressed: () {}, child: const Text('Message'))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 500,
                height: 390,
                child: Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60'),
                          radius: 50.0,
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Sumit',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5.0),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'Blood Group: B+',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Contact No: 123-456-7890',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Location: Swarget',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Last Date of Blood Donation: 2023-08-06',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 15.0),
                        ElevatedButton(onPressed: () {}, child: const Text('Message'))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 500,
                height: 390,
                child: Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60'),
                          radius: 50.0,
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Sakshi',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5.0),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'Blood Group: AB+',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Contact No: 123-456-7890',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Location: Loni Kalbhor',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Last Date of Blood Donation: 2023-08-06',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 15.0),
                        ElevatedButton(onPressed: () {}, child: const Text('Message'))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 500,
                height: 390,
                child: Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDd8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60'),
                          radius: 50.0,
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Aman',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5.0),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'Blood Group: A-',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Contact No: 123-456-7890',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Location: Hadapsar',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Last Date of Blood Donation: 2023-08-06',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 15.0),
                        ElevatedButton(onPressed: () {}, child: const Text('Message'))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black12,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.2),
                ),
                child: const Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://e0.pxfuel.com/wallpapers/44/247/desktop-wallpaper-blood-donation-png-2-png.jpg'),
                      radius: 60.0,
                    )
                  ],
                )),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.redAccent,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.redAccent, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.redAccent,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.redAccent, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const message()));
        },
        child: const Icon(Icons.message),
      ),
    );
  }

  void _showLocationSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Allow Blood Donation to access your device location ?'),
          content: const Text('This app requires access to your location.'),
          actions: [
            CupertinoDialogAction(
              child: const Text('Deny'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text('Allow'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
