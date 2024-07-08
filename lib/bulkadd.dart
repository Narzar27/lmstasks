import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Creation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BulkUserCreationScreen(),
    );
  }
}

class BulkUserCreationScreen extends StatefulWidget {
  @override
  _BulkUserCreationScreenState createState() => _BulkUserCreationScreenState();
}

class _BulkUserCreationScreenState extends State<BulkUserCreationScreen> {
  List<UserForm> userForms = [UserForm(key: UniqueKey())];

  void _addUserForm() {
    setState(() {
      userForms.add(UserForm(key: UniqueKey()));
    });
  }

  void _removeUserForm(Key key) {
    setState(() {
      userForms.removeWhere((form) => form.key == key);
    });
  }

  void _createUsers() {
    // Placeholder for actual user creation logic
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Users Created'),
        content: Text('The users have been successfully created.'),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Creation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: userForms.length,
                itemBuilder: (context, index) {
                  return userForms[index];
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: Text('Add User'),
                  onPressed: _addUserForm,
                ),
                ElevatedButton(
                  child: Text('Create Users'),
                  onPressed: _createUsers,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UserForm extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _familyNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();

  UserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  final state = context
                      .findAncestorStateOfType<_BulkUserCreationScreenState>();
                  state?._removeUserForm(key!);
                },
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _familyNameController,
              decoration: InputDecoration(labelText: 'Family Name'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _licenseController,
              decoration: InputDecoration(labelText: 'License'),
            ),
          ],
        ),
      ),
    );
  }
}
