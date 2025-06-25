import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:speak4u/Models/commands.dart';
import 'package:speak4u/Widgets/Home%20Widgets/command_header.dart';
import 'package:speak4u/Widgets/Home%20Widgets/command_list.dart';
import 'package:speak4u/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/invert.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final url = "https://raw.githubusercontent.com/aryamanbansal15/Commands-JSON-API/main/commands.json";
  
  @override

  void initState() {
    super.initState();
    loadData();
  }

  
  loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    final response =
    await http.get(Uri.parse(url));

    final catalogueJson = response.body;

    final decodedData = jsonDecode(catalogueJson);
    var productData = decodedData["categories"];
    CommandModel.commands = List.from(productData)
        .map<Command>((item) => Command.fromMap(item))
        .toList();
    setState(() {});
  }

  Widget build(BuildContext context) {
    final textColor = invertColor(Theme.of(context).cardColor);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.cardColor,
        title: Text("SPEAK4U", style: GoogleFonts.oswald(
          textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
            color: textColor,
        ),)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommandHeader(),
              if(CommandModel.commands.isNotEmpty)
                Expanded(
                  child: const CommandList().py16(),
                )
              else
                Center(child: CircularProgressIndicator()),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.customRoute);
                },
                child: "CUSTOM COMMANDS".text.xl2.color(textColor).make(),
              ).w(300).h(60).centered(),
            ],
          )
        )
      )
    );
  }
}
