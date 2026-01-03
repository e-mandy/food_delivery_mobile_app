import 'dart:math';

import 'package:flutter/material.dart';

class SlideToStart extends StatefulWidget {
  final VoidCallback onSubmitted;
  final String text;
  final Widget? icon;

  const SlideToStart({
    Key? key,
    required this.onSubmitted,
    this.text = "Swipe to Explore",
    this.icon,
  }) : super(key: key);

  @override
  State<SlideToStart> createState() => _SlideToStartState();
}

class _SlideToStartState extends State<SlideToStart> {
  double _dragValue = 0.0;
  double _maxWidth = 0.0;
  bool _submitted = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _maxWidth = constraints.maxWidth;
        // height of the slider
        const double height = 65;
        // diameter of the knob
        const double knobSize = 55;
        const double padding = (height - knobSize) / 2;

        return Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(height / 2),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Background Text
              Center(
                child: Opacity(
                  opacity: max(
                    0,
                    1 - (2 * _dragValue / (_maxWidth - knobSize)),
                  ),
                  child: Text(
                    widget.text,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              // Draggable Knob
              Positioned(
                left: padding + _dragValue,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    if (_submitted) return;
                    setState(() {
                      _dragValue = (_dragValue + details.delta.dx).clamp(
                        0.0,
                        _maxWidth - knobSize - (padding * 2),
                      );
                    });
                  },
                  onHorizontalDragEnd: (details) {
                    if (_submitted) return;
                    final threshold =
                        (_maxWidth - knobSize - (padding * 2)) * 0.7;
                    if (_dragValue > threshold) {
                      // Trigger callback
                      setState(() {
                        _dragValue = _maxWidth - knobSize - (padding * 2);
                        _submitted = true;
                      });
                      widget.onSubmitted();
                    } else {
                      // Reset
                      setState(() {
                        _dragValue = 0.0;
                      });
                    }
                  },
                  child: Container(
                    width: knobSize,
                    height: knobSize,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepOrange.withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child:
                        widget.icon ??
                        const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
