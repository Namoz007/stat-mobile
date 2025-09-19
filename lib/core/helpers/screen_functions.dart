import 'package:flutter/cupertino.dart';

double getScreenPercentWidth(BuildContext context,int percent,double minusScreen){
  // print("bu percent $percent");
  // if((MediaQuery.of(context).size.width - minusScreen) * (percent / 100) == 0.0){
  //   print("qayti mana");
  //   return 2;
  // }else{
  //   return (MediaQuery.of(context).size.width - minusScreen) * (percent / 100);
  // }
  return (MediaQuery.of(context).size.width - minusScreen) * (percent / 100);

}

double calculatePercent(int maxCount,int count){
  return (((count / maxCount) * 100) / 100);
}

List<int> generateSteps(List<int> values, int count) {
  int max = values.reduce((a, b) => a > b ? a : b);
  int step = (max / (count - 1)).round();

  return List.generate(count, (index) {
    int value = index * step;
    if(value > max) {
      return max;
    }else if(index == count - 1){
      return max;
    }
    return value;
  }).toList();
}



String formatNumberInString(int number) {
  if (number < 1000) {
    return number.toString();
  } else if (number < 1000000) {
    double kValue = number / 1000;
    return "${kValue.toStringAsFixed(0)}k";
  } else {
    double mValue = number / 1000000;
    return "${mValue.toStringAsFixed(1)}M";
  }
}
