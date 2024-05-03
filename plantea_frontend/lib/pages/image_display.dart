import 'dart:io';
import 'package:async_extension/async_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class Productdetails extends StatefulWidget {
  const Productdetails({super.key});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  final picker = ImagePicker();
  File? file;
  XFile? pickedImage;
  List<File?> fileList = [];
  Future pickImageFromGallery() async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      File? file = File(pickedImage!.path);
      fileList.add(file);
      print(fileList);
    });
  }

  void dltImages(data) {
    fileList.remove(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker "),
        actions: [
          IconButton(
              onPressed: () {
                pickImageFromGallery();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: fileList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.file(
                          File(fileList[i]!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              dltImages(fileList[i]);
                            });
                          },
                          child: const Icon(Icons.cancel, color: Colors.red),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 1),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(File(
                    '/data/user/0/com.example.plantea_frontend/cache/e08e626b-84cc-4dc2-93e8-fee1481514cd/1000073128.jpg'))),
            /**
                     * display in profile
                     */
          ),
        ],
      ),
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