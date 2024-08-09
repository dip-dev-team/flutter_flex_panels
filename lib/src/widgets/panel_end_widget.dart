import 'package:flutter/material.dart';

import '../models/panel_position.dart';

class PanelHidedWidget extends StatefulWidget {
  final bool isExpanded;
  final PanelPosition position;
  final ValueChanged<bool>? onExpanded;
  final ValueChanged<double>? onMoving;

  const PanelHidedWidget({
    super.key,
    required this.isExpanded,
    required this.position,
    this.onExpanded,
    this.onMoving,
  });

  @override
  State<PanelHidedWidget> createState() => _PanelHidedWidgetState();
}

class _PanelHidedWidgetState extends State<PanelHidedWidget> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  @override
  void didUpdateWidget(covariant PanelHidedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isExpanded != widget.isExpanded) {
      setState(() {
        _isExpanded = widget.isExpanded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
          widget.onExpanded?.call(_isExpanded);
        },
        child: Container(
          width: widget.position.orientation.isVertical ? 12.0 : null,
          height: widget.position.orientation.isHorizontal ? 12.0 : null,
          alignment: Alignment.center,
          child: Icon(
            widget.position.isLeft
                ? _isExpanded
                    ? Icons.arrow_right
                    : Icons.keyboard_arrow_left
                : widget.position.isTop
                    ? widget.isExpanded
                        ? Icons.arrow_drop_down
                        : Icons.keyboard_arrow_up
                    : widget.position.isRight
                        ? _isExpanded
                            ? Icons.arrow_left
                            : Icons.keyboard_arrow_right
                        : _isExpanded
                            ? Icons.arrow_drop_up
                            : Icons.keyboard_arrow_down,
            size: 8.0,
          ),
        ),
      ),
    );
  }
}
