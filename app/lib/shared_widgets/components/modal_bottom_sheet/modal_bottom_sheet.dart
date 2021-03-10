import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app/theme/app_theme.dart';

class ModalBottomSheet extends StatefulWidget {
  final String title;
  final bool centerTitle;
  final String text;
  final List<Widget> children;
  final double initialChildSize;

  ModalBottomSheet({
    this.title,
    this.centerTitle = true,
    this.text,
    this.children,
    this.initialChildSize = 0.5,
  });

  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  double iframeHeight = Get.size.height;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.of(context).padding.bottom;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: widget.initialChildSize,
      maxChildSize: 0.9,
      builder: (_, controller) {
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8.0),
              topLeft: Radius.circular(8.0),
            ),
          ),
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 4,
                  width: 70,
                  decoration: BoxDecoration(
                    color: textLow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 24, 24, 24 + paddingBottom),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.title != null
                          ? Column(
                              children: [
                                Text(
                                  widget.title,
                                  style: bodyBold.copyWith(color: textHigh),
                                ),
                                SizedBox(height: 10),
                              ],
                            )
                          : Container(),
                      if (widget.children != null) ...widget.children else Container(),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class PlatformViewVerticalGestureRecognizer extends VerticalDragGestureRecognizer {
  PlatformViewVerticalGestureRecognizer({PointerDeviceKind kind}) : super(kind: kind);

  Offset _dragDistance = Offset.zero;

  @override
  void addPointer(PointerEvent event) {
    startTrackingPointer(event.pointer);
  }

  @override
  void handleEvent(PointerEvent event) {
    _dragDistance = _dragDistance + event.delta;
    if (event is PointerMoveEvent) {
      final double dy = _dragDistance.dy.abs();
      final double dx = _dragDistance.dx.abs();

      if (dy > dx && dy > kTouchSlop) {
        // vertical drag - accept
        resolve(GestureDisposition.accepted);
        _dragDistance = Offset.zero;
      } else if (dx > kTouchSlop && dx > dy) {
        // horizontal drag - stop tracking
        stopTrackingPointer(event.pointer);
        _dragDistance = Offset.zero;
      }
    }
  }

  @override
  String get debugDescription => 'horizontal drag (platform view)';

  @override
  void didStopTrackingLastPointer(int pointer) {}
}
