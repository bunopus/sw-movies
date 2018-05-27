import 'package:flutter/material.dart';
import 'package:mobile/utils/utils.dart';

class ArcBannerImage extends StatelessWidget {
  ArcBannerImage(this.imageData);

  final String imageData;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return new ClipPath(
      clipper: new ArcClipper(),
      child: new Image.memory(
        strToBase64(imageData),
        width: screenWidth,
        height: 200.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = new Offset(size.width / 4, size.height);
    var firstPoint = new Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint =
        new Offset(size.width - (size.width / 4), size.height);
    var secondPoint = new Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
