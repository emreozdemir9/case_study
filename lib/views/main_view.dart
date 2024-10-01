import 'package:case_study/views/home/home_view.dart';
import 'package:case_study/views/score/score_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> bottomBarPages = [const HomeView(), const ScoreView()];
  int bottomPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bottomBarPages[bottomPageIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.black))),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.games), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.scoreboard), label: 'Score')
            ],
            onTap: (index) => setState(
              () => bottomPageIndex = index,
            ),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            selectedItemColor: Colors.amber,
            currentIndex: bottomPageIndex,
          ),
        ));
  }
}
