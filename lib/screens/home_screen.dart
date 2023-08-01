import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_crud/services/auth/auth_provider.dart';
import 'package:firebase_crud/services/media/data_provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          const Text("Home Screen"),
          isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    await AuthProvider.logout();

                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: const Text("Logout"),
                ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles();

              if (result != null) {
                final File file = File(result.files.single.path!);
                final url = await MediaProvider.uploadImage(
                    file, DateTime.now().microsecondsSinceEpoch.toString());

                debugPrint(url);
              } else {
                // User canceled the picker
              }
            },
            child: const Text("Upload Data"),
          ),
          Image.network(
            'https://firebasestorage.googleapis.com/v0/b/crud-session-70009.appspot.com/o/images%2Fhttps___therealchamps.com_wp-content_uploads_getty-images_2017_07_947096288.jpeg?alt=media&token=76ec939c-2b03-41d0-a5c8-f0e3bd076341',
          ),
        ],
      ),
    );
  }
}
