import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import "package:flutter/cupertino.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:gap/gap.dart";
import 'package:to_do_app/common/show_modal.dart';
import 'package:to_do_app/view/home_page.dart';
import 'package:to_do_app/widget/card_to_do_list_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp())); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
    );
  }
}

