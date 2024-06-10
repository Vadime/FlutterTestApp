import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class AnimationProcessingPage extends StatefulWidget {
  const AnimationProcessingPage({super.key});

  @override
  AnimationProcessingPageState createState() => AnimationProcessingPageState();
}

class AnimationProcessingPageState extends State<AnimationProcessingPage>
    with SingleTickerProviderStateMixin {
  Artboard? _artboard;
  RiveAnimationController? _controller;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/animations/soarus.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        artboard.addController(_controller = SimpleAnimation('Run'));
        setState(() => _artboard = artboard);
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _togglePlay() {
    setState(() {
      if (_controller?.isActive ?? false) {
        _controller?.isActive = false;
      } else {
        _controller?.isActive = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Animation Processing',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Expanded(
                child: Center(
                  child: _artboard == null
                      ? const SizedBox()
                      : Rive(
                          artboard: _artboard!,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              ElevatedButton(
                onPressed: _togglePlay,
                child: const Text('Animate'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
