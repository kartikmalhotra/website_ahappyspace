import 'dart:math';

import 'package:ahs_website/constants/const.dart';
import 'package:flutter/material.dart';

class DotsIndicatorWidget extends StatefulWidget {
  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Selected Dot
  final int selectedDot;

  /// The color of the dots.
  /// Defaults to `Colors.white`.
  final Color color;

  const DotsIndicatorWidget({
    Key? key,
    required this.controller,
    required this.itemCount,
    required this.selectedDot,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  State<DotsIndicatorWidget> createState() => _DotsIndicatorWidgetState();
}

class _DotsIndicatorWidgetState extends State<DotsIndicatorWidget> {
  /// The PageController that this DotsIndicator is representing.
  PageController? controller;

  /// The number of items managed by the PageController
  int? itemCount;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  Color? color;

  late int selectedDot;

  void _changeDot() {
    if (controller?.hasClients ?? false) {
      if (controller?.page == 0) {
        selectedDot = 0;
      } else if (controller?.page == 1) {
        selectedDot = 1;
      } else if (controller?.page == 2) {
        selectedDot = 2;
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    selectedDot = widget.selectedDot;
    controller = widget.controller;
    controller!.addListener(_changeDot);
    itemCount = widget.itemCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      controller: controller!,
      itemCount: itemCount!,
      onPageSelected: (value) {
        if (controller?.hasClients ?? false) {
          if (value == 0) {
            controller!.jumpToPage(0);
          } else if (value == 1) {
            controller!.jumpToPage(1);
          } else if (value == 2) {
            controller!.jumpToPage(2);
          }
          _changeDot();
        }
      },
      selectedDot: selectedDot,
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  const DotsIndicator({
    Key? key,
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    required this.selectedDot,
    this.color = Colors.white,
  }) : super(listenable: controller, key: key);

  final int selectedDot;

  /// The PageController that this DotsIndicator is representing.
  final ScrollController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1.5;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(0.0, 1.0 - ((selectedDot) - index).abs()),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return InkWell(
      onTap: () => onPageSelected(index),
      child: SizedBox(
        width: _kDotSpacing,
        child: Center(
          child: Material(
            color: index == selectedDot ? greenColor : Colors.grey,
            type: MaterialType.circle,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 3.0),
              width: _kDotSize * zoom,
              height: _kDotSize * zoom,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
