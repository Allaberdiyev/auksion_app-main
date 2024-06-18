import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:auksion_app/views/screens/edit_profile_screen.dart';
import 'package:auksion_app/views/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  String _selectedLanguage = 'English'; // Default language

  void _showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Language selection',
            style: TextStyle(fontSize: 14),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('English'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'English';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Uzbek'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'Uzbek';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.all(20),
            child: ZoomTapAnimation(
              onTap: () async {
                SharedPreferences sharedpref =
                    await SharedPreferences.getInstance();
                sharedpref.remove('userData');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Loginpage();
                    },
                  ),
                );
              },
              child: Icon(Icons.logout),
            ),
          ),
          IconButton(
              onPressed: () async {
                final themeode = await AdaptiveTheme.getThemeMode();
                if (themeode == AdaptiveThemeMode.dark) {
                  isDark = !isDark;
                  AdaptiveTheme.of(context).setLight();
                } else {
                  isDark = !isDark;
                  AdaptiveTheme.of(context).setDark();
                }
              },
              icon: isDark ? Icon(Icons.dark_mode) : Icon(Icons.light_mode))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75),
                      color: Colors.amber,
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://cdn2.iconfinder.com/data/icons/business-people-face-avatar-5/500/business_244-512.png',
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 330,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 163, 163, 163),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _showLanguageSelectionDialog(context);
                    },
                    child: Text(
                      'Language: $_selectedLanguage',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Log out',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 170, 11, 0),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
