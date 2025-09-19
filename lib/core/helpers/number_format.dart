
double calculatePercentForStatistic(int maxCount,int count){

  if(maxCount == 0)  {
    return 0;
  }
  return ((count / maxCount) * 100);
}

String formatNumber(int number) {
  return number.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+$)'), (Match match) => '${match[1]} ');
}

List<int> sortedListNumbers(List<int> numbers,int length){
  numbers.sort((a,b) => b.compareTo(a));
  return numbers.sublist(0,length);
}

String formatDoubleToOneDecimal(double number) {
  return number.toStringAsFixed(1);
}