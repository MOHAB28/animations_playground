import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatelessWidget {
  const TweenAnimationBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TweenAnimationBuilder'),
      ),
      body: const Center(
        child: HSVColorSelector(),
      ),
    );
  }
}

class HSVColorSelector extends StatefulWidget {
  const HSVColorSelector({super.key});

  @override
  State<HSVColorSelector> createState() => _HSVColorSelectorState();
}

class _HSVColorSelectorState extends State<HSVColorSelector> {
  double _hue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: _hue),
          duration: const Duration(milliseconds: 1500),
          builder: (context, hue, child) {
            var hsvColor = HSVColor.fromAHSV(1.0, hue, 1.0, 1.0);
            return Container(
              height: 200.0,
              width: 200.0,
              color: hsvColor.toColor(),
            );
          },
        ),
        const SizedBox(height: 50.0),
        Container(
          height: 40.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                for (var hsv = 0.0; hsv <= 360; hsv++)
                  HSVColor.fromAHSV(1.0, hsv, 1.0, 1.0).toColor(),
              ],
              stops: [
                for (var hsv = 0.0; hsv <= 360; hsv++) hsv.toDouble() / 360.0,
              ],
            ),
          ),
        ),
        const SizedBox(height: 15.0),
        Slider.adaptive(
          value: _hue,
          min: 0,
          max: 360.0,
          onChanged: (value) => setState(() {
            _hue = value;
          }),
        )
      ],
    );
  }
}
