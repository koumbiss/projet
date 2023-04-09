import 'package:flutter/material.dart';

class RegionSelection extends StatelessWidget {
  final List<String> _regions = [
    "Amérique",
    "Asie",
    "Europe",
    "Sahel",
    "Australie"
  ];

  RegionSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Region"),
      ),
      body: ListView.builder(
        itemCount: _regions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_regions[index]),
            onTap: () {
              // Return selected region to previous screen
              Navigator.pop(context, _regions[index]);
            },
          );
        },
      ),
    );
  }
}
