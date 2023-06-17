import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatefulWidget {
  String path;
  SvgImage({Key? key, required this.path}) : super(key: key);

  @override
  State<SvgImage> createState() => _SvgImageState();
}

class _SvgImageState extends State<SvgImage> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(widget.path,
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6);
  }
}
