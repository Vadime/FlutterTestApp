import 'dart:ui';

import 'package:flutter/material.dart';

class ImageProcessingPage extends StatefulWidget {
  const ImageProcessingPage({super.key});

  @override
  ImageProcessingPageState createState() => ImageProcessingPageState();
}

class ImageProcessingPageState extends State<ImageProcessingPage> {
  ColorFiltered? initImage;
  ColorFiltered? image;
  String? selectedFilter;

  @override
  void initState() {
    super.initState();
    initImage = ColorFiltered(
        colorFilter:
            const ColorFilter.mode(Colors.transparent, BlendMode.saturation),
        child: Image.asset('assets/images/test2.jpg'));

    image = initImage;
  }

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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Center(
                child: image ?? const Text('No Image'),
              ),
            ),
            const Spacer(),
            const SizedBox(height: 20),

            Align(
              alignment: Alignment.center,
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(10),
                elevation: 1,
                hint: const Text('Select Filter'),
                underline: const SizedBox(),
                value: selectedFilter,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedFilter = newValue;
                  });
                  if (selectedFilter == null) {
                    none();
                  } else if (selectedFilter == 'Grayscale') {
                    greyScale();
                  } else if (selectedFilter == 'Sepia') {
                    sepia();
                  } else if (selectedFilter == 'Blur') {
                    blur();
                  }
                },
                items: <String?>[
                  null,
                  'Grayscale',
                  'Sepia',
                  'Blur',
                  // Add more filter options here
                ].map<DropdownMenuItem<String>>((String? value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value ?? 'None'),
                  );
                }).toList(),
              ),
            ),

            // Add more FilterCheckbox widgets for other image filters
          ],
        ),
      ),
    );
  }

  none() {
    setState(() {
      image = initImage;
    });
  }

  greyScale() {
    setState(() {
      image = ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Colors.grey,
          BlendMode.saturation,
        ),
        child: initImage!,
      );
    });
  }

  sepia() {
    setState(() {
      image = ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Colors.brown,
          BlendMode.saturation,
        ),
        child: initImage!,
      );
    });
  }

  blur() {
    setState(() {
      image = ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Colors.transparent,
          BlendMode.saturation,
        ),
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: initImage!,
        ),
      );
    });
  }
  
    
}
