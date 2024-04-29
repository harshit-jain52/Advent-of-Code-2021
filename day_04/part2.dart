import 'dart:io';

void main() {
  final myFile = new File('input04.txt');
  final lines = myFile.readAsLinesSync();

  final List<int> calledNumbers = lines[0].split(',').map(int.parse).toList();

  List<String> cardLines = [];
  List<BingoCard> cards = [];

  for (String line in lines.sublist(1)) {
    if (line.isEmpty) {
      if (cardLines.isNotEmpty) cards.add(BingoCard(cardLines));
      cardLines.clear();
      continue;
    }
    cardLines.add(line);
  }
  if (cardLines.isNotEmpty) cards.add(BingoCard(cardLines));

  int? score;
  for (int number in calledNumbers) {
    for (BingoCard card in cards) {
      if (card.won!) continue;
      if (card.markNumber(number) && card.won!) {
        score =
            number * card.unmarked.reduce((value, element) => value + element);
      }
    }
  }

  print(score);
}

class BingoCard {
  int? size;
  List<List<int>>? card;
  Set<int> marked = {};
  Set<int> unmarked = {};
  bool? won;

  BingoCard(List<String> lines) {
    size = lines.length;
    won = false;
    card = List.generate(size!, (index) => List.filled(size!, 0));

    for (int i = 0; i < size!; i++) {
      List<String> line =
          lines[i].split(' ').where((e) => e.isNotEmpty).toList();
      for (int j = 0; j < size!; j++) {
        card![i][j] = int.parse(line[j]);
        unmarked.add(card![i][j]);
      }
    }
  }

  bool markNumber(int number) {
    if (unmarked.contains(number)) {
      unmarked.remove(number);
      marked.add(number);
      checkBingo();
      return true;
    }
    return false;
  }

  void checkBingo() {
    // Check Rows
    for (int i = 0; i < size!; i++) {
      bool bingo = true;
      for (int j = 0; j < size!; j++) {
        if (!marked.contains(card![i][j])) {
          bingo = false;
          break;
        }
      }
      if (bingo) won = true;
    }

    // Check Columns
    for (int j = 0; j < size!; j++) {
      bool bingo = true;
      for (int i = 0; i < size!; i++) {
        if (!marked.contains(card![i][j])) {
          bingo = false;
          break;
        }
      }
      if (bingo) won = true;
    }
  }
}
