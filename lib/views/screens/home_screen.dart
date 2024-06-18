// import 'package:auksion_app/views/screens/edit_profile_screen.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   ThemeMode _themeMode = ThemeMode.light;
//   String _selectedLanguage = 'English'; // Default language

//   void _showLanguageSelectionDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             'Language selection',
//             style: TextStyle(fontSize: 14),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 title: Text('English'),
//                 onTap: () {
//                   setState(() {
//                     _selectedLanguage = 'English';
//                   });
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: Text('Uzbek'),
//                 onTap: () {
//                   setState(() {
//                     _selectedLanguage = 'Uzbek';
//                   });
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 _themeMode = _themeMode == ThemeMode.light
//                     ? ThemeMode.dark
//                     : ThemeMode.light;
//               });
//             },
//             icon: Icon(_themeMode == ThemeMode.light
//                 ? Icons.dark_mode
//                 : Icons.light_mode),
//           ),
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               children: [
//                 Center(
//                   child: Container(
//                     width: 150,
//                     height: 150,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(75),
//                       color: Colors.amber,
//                     ),
//                     child: ClipOval(
//                       child: Image.network(
//                         'https://media.istockphoto.com/vectors/user-sign-icon-person-symbol-human-avatar-vector-id639085642?k=20&m=639085642&s=612x612&w=0&h=3CjMsltGuIFU2gjrDyhqRuRNOz_ra139pP5y6Ef1EWU=',
//                         fit: BoxFit.cover,
//                         width: 150,
//                         height: 150,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Container(
//                   width: 130,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => EditProfileScreen(),
//                         ),
//                       );
//                     },
//                     child: const Center(
//                       child: Text(
//                         'Edit Profile',
//                         style: TextStyle(fontSize: 10, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   width: 330,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: const Color.fromARGB(255, 163, 163, 163),
//                   ),
//                   child: TextButton(
//                     onPressed: () {
//                       _showLanguageSelectionDialog(context);
//                     },
//                     child: Text(
//                       'Language: $_selectedLanguage',
//                       style: TextStyle(fontSize: 12, color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               margin: EdgeInsets.only(bottom: 20),
//               child: TextButton(
//                 onPressed: () {},
//                 child: const Text(
//                   'Log out',
//                   style: TextStyle(
//                     color: const Color.fromARGB(255, 170, 11, 0),
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
