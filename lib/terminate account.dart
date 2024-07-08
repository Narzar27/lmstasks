import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.blueAccent,
        fontFamily: 'Roboto',
      ),
      home: TerminateAccountPage(),
    );
  }
}

class TerminateAccountPage extends StatefulWidget {
  @override
  _TerminateAccountPageState createState() => _TerminateAccountPageState();
}

class _TerminateAccountPageState extends State<TerminateAccountPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController feedbackController = TextEditingController();

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Termination'),
          content: Text('Are you sure you want to terminate your account?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showReasonDialog(context);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _showReasonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ReasonDialog(feedbackController: feedbackController);
      },
    );
  }

  void _showTerminationConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Account Terminated'),
          content: Text('Your account has been terminated.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terminate Account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'You are about to terminate the account:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Username: user@example.com', // Replace with dynamic user info
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Enter your password to confirm',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.0),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showConfirmationDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  'Terminate Account',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReasonDialog extends StatefulWidget {
  final TextEditingController feedbackController;

  ReasonDialog({required this.feedbackController});

  @override
  _ReasonDialogState createState() => _ReasonDialogState();
}

class _ReasonDialogState extends State<ReasonDialog> {
  String selectedReason = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Why are you terminating your account?'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RadioListTile(
              title: Text('Reason 1'),
              value: 'Reason 1',
              groupValue: selectedReason,
              onChanged: (value) {
                setState(() {
                  selectedReason = value as String;
                });
              },
            ),
            RadioListTile(
              title: Text('Reason 2'),
              value: 'Reason 2',
              groupValue: selectedReason,
              onChanged: (value) {
                setState(() {
                  selectedReason = value as String;
                });
              },
            ),
            RadioListTile(
              title: Text('Reason 3'),
              value: 'Reason 3',
              groupValue: selectedReason,
              onChanged: (value) {
                setState(() {
                  selectedReason = value as String;
                });
              },
            ),
            TextField(
              controller: widget.feedbackController,
              decoration: InputDecoration(
                labelText: 'Additional feedback (optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            _showTerminationConfirmationDialog(context);
          },
          child: Text('Submit'),
        ),
      ],
    );
  }

  void _showTerminationConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Account Terminated'),
          content: Text('Your account has been terminated.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
