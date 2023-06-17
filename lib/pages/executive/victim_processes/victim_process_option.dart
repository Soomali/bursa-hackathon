import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VictimProcessOption extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onPress;
  VictimProcessOption(
      {required this.label, required this.iconPath, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: Border(bottom: BorderSide(color: Colors.redAccent.shade700)),
      leading: SvgPicture.asset(
        iconPath,
        color: Colors.redAccent.shade700,
        width: 32,
      ),
      title: Text(label),
      onTap: onPress,
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.redAccent.shade700,
      ),
    );
  }
}
