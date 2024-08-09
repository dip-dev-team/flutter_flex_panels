import 'package:flutter/widgets.dart';

/// Callback for creation the hided panel widget
typedef PanelEndCallback = Widget Function(
    bool isExpanded, ValueChanged<bool> onExpanded);

/// Callback for creation the panel widget
typedef PanelExpandedCallback = Widget Function();
