import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your username';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your email';
    } else if (!value.contains('@gmail.com')) {
      return 'Email must contain @gmail.com';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your number';
    }
    return null;
  }

  String? _currentImageUrl;
  String? _newImageUrl;
  bool _isEditingImage = false;

  @override
  void initState() {
    super.initState();
    _image_save_preference();
  }

  void _image_save_preference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentImageUrl = prefs.getString('profileImageUrl') ?? '';
      _newImageUrl = _currentImageUrl;
    });
  }

  Future<void> save_image(String imageUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImageUrl', imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isEditingImage = true;
                });
              },
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75),
                  color: Colors.amber,
                ),
                child: ClipOval(
                  child: Image.network(
                    _currentImageUrl ??
                        'https://cdn2.iconfinder.com/data/icons/business-people-face-avatar-5/500/business_244-512.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            if (_isEditingImage)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: _newImageUrl ?? '',
                      onChanged: (value) {
                        setState(() {
                          _newImageUrl = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(
                          Icons.image_outlined,
                          color: Colors.black,
                        ),
                        hintText: 'Enter image URL',
                        hintStyle: const TextStyle(color: Colors.black),
                        labelText: 'Image URL',
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await save_image(_newImageUrl ?? '');
                            setState(() {
                              _isEditingImage = false;
                              _currentImageUrl = _newImageUrl;
                            });
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _newImageUrl = _currentImageUrl;
                            });
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(
                        CupertinoIcons.person,
                        color: Colors.black,
                      ),
                      hintText: 'Your name',
                      hintStyle: const TextStyle(color: Colors.black),
                      labelText: 'Your name',
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                    style: const TextStyle(color: Colors.black),
                    validator: _validateName,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                      hintText: 'Your Email',
                      hintStyle: const TextStyle(color: Colors.black),
                      labelText: 'Your Email',
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                    style: const TextStyle(color: Colors.black),
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(
                        Icons.phone_android_rounded,
                        color: Colors.black,
                      ),
                      hintText: 'Your number',
                      hintStyle: const TextStyle(color: Colors.black),
                      labelText: 'Your number',
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                    style: const TextStyle(color: Colors.black),
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(
                        Icons.vpn_key_outlined,
                        color: Colors.black,
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.black),
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
