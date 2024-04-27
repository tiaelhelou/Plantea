import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:google_fonts/google_fonts.dart';
class ListViewSearchExample extends StatefulWidget {
  const ListViewSearchExample({Key? key}) : super(key: key);

  @override
  State<ListViewSearchExample> createState() => _ListViewSearchExampleState();
}

class _ListViewSearchExampleState extends State<ListViewSearchExample> {
  final List<String> myCoolStrings = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Some other item'
  ];

  final List<String> _results = [];

  void _handleSearch(String input) {
    _results.clear();
    for (var str in myCoolStrings) {
      if (str.toLowerCase().contains(input.toLowerCase())) {
        setState(() {
          _results.add(str);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder")),
      body: Column(
        children: [
          SizedBox(
            height: 45,
            width: 360,
            child: TextField(
              onChanged: _handleSearch,
              style: GoogleFonts.poppins(
                color: const Color(0xff020202),
                fontSize: 20,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xfff1f1f1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search for Items",
                hintStyle: GoogleFonts.poppins(
                    color: const Color(0xffb2b2b2),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    decorationThickness: 6),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: _results.isEmpty
                ? ListView.builder(
                    itemCount: myCoolStrings.length,
                    itemBuilder: (context, index) {
                      final data = myCoolStrings[index];
                      return ListTile(
                          leading: const Icon(Icons.list),
                          trailing: const Text(
                            "",
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                          title: Text(data));
                    })
                : ListView.builder(
                    itemCount: _results.length,
                    itemBuilder: (context, index) {
                      final data = _results[index];
                      return ListTile(
                          leading: const Icon(Icons.list),
                          trailing: const Text(
                            "",
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                          title: Text(data));
                    }),
          ),
        ],
      ),
    );
  }
}