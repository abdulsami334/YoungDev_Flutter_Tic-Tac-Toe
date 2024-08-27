import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Screens/home_page.dart';
import 'package:tic_tac_toe/const/colors.dart';

class Players_info extends StatefulWidget {
  const Players_info({super.key});

  @override
  State<Players_info> createState() => _Players_infoState();
}

class _Players_infoState extends State<Players_info> {
  final player1_controller = TextEditingController();
  final player2_controller = TextEditingController();
  void savesnames() {
    final player1_Name = player1_controller.text;
    final player2_Name = player2_controller.text;
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  player1Name: player1_Name,
                  player2Name: player2_Name,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Tic Tac Toe",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Text(
                  "Play for the Joy of It!",
                  style: TextStyle(
                      color: Color.fromARGB(228, 10, 61, 98),
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                controller: player1_controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor)),
                    hintText: "Player 1 Name",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: player2_controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: backgroundColor)),
                    hintText: "Player 2 Name",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor, // background color
                    foregroundColor: Colors.white, // text color
                  ),
                  onPressed: savesnames,
                  child: Text(
                    "Enter Game",
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
