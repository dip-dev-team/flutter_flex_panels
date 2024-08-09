import 'panel_orientation.dart';

final class PanelPosition {
  /// Panel orientation can be:
  /// [PanelOrientation.vertical] for vertical or
  /// [PanelOrientation.horizontal] for horizontal
  final PanelOrientation orientation;

  final bool isStart;

  const PanelPosition._({required this.orientation, required this.isStart});

  factory PanelPosition.left() =>
      PanelPosition._(orientation: PanelOrientation.vertical(), isStart: true);

  factory PanelPosition.top() => PanelPosition._(
      orientation: PanelOrientation.horizontal(), isStart: true);

  factory PanelPosition.right() =>
      PanelPosition._(orientation: PanelOrientation.vertical(), isStart: false);

  factory PanelPosition.bottom() => PanelPosition._(
      orientation: PanelOrientation.horizontal(), isStart: false);

  bool get isLeft => orientation.isVertical && isStart;

  bool get isTop => orientation.isHorizontal && isStart;

  bool get isRight => orientation.isVertical && !isStart;

  bool get isBottom => orientation.isHorizontal && !isStart;

  @override
  bool operator ==(Object other) {
    return other is PanelPosition &&
        orientation == other.orientation &&
        isStart == other.isStart;
  }

  @override
  int get hashCode => Object.hash(orientation, isStart);
}
