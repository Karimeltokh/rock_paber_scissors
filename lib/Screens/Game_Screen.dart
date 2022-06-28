import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rock_paber_scissors/Screens/Main_Screen.dart';
import 'package:rock_paber_scissors/Screens/game.dart';
import 'package:rock_paber_scissors/componantes/componantes.dart';

class GameScreen extends StatefulWidget {
  GameScreen(this.gameChoice,{Key? key}) : super(key: key);
  GameChoice gameChoice;

  @override
  _GameScreenState createState() => _GameScreenState();

}

class _GameScreenState extends State<GameScreen> {
  String? randomChoice() {
    Random random = new Random();
    int robotChoiceIndex = random.nextInt(3);
    return Game.choices[robotChoiceIndex];
  }
  @override
  Widget build(BuildContext context) {
    String robotChoice = randomChoice()!;
    String? robotChoicePath;
    switch (robotChoice) {
      case "Rock":
        robotChoicePath = "images/rock_btn.png";
        break;
      case "Paper":
        robotChoicePath = "images/paper_btn.png";
        break;
      case "Scisors":
        robotChoicePath = "images/scisor_btn.png";
        break;
      default:
    }

    String?playerChoice;
    switch (widget.gameChoice.type) {
      case "Rock":
        playerChoice = "images/rock_btn.png";
        break;
      case "Paper":
        playerChoice = "images/paper_btn.png";
        break;
      case "Scisors":
        playerChoice = "images/scisor_btn.png";
        break;
      default:
    }
    if (GameChoice.gameRules[widget.gameChoice.type]![robotChoice] ==
        "You Win") {
      setState(() {
        Game.score++;
      });
    }
    double btnWidth=MediaQuery.of(context).size.width / 2 - 40;
    return Scaffold(
      backgroundColor: Color(0xff060a47),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34.0,horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 5.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child :Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Score',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${Game.score}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Row(
                  children: [
                   Hero(tag : "${widget.gameChoice.type}",child: defaultButtonGame(null, playerChoice!, btnWidth)),
                   Text('VS',style: TextStyle(color: Colors.white,fontSize: 26.0),),
                    defaultButtonGame(null, robotChoicePath!, btnWidth),
                  ],
                ),
              ),
            ),
            Text(
                '${GameChoice.gameRules[widget.gameChoice.type]![robotChoice]}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainHome(),
                      ));
                },
                padding: EdgeInsets.all(16),
                shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.white,width: 5.0,
                    )
                ),
                child: Text("Play Again",style: TextStyle(color: Colors.white,fontSize: 24.0),),
              ),
            ),
            Container(
              width: double.infinity,

              child: RawMaterialButton(
                onPressed: (){},
                padding: EdgeInsets.all(16),
                shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.white,width: 5.0,
                    )
                ),
                child: Text("Rules",style: TextStyle(color: Colors.white,fontSize: 24.0),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
