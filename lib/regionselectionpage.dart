import 'package:flutter/material.dart';

class RegionSelectionPage extends StatefulWidget {
  const RegionSelectionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegionSelectionPageState createState() => _RegionSelectionPageState();
}

class _RegionSelectionPageState extends State<RegionSelectionPage> {
  late String _selectedRegion;

  final List<String> _regions = [
    'Europe',
    'Amerique',
    'Asie',
    'Moyen Orient',
    'Afrique',
    'Sahel'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/region.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: DropdownButton<String>(
            hint: const Text(
                "Veuillez selectionner votre region s'il vous plait"),
            value: _selectedRegion,
            onChanged: (value) {
              setState(() {
                _selectedRegion = value!;
              });
            },
            items: _regions.map((region) {
              return DropdownMenuItem<String>(
                value: region,
                child: Text(region),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
