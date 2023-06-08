import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projet_etudes/client/homepage.dart';
import 'package:projet_etudes/client/regionselection.dart';

class LocationSelection extends StatefulWidget {
  const LocationSelection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocationSelectionState createState() => _LocationSelectionState();
}

class _LocationSelectionState extends State<LocationSelection> {
  String _selectedRegion = "Location";
  final List<String> _regions = [
    "Amérique",
    "Asie",
    "Europe",
    "Sahel",
    "Australie",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/region.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "LOCATION",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black.withOpacity(0.8),
              child: DropdownButton<String>(
                value: _selectedRegion,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (newValue) {
                  setState(() {
                    _selectedRegion = newValue!;
                    if (_selectedRegion == "Location") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegionSelection(),
                        ),
                      );
                    } else {
                      onRegionSelected(_selectedRegion);
                    }
                  });
                },
                items: _regions
                    .where((region) => region != "Location")
                    .map((String region) {
                  return DropdownMenuItem<String>(
                    value: region,
                    child: Text(region),
                  );
                }).toList()
                  ..insert(
                    0,
                    const DropdownMenuItem<String>(
                      value: "Location",
                      child: Text("Location"),
                    ),
                  ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  // Do something with selected region
                  if (kDebugMode) {
                    print("Selected Region: $_selectedRegion");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                ),
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void onRegionSelected(String region) {
    // Enregistrer la région sélectionnée
    // ...
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => MyHomePage(
                collections: const [],
              )),
    );
  }
}
