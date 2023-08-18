import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'create_username_pass.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _healthHistoryController =
      TextEditingController();
  final TextEditingController _medicalAllergiesController =
      TextEditingController();
  final TextEditingController _donationHistoryController =
      TextEditingController();
  final TextEditingController _preferredLocationController =
      TextEditingController();
  bool _isDonorConsentChecked = false;
  int _currentPage = 0;
  final PageController _pageController =
      PageController(); // PageController to handle page navigation
  String _selectedBloodGroup = 'A+';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Create an Account'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Lottie.network(
                  'https://lottie.host/8b59d95a-1eae-4e2a-bc71-19e854f3b33e/LQG3FlxiEx.json'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 5, left: 5, bottom: 15, top: 150),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.white, Colors.green],
                    begin: Alignment.topLeft),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(-12, 2),
                      spreadRadius: 12,
                      blurRadius: 10)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      children: [
                        _buildPersonalInformationPage(),
                        _buildHealthInformationPage(),
                        _buildConsentPage(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor:
                              _currentPage == index ? Colors.blue : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_currentPage == 2) {
            // Handle account creation logic here
            String name = _nameController.text;
            String dob = _dobController.text;
            String gender = _genderController.text;
            String bloodGroup = _bloodGroupController.text;
            String weight = _weightController.text;
            String contact = _contactController.text;
            String healthHistory = _healthHistoryController.text;
            String medicalAllergies = _medicalAllergiesController.text;
            String donationHistory = _donationHistoryController.text;
            String preferredLocation = _preferredLocationController.text;

            print('Name: $name');
            print('Date of Birth: $dob');
            print('Gender: $gender');
            print('Blood Group: $bloodGroup');
            print('Weight: $weight');
            print('Contact Information: $contact');
            print('Health History: $healthHistory');
            print('Medical Allergies: $medicalAllergies');
            print('Blood Donation History: $donationHistory');
            print('Preferred Donation Location: $preferredLocation');
            print('Donor Consent: $_isDonorConsentChecked');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UsernamePasswordPage()),
            );
          } else {
            // Move to the next page
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Icon(
          _currentPage == 2 ? Icons.done : Icons.arrow_forward,
        ),
      ),
    );
  }

  Widget _buildPersonalInformationPage() {
    String _selectedBloodGroup = 'B+';
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40.0),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
                labelText: 'Full Name', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: _dobController,
            decoration: const InputDecoration(
                labelText: 'Date of Birth', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: _genderController,
            decoration: const InputDecoration(
                labelText: 'Gender', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Choose Blood Group: $_selectedBloodGroup'),
                DropdownButton<String>(
                  value: _selectedBloodGroup,
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        _selectedBloodGroup = value;
                      });
                    }
                  },
                  items: <String>[
                    'A+',
                    'A-',
                    'B+',
                    'B-',
                    'AB+',
                    'AB-',
                    'O+',
                    'O-'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  icon: const Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthInformationPage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40.0),
          TextField(
            controller: _weightController,
            decoration: const InputDecoration(
                labelText: 'Weight', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _contactController,
            decoration: const InputDecoration(
                labelText: 'Contact Information', border: OutlineInputBorder()),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _healthHistoryController,
            decoration: const InputDecoration(
                labelText: 'Health History', border: OutlineInputBorder()),
            maxLines: 3,
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _medicalAllergiesController,
            decoration: const InputDecoration(
                labelText: 'Medical Allergies', border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }

  Widget _buildConsentPage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40.0),
          TextField(
            controller: _donationHistoryController,
            decoration: const InputDecoration(
                labelText: 'Blood Donation History',
                border: OutlineInputBorder()),
            maxLines: 3,
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _preferredLocationController,
            decoration: const InputDecoration(
                labelText: 'Preferred Donation Location',
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16.0),
          CheckboxListTile(
            title: const Text('I agree to donate blood'),
            value: _isDonorConsentChecked,
            onChanged: (value) {
              setState(() {
                _isDonorConsentChecked = value ?? false;
              });
            },
          ),
        ],
      ),
    );
  }
}

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
                decoration: const InputDecoration(
                    labelText: 'Username', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    labelText: 'Password', border: OutlineInputBorder()),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _confirmpasswordController,
                decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder()),
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
