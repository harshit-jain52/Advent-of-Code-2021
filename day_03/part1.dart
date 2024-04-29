import 'dart:io';

void main() {
  final myFile = new File('input03.txt');
  final lines = myFile.readAsLinesSync();
  String gamma = "";
  final int dig = lines[0].length;

  for (int i = 0; i < dig; i++) {
    int ct0 = 0, ct1 = 0;
    for (int j = 0; j < lines.length; j++) {
      if (lines[j][i] == '1') {
        ct1++;
      } else {
        ct0++;
      }
    }

    if (ct1 > ct0) {
      gamma += '1';
    } else {
      gamma += '0';
    }
  }

  int gammaDec = binaryToDecimal(gamma);
  int epsilonDec = gammaDec ^ ((1 << dig) - 1);

  print(gammaDec * epsilonDec);
}

int binaryToDecimal(String bin) {
  int dec = 0;
  int len = bin.length;
  for (int i = 0; i < len; i++) {
    dec += int.parse(bin[i]) * (1 << (len - i - 1));
  }
  return dec;
}
