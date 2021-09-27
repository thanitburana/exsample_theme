import 'package:flutter/material.dart';

class ToolbarBack extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final GestureTapCallback onTap;
  const ToolbarBack({Key? key, this.child, this.color, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: color,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          InkResponse(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: onTap,
            child: const Icon(Icons.arrow_back_rounded),
          ),
          Expanded(child: child ?? Container())
        ],
      ),
    );
  }
}
