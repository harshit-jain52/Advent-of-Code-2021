import 'dart:io';

void main(){
  final myFile = new File('input02.txt');
  final lines = myFile.readAsLinesSync();
  int x=0, y=0, aim=0;
  for (String line in lines){
    var sp = line.split(' ');
    String dir = sp[0];
    int dist = int.parse(sp[1]);
    switch (dir){
      case 'forward':
        x+=dist;
        y+=aim*dist;
        break;
      case 'up':
        aim-=dist;
        break;
      case 'down':
        aim+=dist;
        break;
    }
  }

  print(x*y);
}