import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:speak4u/Models/commands.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://raw.githubusercontent.com/aryamanbansal15/Commands-JSON-API/refs/heads/main/commands.json";
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
    var productData = decodedData["products"];
    CommandModel.commands = List.from(productData)
        .map<Command>((item) => Command.fromMap(item))
        .toList();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SPEAK4U", style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Column(
        children: [],
      )
    );
  }
}
