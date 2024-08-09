import 'package:flutter/widgets.dart';

import '../widgets/panel_end_widget.dart';

import 'panel_type.dart';
import 'panel_position.dart';

import '../callback_types.dart';

final class PanelData {
  /// If [true] so, the panel sits above the content and overlaps it.
  /// If [false], the panel moves the content.
  final bool isPopUp;

  /// Whether the panel is open or hidden
  final bool isExpanded;

  /// Panel position can be:
  /// [PanelPosition.left],
  /// [PanelPosition.top],
  /// [PanelPosition.right],
  /// and [PanelPosition.bottom]
  final PanelPosition panelPosition;

  /// Panel type can be:
  /// [PanelType.fixed], [PanelType.flex] and [PanelType.segmented]
  final PanelType panelType;

  /// [PanelEndCallback] Callback for creation the hided panel widget
  late final PanelEndCallback panelEnd;

  /// On panel expanded callback
  final ValueChanged<bool>? onExpanded;

  /// Panel content
  final Widget child;

  PanelData({
    this.isPopUp = false,
    this.isExpanded = false,
    required this.panelType,
    required this.panelPosition,
    PanelEndCallback? panelEnd,
    this.onExpanded,
    required this.child,
  }) {
    this.panelEnd = panelEnd ??
        (bool isExpanded, ValueChanged<bool> onExpand) => PanelHidedWidget(
              isExpanded: isExpanded,
              position: panelPosition,
              onExpanded: onExpanded,
            );
  }

  /// Create a new data instance with differences
  PanelData copyWith({bool? isExpanded, Widget? child}) => PanelData(
      isPopUp: isPopUp,
      isExpanded: isExpanded ?? this.isExpanded,
      panelType: panelType,
      panelPosition: panelPosition,
      panelEnd: panelEnd,
      child: child ?? this.child);

  @override
  bool operator ==(Object other) {
    return other is PanelData &&
        isPopUp == other.isPopUp &&
        isExpanded == other.isExpanded &&
        panelPosition == other.panelPosition &&
        panelType == other.panelType &&
        child == other.child;
  }

  @override
  int get hashCode =>
      Object.hash(isPopUp, isExpanded, panelPosition, panelType, child);
}
