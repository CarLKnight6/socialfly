import 'package:flutter/material.dart';

import '../utils/screen.dart';

class BottomActions extends StatelessWidget {
  const BottomActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TERMS & SERVICES",
                style: TextStyle(
                  fontSize: ScreenUtil.scaleFactor * 13,
                  fontFamily: 'Raleway',
                ),
              ),
              const VerticalDivider(
                thickness: 2,
                color: Colors.black,
              ),
              Text(
                "CODE & CONDUCT",
                style: TextStyle(
                  fontSize: ScreenUtil.scaleFactor * 13,
                  fontFamily: 'Raleway',
                ),
              ),
              const VerticalDivider(
                thickness: 2,
                color: Colors.black,
              ),
              Text(
                "WEBSITE",
                style: TextStyle(
                  fontSize: ScreenUtil.scaleFactor * 13,
                  fontFamily: 'Raleway',
                ),
              ),
              const VerticalDivider(
                thickness: 2,
                color: Colors.black,
              ),
              Text(
                "CAREERS",
                style: TextStyle(
                  fontSize: ScreenUtil.scaleFactor * 13,
                  fontFamily: 'Raleway',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: ScreenUtil.safeBlockVertical * 0.5,
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "EVENTS",
                style: TextStyle(
                  fontSize: ScreenUtil.scaleFactor * 13,
                  fontFamily: 'Raleway',
                ),
              ),
              const VerticalDivider(
                thickness: 2,
                color: Colors.black,
              ),
              Text(
                "PARTNERS",
                style: TextStyle(
                  fontSize: ScreenUtil.scaleFactor * 13,
                  fontFamily: 'Raleway',
                ),
              ),
              const VerticalDivider(
                thickness: 2,
                color: Colors.black,
              ),
              Text(
                "ONLINE STORE",
                style: TextStyle(
                  fontSize: ScreenUtil.scaleFactor * 13,
                  fontFamily: 'Raleway',
                ),
              ),
              const VerticalDivider(
                thickness: 2,
                color: Colors.black,
              ),
              Text(
                "SUPPORT HUB",
                style: TextStyle(
                  fontSize: ScreenUtil.scaleFactor * 13,
                  fontFamily: 'Raleway',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
