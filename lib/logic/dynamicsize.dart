import 'package:flutter/material.dart';

abstract class DynamicSize {
  Size getSize(GlobalKey pagekey);
}

class DynamicSizeImpl extends DynamicSize {
  @override
  Size getSize(GlobalKey<State<StatefulWidget>> pagekey) {
    RenderBox _pageBox = pagekey.currentContext.findRenderObject();
    return _pageBox.size;
  }
}