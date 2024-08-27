// import 'package:flutter/material.dart';
// import 'package:tic_tac_toe/const/colors.dart';

// class home_page extends StatefulWidget {
//   const home_page({super.key});

//   @override
//   State<home_page> createState() => _home_pageState();
// }

// class _home_pageState extends State<home_page> {
//   static const String player_1 = "X";
//   static const String player_2 = "O";
//   late String current_player;
//   late bool game_end;
//   late List<String> occupied;
//   late List<int> winningIndices;

//   void initializeGame() {
//     current_player = player_1;
//     game_end = false;
//     occupied = ['', '', '', '', '', '', '', '', ''];
//     winningIndices = [];
//   }

//   @override
//   void initState() {
//     initializeGame();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: priary,
//         title: const Text(
//           "Tic Tac Toe",
//           style: TextStyle(
//               color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//         color: background,
//         child: Center(
//           child: Column(
//             children: [
//               game_container(),
//               const SizedBox(height: 20),
//               restartGame(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget game_container() {
//     return Container(
//       height: MediaQuery.of(context).size.height / 2,
//       width: MediaQuery.of(context).size.height / 2,
//       margin: const EdgeInsets.all(8),
//       child: GridView.builder(
//           itemCount: 9,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3),
//           itemBuilder: (context, int index) {
//             return _box(index);
//           }),
//     );
//   }

//   Widget _box(int index) {
//     bool isWinningIndex = winningIndices.contains(index);

//     return InkWell(
//       onTap: () {
//         if (game_end || occupied[index].isNotEmpty) {
//           return;
//         }
//         setState(() {
//           occupied[index] = current_player;
//           ChangePlayer();
//           checkWinner();
//           Checkfordraw();
//         });
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//         decoration: BoxDecoration(
//           color: isWinningIndex ? winningLineColor : board,
//           border: Border.all(color: Colors.white, width: 2),
//         ),
//         margin: const EdgeInsets.all(8),
//         child: Center(
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//             child: Text(
//               occupied[index],
//               style: TextStyle(
//                 fontSize: 40,
//                 color: occupied[index].isEmpty
//                     ? Colors.black26
//                     : occupied[index] == player_1
//                         ? Xcolor
//                         : ocolor,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void ChangePlayer() {
//     setState(() {
//       current_player = current_player == player_1 ? player_2 : player_1;
//     });
//   }

//   void checkWinner() {
//     List<List<int>> winningList = [
//       [0, 1, 2],
//       [3, 4, 5],
//       [6, 7, 8],
//       [0, 3, 6],
//       [1, 4, 7],
//       [2, 5, 8],
//       [0, 4, 8],
//       [2, 4, 6],
//     ];

//     for (var winningPos in winningList) {
//       String playerPosition0 = occupied[winningPos[0]];
//       String playerPosition1 = occupied[winningPos[1]];
//       String playerPosition2 = occupied[winningPos[2]];

//       if (playerPosition0.isNotEmpty) {
//         if (playerPosition0 == playerPosition1 &&
//             playerPosition0 == playerPosition2) {
//           setState(() {
//             winningIndices = winningPos;
//             showGameOverMessage("Player $playerPosition0 won");
//             game_end = true;
//           });
//           return;
//         }
//       }
//     }
//   }

//   void showGameOverMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       backgroundColor: priary,
//       content: Text(
//         "Game Over \n $message",
//         style: const TextStyle(fontSize: 20),
//       ),
//     ));
//   }

//   Widget restartGame() {
//     return ElevatedButton(
//       onPressed: () {
//         setState(() {
//           initializeGame();
//         });
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: priary,
//       ),
//       child: const Text("Restart Game"),
//     );
//   }

//   void Checkfordraw() {
//     if (game_end) {
//       return;
//     }
//     bool draw = true;
//     for (var occupiedPlayer in occupied) {
//       if (occupiedPlayer.isEmpty) {
//         draw = false;
//       }
//     }
//     if (draw) {
//       showGameOverMessage("Draw");
//       game_end = true;
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Screens/players.dart';
import 'package:tic_tac_toe/const/colors.dart';

class HomePage extends StatefulWidget {
  final String player1Name;
  final String player2Name;
  const HomePage({
    Key? key,
    required this.player1Name,
    required this.player2Name,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentplayer = 1;
  static const String player1 = "X";
  static const String player2 = "O";
  late String currentPlayer;
  late bool gameEnded;
  late List<String> occupiedCells;
  late List<int> winningIndices;

  void initializeGame() {
    currentPlayer = player1;
    gameEnded = false;
    occupiedCells = ['', '', '', '', '', '', '', '', ''];
    winningIndices = [];
  }

  void switchplayer() {
    setState(() {
      _currentplayer = _currentplayer == 1 ? 2 : 1;
    });
  }

  @override
  void initState() {
    initializeGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentPlayerNae =
        _currentplayer == 1 ? widget.player1Name : widget.player2Name;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Players_info()));
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: primaryColor,
        title: const Text(
          "Tic Tac Toe",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: backgroundColor,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "$currentPlayerNae's turn",
                  style: TextStyle(
                      color: _currentplayer == 1 ? xColor : oColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              buildGameContainer(),
              const SizedBox(height: 20),
              buildRestartButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGameContainer() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.height / 2,
      margin: const EdgeInsets.all(8),
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, int index) {
          return buildGridItem(index);
        },
      ),
    );
  }

  Widget buildGridItem(int index) {
    bool isWinningIndex = winningIndices.contains(index);

    return InkWell(
      onTap: () {
        if (gameEnded || occupiedCells[index].isNotEmpty) {
          return;
        }
        setState(() {
          occupiedCells[index] = currentPlayer;
          switchPlayer();
          checkWinner();
          checkForDraw();
          switchplayer();
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isWinningIndex ? winningLineColor : boardColor,
          border: Border.all(color: Colors.white, width: 2),
        ),
        margin: const EdgeInsets.all(8),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Text(
              occupiedCells[index],
              style: TextStyle(
                fontSize: 40,
                color: occupiedCells[index].isEmpty
                    ? Colors.black26
                    : occupiedCells[index] == player1
                        ? xColor
                        : oColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void switchPlayer() {
    setState(() {
      currentPlayer = currentPlayer == player1 ? player2 : player1;
    });
  }

  void checkWinner() {
    List<List<int>> winningPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winningPatterns) {
      String playerPos0 = occupiedCells[pattern[0]];
      String playerPos1 = occupiedCells[pattern[1]];
      String playerPos2 = occupiedCells[pattern[2]];

      if (playerPos0.isNotEmpty) {
        if (playerPos0 == playerPos1 && playerPos0 == playerPos2) {
          setState(() {
            winningIndices = pattern;
            String winningPlayerName =
                playerPos0 == player1 ? widget.player1Name : widget.player2Name;
            showGameOverMessage("$winningPlayerName won");
            gameEnded = true;
          });
          return;
        }
      }
    }
  }

  void showGameOverMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: primaryColor,
      content: Center(
        child: Text(
          "Game Over \n$message",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    ));
  }

  Widget buildRestartButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          initializeGame();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
      ),
      child: const Text(
        "Restart Game",
        style: TextStyle(color: backgroundColor),
      ),
    );
  }

  void checkForDraw() {
    if (gameEnded) {
      return;
    }
    bool isDraw = true;
    for (var occupied in occupiedCells) {
      if (occupied.isEmpty) {
        isDraw = false;
        break;
      }
    }
    if (isDraw) {
      showGameOverMessage("Match Draw");
      gameEnded = true;
    }
  }
}
