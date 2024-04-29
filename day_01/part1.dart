import 'dart:io';

void main(){
  final myFile = new File('input01.txt');
  final lines = myFile.readAsLinesSync();
  final numbers = lines.map((n) => int.parse(n)).toList();
  var ct=0;
  for(var i=0;i<numbers.length-1;i++){
    if(numbers[i]<numbers[i+1]){
      ct++;
    }
  }

  print(ct);
}