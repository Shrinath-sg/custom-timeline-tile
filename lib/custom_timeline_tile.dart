import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TimelineTile extends StatelessWidget {
  const TimelineTile({
    super.key,
    this.lineWidth = 1.3,
    this.circleSize,
    this.lineColor,
    this.circleColor,
    this.leadingChild,
    required this.child,
  });

  final double? lineWidth;
  final double? circleSize;
  final Color? lineColor;
  final Color? circleColor;
  final Widget? child;
  final Widget? leadingChild;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerLeft,
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 3.w,
              ),
              if (leadingChild != null) leadingChild ?? Container(),
              SizedBox(
                width: 3.w,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: lineColor ?? Theme.of(context).iconTheme.color,
                    width: lineWidth,
                    child: Column(
                      children: [
                        //for making dotted lines
                        for (int i = 0; i < 10; i++)
                          Column(
                            children: [
                              Container(
                                color: Colors.white,
                                height: 2,
                              ),
                              const SizedBox(
                                height: 3,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                  Icon(
                    Icons.circle,
                    size: circleSize,
                    color: circleColor,
                  ),
                ],
              ),
              Expanded(
                flex: 3,
                child: child ??
                    Container(
                      height: 10.h,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
