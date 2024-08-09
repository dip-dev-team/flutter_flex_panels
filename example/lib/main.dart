import 'package:flutter/material.dart';
import 'package:flutter_flex_panels/flutter_flex_panels.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexPanelsWidget(
      panelDatas: [
        PanelData(
          panelType: PanelType.fixed(size: 100.0),
          panelPosition: PanelPosition.left(),
          child: const Placeholder(),
        ),
        PanelData(
          panelType: PanelType.fixed(size: 100.0),
          panelPosition: PanelPosition.right(),
          child: const Placeholder(),
        ),
      ],
      child: const Placeholder(),
    );
  }
}
