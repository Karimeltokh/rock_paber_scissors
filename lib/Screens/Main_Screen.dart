import 'package:flutter/material.dart';
import 'package:rock_paber_scissors/Screens/Game_Screen.dart';
import 'package:rock_paber_scissors/Screens/game.dart';
import 'package:rock_paber_scissors/componantes/componantes.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);
  @override
  _MainHomeState createState() => _MainHomeState();
}
class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    double btnWidth=MediaQuery.of(context).size.width / 2 - 40;
    return Scaffold(
      backgroundColor: Color(0xff060a47),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34.0,horizontal: 8.0),
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
                child: Stack(
                  children: [
                    Positioned(
                      top :0,
                      left: MediaQuery.of(context).size.width / 2 - btnWidth / 2 - 20,
                      child: Hero(
                        tag: "Rock",
                        child: defaultButtonGame((){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder:(context)=>GameScreen(GameChoice("Rock"))));
                        },
                            'images/rock_btn.png',
                          btnWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      left: MediaQuery.of(context).size.width / 2 - btnWidth - 40,
                      child: Hero(
                        tag: "Paper",
                        child: defaultButtonGame((){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder:(context)=>GameScreen(GameChoice("Paper"))));
                        },
                          'images/paper_btn.png',
                          btnWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      right: MediaQuery.of(context).size.width / 2 - btnWidth - 40,
                      child: Hero(
                        tag: "Scisor",
                        child: defaultButtonGame((){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder:(context)=>GameScreen(GameChoice("Scisors"))));
                        },
                          'images/scisor_btn.png',
                          btnWidth,
                        ),
                      ),
                    ),
                  ],
                ),
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
