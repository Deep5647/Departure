import 'dart:async';
import 'package:flutter/material.dart';

class spl extends StatefulWidget {
  const spl({Key? key}) : super(key: key);

  @override
  State<spl> createState() => _splState();
}

class _splState extends State<spl> {


  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child:Container(
          height: double.infinity,
          width: double.infinity,

          decoration: const BoxDecoration(
            image:DecorationImage(image: AssetImage('assets/img/krishna.png'),
            ),
          ),

        ),




      ),

    );
  }
}
