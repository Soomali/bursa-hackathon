import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorySlider extends StatefulWidget {
  const CategorySlider({required this.categories,super.key});
  final List<String> categories;

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.categories.length,
      itemBuilder: (context, index) {
        String data = widget.categories[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: ChipTheme(
            data: ChipThemeData(

              backgroundColor: Colors.redAccent[700],
              selectedShadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              )
            ),
            child: Chip(
              label: Text(
                data,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
