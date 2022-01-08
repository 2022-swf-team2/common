
List<String> getDateTime(String openTime,String endTime){
  if(endTime == ''){
    List<String> _date = openTime.split(' ');
    return [_date[0],_date[1]];
  }
  List<String> _openDate = openTime.split(' ');
  List<String> _endDate = endTime.split(' ');
  List<String> _returnDate = [];
  if(_openDate[0] == _endDate[0]){
    _returnDate.add(_openDate[0]);
  }else{
    _returnDate.add('${_openDate[0]}~${_endDate[0]}');
  }
  int _hours = DateTime.parse(endTime).difference(DateTime.parse(openTime)).inHours;
  _returnDate.add('${_openDate[1]}~${_endDate[1]}');
  _returnDate.add('$_hours시간');
  return _returnDate;
}