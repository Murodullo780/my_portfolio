import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/images.dart';
import 'package:my_portfolio/sudoku_game/sudoku.dart';

class SudokuApp extends StatefulWidget {
  const SudokuApp({super.key});

  @override
  _SudokuAppState createState() => _SudokuAppState();
}

class _SudokuAppState extends State<SudokuApp> {
  final Sudoku sudoku = Sudoku();

  Widget _bolt() {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Color(0xff196C6A),
            Color(0xff114B4A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.remove,
          size: 10,
          color: Color(0xff114944),
        ),
      ),
    );
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> boards = [
      SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "This is a simple sudoku "
                "game where you should complete "
                "the gaps by clicking on "
                "the numbers(1 - 3).",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    selectedIndex++;
                    setState(() {});
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildSudokuBoard(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _clearBoard,
            child: const Text(
              'Clear Board',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ];

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/Background Blurs.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              margin: const EdgeInsets.all(150),
              // width: 400,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(MyImages.bg),
                  fit: BoxFit.cover,
                ),
              ),
              child: boards[selectedIndex]),
        ),
        Positioned(left: 160, top: 160, child: _bolt()),
        Positioned(right: 160, top: 160, child: _bolt()),
        Positioned(left: 160, bottom: 160, child: _bolt()),
        Positioned(right: 160, bottom: 160, child: _bolt()),
      ],
    );
  }

  Widget _buildSudokuBoard() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        3,
        (row) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(3, (col) {
              return _buildSudokuCell(row, col);
            }),
          );
        },
      ),
    );
  }

  Widget _buildSudokuCell(int row, int col) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.grey[200],
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, color: Colors.black),
        onChanged: (value) {
          setState(
            () {
              final number = int.tryParse(value);
              if (!sudoku.setCell(row, col, number)) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (value.isNotEmpty) {
                    TextEditingController().clear();
                  }
                });
              }
            },
          );
        },
        controller: TextEditingController(
          text: sudoku.board[row][col]?.toString() ?? '',
        ),
      ),
    );
  }

  void _clearBoard() {
    setState(() {
      for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 3; col++) {
          sudoku.setCell(row, col, null);
        }
      }
    });
  }
}
