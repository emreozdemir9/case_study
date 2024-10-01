import 'package:case_study/core/components/mainText.dart';
import 'package:case_study/core/constants/storageKeys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreView extends StatefulWidget {
  const ScoreView({super.key});

  @override
  State<ScoreView> createState() => _ScoreViewState();
}

class _ScoreViewState extends State<ScoreView> {
  List<String> scoreList = [];
  @override
  void initState() {
    _initScores();
    super.initState();
  }

  _initScores() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? scoreData = prefs.getStringList(StorageKeys.scoreKey);
    scoreData?.sort();
    scoreList.addAll(scoreData ?? []);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: scoreList.isEmpty
            ? const Center(
                child: MainText("Henüz oyun kazanmadınız"),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MainText("Tahmin sayılarınız"),
                  ListView.builder(
                      itemCount: scoreList.length,
                      shrinkWrap: true,
                      itemBuilder: (ctx, i) =>
                          Center(child: MainText(scoreList[i].toString()))),
                ],
              ),
      ),
    );
  }
}
