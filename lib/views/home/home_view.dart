import 'package:case_study/core/components/mainButton.dart';
import 'package:case_study/core/components/mainText.dart';
import 'package:case_study/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(HomeController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MainText(
                '1-100 arası tahmininizi girin',
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  width: 120,
                  child: TextField(
                    controller: controller.textController,
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25)))),
                  ),
                ),
              ),
              MainButton("Tahmin Et",
                  () => controller.checkAnswer()),
            ],
          ),
        ),
      ),
    );
  }
}
