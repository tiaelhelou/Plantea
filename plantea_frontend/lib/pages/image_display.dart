import 'dart:io';
import 'package:async_extension/async_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Productdetails extends StatefulWidget {
  const Productdetails({super.key});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  File? image;
Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
if(image == null) return;
final imageTemp = File(image.path);
setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker Example"),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
                 color: Color(0xFF8A9A5B),
                child: const Text(
                    "Pick Image from Gallery",
                  style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold
                  )
                ),
                onPressed: () {
                   pickImage();
                }
            ),
            MaterialButton(
                 color: Color(0xFF8A9A5B),
                child: const Text(
                    "Pick Image from Camera",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold
                    )
                ),
                onPressed: () {
                  pickImage();
                }
            ),
            const SizedBox(height: 20), // Add some space between buttons and image
          if (image != null) // Conditionally show the image if it's not null
            Image.file(
              image!, // Display the selected image
              height: 200, // Adjust height as needed
            ),
          ],
        ),
      )
    );
  }
}


////////////////updated version to save in db
/**import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Productdetails extends StatefulWidget {
  const Productdetails({Key? key}) : super(key: key);

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  File? image;

  Future<void> pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      
      final imageFile = File(pickedFile.path);
      setState(() => image = imageFile);

      // Convert image to bytes
      final imageBytes = await image!.readAsBytes();

      // Save image bytes to database (example with Firebase Firestore)
      await saveImageToDatabase(imageBytes);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> saveImageToDatabase(List<int> imageBytes) async {
    // Convert image bytes to base64 string
    String base64Image = base64Encode(imageBytes);

    // Save base64 string to Firestore or your preferred database
    // Example with Firebase Firestore
    await FirebaseFirestore.instance.collection('images').add({
      'image': base64Image,
      // Add other data if needed
    });

    print('Image saved to database');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker Example"),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                "Pick Image from Gallery",
                style: TextStyle(
                  color: Colors.white70, fontWeight: FontWeight.bold
                )
              ),
              onPressed: () {
                pickImage();
              }
            ),
            if (image != null) // Conditionally show the image if it's not null
              Image.file(
                image!, // Display the selected image
                height: 200, // Adjust height as needed
              ),
          ],
        ),
      )
    );
  }
}
 */