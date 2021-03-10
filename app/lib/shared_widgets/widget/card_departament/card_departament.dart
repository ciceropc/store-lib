import 'package:flutter/material.dart';
import 'package:app/theme/app_theme.dart';

class CardDepartament extends StatelessWidget {
  final String title;
  final String imageUrl;
  final LinearGradient gradient;
  final Function onTap;
  final bool isResponsive;

  const CardDepartament({Key key, this.title, this.imageUrl, this.gradient, this.onTap, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveWidth = MediaQuery.of(context).size.width / 2.43;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isResponsive
            ? responsiveWidth < 152
                ? 152
                : responsiveWidth
            : 152,
        height: 100,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              spreadRadius: 1,
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            imageUrl != null
                ? Positioned(
                    top: 8,
                    left: 13,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Colors.white,
                        child: Center(
                          child: FadeInImage.memoryNetwork(
                            image: imageUrl,
                            width: 45,
                            height: 45,
                            fit: BoxFit.fitWidth,
                            placeholder: kTransparentImage,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            Positioned(
              bottom: 8,
              left: 8,
              child: Text(
                title,
                style: captionBold.copyWith(
                  fontSize: 12.8,
                  letterSpacing: -0.71,
                  color: primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
