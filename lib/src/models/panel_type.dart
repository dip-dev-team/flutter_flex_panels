final class PanelType {
  final List<double> sizes;

  const PanelType._({required this.sizes});

  /// Fixed panel size
  factory PanelType.fixed({required double size}) =>
      PanelType._(sizes: List.from([size]));

  /// A panel that can be of different sizes
  factory PanelType.flex({double? minSize, double? maxSize}) => PanelType._(
      sizes: List.from(
          [if (minSize != null) minSize, if (maxSize != null) maxSize]));

  /// A panel that can be of a certain size
  factory PanelType.segmented({required List<double> sizes}) =>
      PanelType._(sizes: sizes);

  @override
  bool operator ==(Object other) {
    return other is PanelType && sizes == other.sizes;
  }

  @override
  int get hashCode => sizes.hashCode;
}
