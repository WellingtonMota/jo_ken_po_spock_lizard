// ignore_for_file: prefer_const_constructors, prefer_final_fields, unnecessary_this

import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var _imageRobot = AssetImage('./images/null.png');
  var _messageOption = 'Escolha uma opção abaixo:';
  var _userPoints = 0;
  var _robotPoints = 0;
  var _activeRock = false;
  var _activePaper = false;
  var _activeScissors = false;
  var _activeSpock = false;
  var _activeLizard = false;

  void _selectedoption(String userChoice) {
    var options = ['rock', 'paper', 'scissors', 'spock', 'lizard'];
    var number = Random().nextInt(4);
    var robotChoice = options[number];

    _activeRock = false;
    _activePaper = false;
    _activeScissors = false;
    _activeSpock = false;
    _activeLizard = false;
    switch (userChoice) {
      case 'rock':
        _activeRock = true;
        break;
      case 'paper':
        _activePaper = true;
        break;
      case 'scissors':
        _activeScissors = true;
        break;
      case 'spock':
        _activeSpock = true;
        break;
      case 'lizard':
        _activeLizard = true;
        break;
    }

    switch (robotChoice) {
      case 'rock':
        setState(() {
          this._imageRobot = AssetImage('./images/robot/rock.png');
        });
        break;
      case 'paper':
        setState(() {
          this._imageRobot = AssetImage('./images/robot/paper.png');
        });
        break;
      case 'scissors':
        setState(() {
          this._imageRobot = AssetImage('./images/robot/scissors.png');
        });
        break;
      case 'spock':
        setState(() {
          this._imageRobot = AssetImage('./images/robot/spock.png');
        });
        break;
      case 'lizard':
        setState(() {
          this._imageRobot = AssetImage('./images/robot/lizard.png');
        });
        break;
    }

    if ((userChoice == 'scissors' && robotChoice == 'paper') ||
        (userChoice == 'paper' && robotChoice == 'rock') ||
        (userChoice == 'rock' && robotChoice == 'lizard') ||
        (userChoice == 'lizard' && robotChoice == 'spock') ||
        (userChoice == 'spock' && robotChoice == 'scissors') ||
        (userChoice == 'scissors' && robotChoice == 'lizard') ||
        (userChoice == 'lizard' && robotChoice == 'paper') ||
        (userChoice == 'paper' && robotChoice == 'spock') ||
        (userChoice == 'spock' && robotChoice == 'rock') ||
        (userChoice == 'rock' && robotChoice == 'scissors')) {
      this.setState(() {
        this._messageOption = 'Parabéns!!! Você ganhou.';
        this._userPoints++;
      });
    } else if ((robotChoice == 'scissors' && userChoice == 'paper') ||
        (robotChoice == 'paper' && userChoice == 'rock') ||
        (robotChoice == 'rock' && userChoice == 'lizard') ||
        (robotChoice == 'lizard' && userChoice == 'spock') ||
        (robotChoice == 'spock' && userChoice == 'scissors') ||
        (robotChoice == 'scissors' && userChoice == 'lizard') ||
        (robotChoice == 'lizard' && userChoice == 'paper') ||
        (robotChoice == 'paper' && userChoice == 'spock') ||
        (robotChoice == 'spock' && userChoice == 'rock') ||
        (robotChoice == 'rock' && userChoice == 'scissors')) {
      this.setState(() {
        this._messageOption = 'Você perdeu.';
        this._robotPoints++;
      });
    } else {
      this.setState(() {
        this._messageOption = 'Empatamos :)';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JoKenPoSpockLizard'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Image(
                      image: AssetImage('./images/user.png'),
                      height: 60,
                    ),
                    Text(
                      this._userPoints.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
                Image(
                  image: this._imageRobot,
                  height: 120,
                ),
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Image(
                      image: AssetImage('./images/robot.jpg'),
                      height: 60,
                    ),
                    Text(
                      this._robotPoints.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 50,
              bottom: 16,
            ),
            child: Text(
              this._messageOption,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _selectedoption('lizard'),
                child: Image.asset(
                  './images/user/lizard.png',
                  height: this._activeLizard ? 100 : 80,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _selectedoption('paper'),
                child: Image.asset(
                  './images/user/paper.png',
                  height: this._activePaper ? 100 : 80,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => _selectedoption('rock'),
                  child: Image.asset(
                    './images/user/rock.png',
                    height: this._activeRock ? 100 : 80,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _selectedoption('scissors'),
                child: Image.asset(
                  './images/user/scissors.png',
                  height: this._activeScissors ? 100 : 80,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _selectedoption('spock'),
                child: Image.asset(
                  './images/user/spock.png',
                  height: this._activeSpock ? 100 : 80,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
