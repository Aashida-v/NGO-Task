import 'package:flutter/material.dart';

class VolunteerForm extends StatefulWidget {
  @override
  _VolunteerFormState createState() => _VolunteerFormState();
}

class _VolunteerFormState extends State<VolunteerForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String phone = '';
  String city = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/bg.jpg', // Make sure this image exists in assets/
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.5), // semi-transparent overlay
        ),
        Center(
          child: SingleChildScrollView(
            child: Card(
              margin: EdgeInsets.all(20),
              color: Colors.white.withOpacity(0.9),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Volunteer Registration",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Name'),
                        onChanged: (val) => name = val,
                        validator: (val) => val!.isEmpty ? 'Enter name' : null,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Phone'),
                        keyboardType: TextInputType.phone,
                        onChanged: (val) => phone = val,
                        validator: (val) => val!.isEmpty ? 'Enter phone' : null,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'City'),
                        onChanged: (val) => city = val,
                        validator: (val) => val!.isEmpty ? 'Enter city' : null,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Submit', style: TextStyle(fontSize: 16,color: Colors.white)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Thank you for registering, $name!')),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}