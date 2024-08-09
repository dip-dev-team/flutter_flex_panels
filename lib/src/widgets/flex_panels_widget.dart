import 'package:flutter/material.dart';

import '../models/panel_data.dart';
import 'panel_dock_widget.dart';

class FlexPanelsWidget extends StatelessWidget {
  final List<PanelData> panelDatas;
  final Widget child;

  const FlexPanelsWidget({
    super.key,
    this.panelDatas = const <PanelData>[],
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final leftPanels =
        panelDatas.where((element) => element.panelPosition.isLeft).toList();
    final topPanels =
        panelDatas.where((element) => element.panelPosition.isTop).toList();
    final rightPanels =
        panelDatas.where((element) => element.panelPosition.isRight).toList();
    final bottomPanels =
        panelDatas.where((element) => element.panelPosition.isBottom).toList();

    return Scaffold(
      body: Row(
        children: [
          if (leftPanels.isNotEmpty)
            Column(
              children: List.generate(
                  leftPanels.length,
                  (index) => Expanded(
                      child: PanelDockWidget(panelData: leftPanels[index]))),
            ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: Column(
                children: [
                  if (topPanels.isNotEmpty)
                    Row(
                      children: List.generate(
                          topPanels.length,
                          (index) => Expanded(
                              child: PanelDockWidget(
                                  panelData: topPanels[index]))),
                    ),
                  Expanded(child: child),
                  if (bottomPanels.isNotEmpty)
                    Row(
                      children: List.generate(
                          bottomPanels.length,
                          (index) => Expanded(
                              child: PanelDockWidget(
                                  panelData: bottomPanels[index]))),
                    ),
                ],
              ),
            ),
          ),
          if (rightPanels.isNotEmpty)
            Column(
              children: List.generate(
                  rightPanels.length,
                  (index) => Expanded(
                      child: PanelDockWidget(panelData: rightPanels[index]))),
            ),
        ],
      ),
    );
  }
}
