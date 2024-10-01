import 'dart:math';

import 'package:case_study/core/components/mainButton.dart';
import 'package:case_study/core/components/mainText.dart';
import 'package:case_study/core/constants/storageKeys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  Rx<int> randomGameNumber = 0.obs;
  Rx<int> counter = 0.obs;
  final TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    generateGame();
  }

  void generateGame() {
    counter.value = 0;
    Random random = Random();
    randomGameNumber.value = random.nextInt(100);
    print("######## RAND NUMBER ##########");
    print(randomGameNumber.value);
  }

  void checkAnswer() {
    int? answer = int.tryParse(textController.text);
    if (answer == null) {
      Get.snackbar('Error', 'Geçerli bir sayı girin');
      return;
    }
    counter.value++;
    if (answer == randomGameNumber.value) {
      win();
    } else if (answer > randomGameNumber.value) {
      Get.snackbar('Bilgi', 'Daha küçük bir sayı deneyin');
    } else {
      Get.snackbar('Bilgi', 'Daha büyük bir sayı deneyin');
    }
  }

  void win() async {
    _saveScore();

    showDialog(
        context: Get.context!,
        builder: (ctx) => AlertDialog(
              title: const Text("Win"),
              icon: const Icon(Icons.emoji_events),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const MainText(
                    'Cevabınız doğru',
                    size: 16,
                  ),
                  MainText(
                    'Tahmin sayısı: ${counter.value}',
                    size: 16,
                  ),
                ],
              ),
              actions: [
                Center(
                  child: MainButton("Yeniden Oyna", () {
                    textController.clear();
                    Get.back();
                    generateGame();
                  }),
                )
              ],
            ));
  }

  _saveScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? scoreList = prefs.getStringList(StorageKeys.scoreKey);
    scoreList?.add(counter.toString());
    prefs.setStringList(StorageKeys.scoreKey, scoreList ?? ["$counter"]);
  }
}
