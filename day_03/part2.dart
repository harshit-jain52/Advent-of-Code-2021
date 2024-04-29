import 'dart:io';

void main() {
  final myFile = new File('input03.txt');
  final lines = myFile.readAsLinesSync();
  final int dig = lines[0].length;
  int? O2dec, CO2dec;

  List<String> O2 = lines, CO2 = lines;

  for (int i = 0; i < dig; i++) {
    int ct0 = 0, ct1 = 0;
    for (int j = 0; j < O2.length; j++) {
      if (O2[j][i] == '1') {
        ct1++;
      } else {
        ct0++;
      }
    }

    if (ct1 >= ct0) {
      O2 = O2.where((element) => element[i] == '1').toList();
    } else {
      O2 = O2.where((element) => element[i] == '0').toList();
    }

    if (O2.length == 1) {
      O2dec = binaryToDecimal(O2[0]);
      break;
    }
  }

  for (int i = 0; i < dig; i++) {
    int ct0 = 0, ct1 = 0;
    for (int j = 0; j < CO2.length; j++) {
      if (CO2[j][i] == '1') {
        ct1++;
      } else {
        ct0++;
      }
    }

    if (ct1 >= ct0) {
      CO2 = CO2.where((element) => element[i] == '0').toList();
    } else {
      CO2 = CO2.where((element) => element[i] == '1').toList();
    }

    if (CO2.length == 1) {
      CO2dec = binaryToDecimal(CO2[0]);
      break;
    }
  }

  if (O2dec != null && CO2dec != null) print(O2dec * CO2dec);
}

int binaryToDecimal(String bin) {
  int dec = 0;
  int len = bin.length;
  for (int i = 0; i < len; i++) {
    dec += int.parse(bin[i]) * (1 << (len - i - 1));
  }
  return dec;
}
