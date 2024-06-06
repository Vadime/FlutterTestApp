import 'package:flutter/material.dart';

class AnimationProcessingPage extends StatefulWidget {
  const AnimationProcessingPage({super.key});

  @override
  AnimationProcessingPageState createState() => AnimationProcessingPageState();
}

class AnimationProcessingPageState extends State<AnimationProcessingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
              const Spacer(),
              AnimatedBuilder(
                animation: _animation,
                builder: (BuildContext context, Widget? child) {
                  return Opacity(
                    opacity: _animation.value,
                    child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              BorderRadius.circular(_animation.value * 100),
                        )),
                  );
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_animationController.status ==
                      AnimationStatus.completed) {
                    _animationController.reverse();
                  } else {
                    _animationController.forward();
                  }
                },
                child: const Text('Animate'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
