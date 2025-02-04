import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
         children: [
          Center(
            child: Text("WELCOME",style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black45,
              
            ),),
          ),
          ElevatedButton(
            style: ButtonStyle(
           shape: WidgetStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
              backgroundColor: WidgetStatePropertyAll(Colors.blue)
            ),
            onPressed: (){
              Navigator.pushNamed(context, "/");
            }, child: Text("SingOut",style: TextStyle(color: Colors.white),))
         ],
      ),
    );
  }
}