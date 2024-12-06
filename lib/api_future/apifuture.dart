// // ignore_for_file: prefer_const_constructors

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:http/http.dart' as http;

// class Apifuturescr extends StatefulWidget {
//   const Apifuturescr({super.key});

//   @override
//   State<Apifuturescr> createState() => _ApifuturescrState();
// }

// class _ApifuturescrState extends State<Apifuturescr> {
//   var url = "https://api.nstack.in/v1/todos?page=1&limit=10";

//   getData() async {
//     var response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       var datajson = jsonDecode(response.body);
//       return datajson;
//     } else {
//       print("Error");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: getData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data['entries'].length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   margin: EdgeInsets.all(10),
//                   child: ListTile(
//                     title: Text("${snapshot.data['entries'][index]['title']}"),
//                     subtitle: Text(
//                         "${snapshot.data['entries'][index]['description']}"),
//                   ),
//                 );
//               },
//             );
//           } else {
//             return Center(
//               child: SpinKitFoldingCube(
//                 duration: Duration(seconds: 3),
//                 color: Colors.pink[300],
//                 size: 50.0,
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
