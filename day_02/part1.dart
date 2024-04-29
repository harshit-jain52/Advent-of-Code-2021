import 'dart:io';

void main(){
  final myFile = new File('input02.txt');
  final lines = myFile.readAsLinesSync();
  int x=0, y=0;
  for (String line in lines){
    var sp = line.split(' ');
    String dir = sp[0];
    int dist = int.parse(sp[1]);
    switch (dir){
      case 'forward':
        x+=dist;
        break;
      case 'up':
        y-=dist;
        break;
      case 'down':
        y+=dist;
        break;
    }
  }

  print(x*y);
}