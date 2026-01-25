import 'package:flutter/material.dart';
import 'package:tempo/screens/tap_to_bpm_screen.dart';
import 'package:tempo/screens/tuner_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tempo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepOrange,
        ),
        useMaterial3: true,
      ),

      home: const MyHomePage(title: 'Tempo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final screens = <Widget Function()>[TapToBpmScreen.new, TunerScreen.new];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemBuilder: (context, index) => screens[index](),
              itemCount: screens.length,
            ),
          ),
          ListenableBuilder(
            listenable: _pageController,
            builder: (context, child) {
              return BottomNavigationBar(
                currentIndex: _pageController.page?.toInt() ?? 0,
                onTap: (pageIndex) {
                  _pageController.animateToPage(
                    pageIndex,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.touch_app),
                    label: 'BPM',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.music_note),
                    label: 'Tuner',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
