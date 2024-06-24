import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Map<String, dynamic>? dataMap;
  Map<String, dynamic>? Donedata;
  Future API() async {
    http.Response response;
    response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
    if (response.statusCode == 200) {
      setState(() {
        dataMap = jsonDecode(response.body);
        Donedata = dataMap!['data'];
        print(Donedata);
      });
    }
  }

  @override
  void initState() {
    API();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Get API",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Donedata == null
              ? const CupertinoActivityIndicator()
              : ListTile(
                  title: Center(
                    child: Text(
                      Donedata!['first_name'].toString() +
                          " " +
                          Donedata!['last_name'].toString() +
                          " \n " +
                          (Donedata!['email'].toString()),
                    ),
                  ),
                )),
    );
  }
}
