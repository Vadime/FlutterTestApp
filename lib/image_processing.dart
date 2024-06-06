import 'dart:io';

import 'package:flutter/material.dart';

class ImageProcessingPage extends StatefulWidget {
  const ImageProcessingPage({super.key});

  @override
  ImageProcessingPageState createState() => ImageProcessingPageState();
}

class ImageProcessingPageState extends State<ImageProcessingPage> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Image Processing',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Spacer(),
            Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                  image: image != null
                      ? DecorationImage(
                          image: FileImage(image!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: image != null
                    ? null
                    : const Center(
                        child: Text('No image selected'),
                      ),
              ),
            ),
            const Spacer(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //applyFilter();
              },
              child: const Text('Apply Filter'),
            )
          ],
        ),
      ),
    );
  }
}
