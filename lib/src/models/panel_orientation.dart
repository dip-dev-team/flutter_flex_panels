/// Interface of panel orientation
final class PanelOrientation {
  final bool _isVertical;

  const PanelOrientation._(this._isVertical);

  factory PanelOrientation.vertical() => const PanelOrientation._(true);

  factory PanelOrientation.horizontal() => const PanelOrientation._(false);

  bool get isVertical => _isVertical;

  bool get isHorizontal => !_isVertical;

  @override
  bool operator ==(Object other) {
    return other is PanelOrientation && _isVertical == other._isVertical;
  }

  @override
  int get hashCode => _isVertical.hashCode;
}
