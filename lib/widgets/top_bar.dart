// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  final String _barTitle;
  Widget? primaryAction;
  Widget? secondaryAction;
  double? fontSize;

  late double _deviceHeight;
  late double _deviceWidth;

  TopBarWidget(this._barTitle,
      {Key? key, this.primaryAction, this.secondaryAction, this.fontSize = 35})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return _buildUI();
  }

  Widget _buildUI() {
    return SizedBox(
      height: _deviceHeight * 0.10,
      width: _deviceWidth,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (secondaryAction != null) secondaryAction!,
          _titleBar(),
          if (primaryAction != null) primaryAction!,
        ],
      ),
    );
  }

  Widget _titleBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        _barTitle,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
