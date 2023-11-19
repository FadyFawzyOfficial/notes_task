import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ColorsListView extends StatefulWidget {
  final Function(Color) selectColor;
  final int? initialColor;

  const ColorsListView({
    super.key,
    required this.selectColor,
    this.initialColor,
  });

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  var selectedColorIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.initialColor != null) {
      selectedColorIndex = kColorPalette.indexOf(Color(widget.initialColor!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: kColorPalette.length,
        itemBuilder: (context, index) {
          final selectedColor = kColorPalette[index];
          return InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            onTap: () {
              widget.selectColor(selectedColor);
              setState(() => selectedColorIndex = index);
            },
            child: ColorItem(
              color: selectedColor,
              isSelected: selectedColorIndex == index,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorItem({
    super.key,
    required this.color,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) => isSelected
      ? CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: color,
          ),
        )
      : CircleAvatar(
          radius: 24,
          backgroundColor: color,
        );
}
