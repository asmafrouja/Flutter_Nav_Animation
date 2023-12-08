import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText1:
              TextStyle(color: Colors.white), // Couleur de la police par défaut
        ),
      ),
      home: const RadioBar(),
    );
  }
}

class RadioBar extends StatefulWidget {
  const RadioBar({Key? key}) : super(key: key);

  @override
  _RadioBarState createState() => _RadioBarState();
}

class _RadioBarState extends State<RadioBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _buildPage(_selectedIndex),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  value: 0,
                  groupValue: _selectedIndex,
                  onChanged: (value) {
                    setState(() {
                      _selectedIndex = value as int;
                    });
                  },
                ),
                Radio(
                  value: 1,
                  groupValue: _selectedIndex,
                  onChanged: (value) {
                    setState(() {
                      _selectedIndex = value as int;
                    });
                  },
                ),
                Radio(
                  value: 2,
                  groupValue: _selectedIndex,
                  onChanged: (value) {
                    setState(() {
                      _selectedIndex = value as int;
                    });
                  },
                ),
                Radio(
                  value: 3,
                  groupValue: _selectedIndex,
                  onChanged: (value) {
                    setState(() {
                      _selectedIndex = value as int;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const LottiePage(animationPath: 'assets/1.json');
      case 1:
        return const LottiePage(animationPath: 'assets/2.json');
      case 2:
        return const LottiePage(animationPath: 'assets/3.json');
      case 3:
        return const LottiePage(animationPath: 'assets/4.json');
      default:
        return Container();
    }
  }
}

class LottiePage extends StatelessWidget {
  const LottiePage({Key? key, required this.animationPath}) : super(key: key);

  final String animationPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Lottie.asset(
          animationPath,
          width: 400,
          height: 300,
          fit: BoxFit.cover,
          repeat: true,
          animate: true,
          reverse: false,
          //speed: 1.5,
          //color: Colors.red,
        ),
      ),
    );
  }
}
