import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorySlider extends StatefulWidget {
  final void Function(String) onTapCategory;
  const CategorySlider(
      {required this.categories, required this.onTapCategory, super.key});
  final List<String> categories;

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  late String activeCategory;
  @override
  void initState() {
    super.initState();
    activeCategory = widget.categories.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.redAccent.shade700.withOpacity(.7),
          Color.lerp(Colors.grey.shade400, Colors.redAccent.shade700, .4)!
        ], end: Alignment.bottomRight, begin: Alignment.topLeft),
        border: Border(
            bottom: BorderSide(color: Colors.redAccent.shade700, width: 2.5),
            top: BorderSide(color: Colors.redAccent.shade700, width: 2.5)),
      ),
      child: ListView.builder(
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
                  )),
              child: ActionChip(
                backgroundColor: activeCategory == data
                    ? Colors.white
                    : Colors.redAccent.shade700,
                elevation: 5,
                onPressed: () {
                  widget.onTapCategory(data);
                  setState(() {
                    this.activeCategory = data;
                  });
                },
                label: Text(
                  data,
                  style: TextStyle(
                      fontSize: 18,
                      color: activeCategory == data
                          ? Colors.redAccent.shade700
                          : Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
