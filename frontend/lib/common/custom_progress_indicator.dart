import 'package:flutter/material.dart';

class AlternatingProgressIndicator extends StatefulWidget {
  final double value;
  final double minHeight;
  final String? semanticsLabel;
  final String? semanticsValue;

  const AlternatingProgressIndicator({
    super.key,
    this.value = 0.0,
    this.minHeight = 4.0,
    this.semanticsLabel,
    this.semanticsValue,
  });

  @override
  State<AlternatingProgressIndicator> createState() =>
      _AlternatingProgressIndicator();
}

class _AlternatingProgressIndicator extends State<AlternatingProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _colorAnimation = TweenSequence<Color?>(
      [
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.red,
            end: Colors.orange,
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.orange,
            end: Colors.yellow,
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.yellow,
            end: Colors.green,
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.green,
            end: Colors.blue,
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.blue,
            end: Colors.purple,
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.purple,
            end: Colors.red,
          ),
        ),
      ],
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: widget.value,
      minHeight: widget.minHeight,
      semanticsLabel: widget.semanticsLabel,
      semanticsValue: widget.semanticsValue,
      valueColor: _colorAnimation,
    );
  }
}
