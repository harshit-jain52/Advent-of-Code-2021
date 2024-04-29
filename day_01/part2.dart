import 'dart:io';

void main(){
  final myFile = new File('input01.txt');
  final lines = myFile.readAsLinesSync();
  final numbers = lines.map((n) => int.parse(n)).toList();
  var ct=0;
  for(var i=3;i<numbers.length;i++){
    if(numbers[i]>numbers[i-3]){
      ct++;
    }
  }

  print(ct);
}