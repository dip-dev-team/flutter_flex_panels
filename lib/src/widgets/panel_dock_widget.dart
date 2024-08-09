import 'package:flutter/material.dart';

import '../models/panel_data.dart';

class PanelDockWidget extends StatefulWidget {
  final PanelData panelData;

  const PanelDockWidget({super.key, required this.panelData});

  @override
  State<PanelDockWidget> createState() => _PanelDockWidgetState();
}

class _PanelDockWidgetState extends State<PanelDockWidget> {
  late PanelData _panelData;

  @override
  void initState() {
    super.initState();
    _panelData = widget.panelData;
  }

  @override
  void didUpdateWidget(covariant PanelDockWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.panelData != widget.panelData) {
      setState(() {
        _panelData = widget.panelData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final maxSize = _panelData.panelType.sizes
        .reduce((value, element) => value > element ? value : element);
    if (_panelData.panelPosition.orientation.isHorizontal) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxSize),
        child: SizedBox(
          height: _panelData.isExpanded ? maxSize : null,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_panelData.panelPosition.isTop) _panelData.child,
              _panelData.panelEnd.call(
                _panelData.isExpanded,
                (value) => setState(() {
                  _panelData = _panelData.copyWith(isExpanded: value);
                }),
              ),
              if (_panelData.panelPosition.isBottom) _panelData.child,
            ],
          ),
        ),
      );
    } else {
      return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxSize),
        child: Container(
          width: _panelData.isExpanded ? maxSize : null,
          color: Colors.red,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_panelData.panelPosition.isLeft) _panelData.child,
              _panelData.panelEnd.call(
                _panelData.isExpanded,
                (value) {
                  _panelData = _panelData.copyWith(isExpanded: value);
                },
              ),
              if (_panelData.panelPosition.isRight) _panelData.child,
            ],
          ),
        ),
      );
    }
  }
}
