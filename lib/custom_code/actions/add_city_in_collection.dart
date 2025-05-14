// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future addCityInCollection(String? city) async {
  if (city == null || city.isEmpty) {
    print('City is null or empty.');
    return;
  }

  try {
    // Query the 'cities' collection to check if the city already exists
    final querySnapshot = await FirebaseFirestore.instance
        .collection('cities')
        .where('city', isEqualTo: city)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // City already exists, do not create a new document
      print('City "$city" already exists in the collection.');
      return;
    }

    // City does not exist, add it to the collection
    await FirebaseFirestore.instance.collection('cities').add({
      'city': city,
    });

    print('City "$city" added to the collection successfully.');
  } catch (e) {
    print('Error adding city to collection: $e');
  }
}
