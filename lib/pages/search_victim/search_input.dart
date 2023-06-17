import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final void Function(String) onChanged;
  const SearchInput({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration:
          InputDecoration(border: OutlineInputBorder(), hintText: 'Arama'),
    );
  }
}
