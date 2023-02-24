import 'dart:math';

void main() {//PRZYKŁADOWE UŻYCIE
  StopChallengeTime a = StopChallengeTime(DateTime.now());
  a.timeLeft(null);
  print("Ziarno dla generatora :${a.seed()}");
  print("Pozostały czas ${a.timeLeft(null)}");
}
class StopChallengeTime{
  DateTime time;
  StopChallengeTime(this.time){
   time = timeParse(time);
  }
  update(DateTime time) => this.time = time;
  
  String timeLeft(DateTime? now){
    now ??= DateTime.now();
    Duration left = Duration(days: 0, hours: time.hour-now.hour, minutes: (time.minute+30)-now.minute, seconds: time.second-now.second,
    milliseconds: 0, microseconds: 0);
    return "${left.inHours}:${left.inMinutes}:${left.inSeconds%60}";
  }
  
  String seed(){
    String output  = time.year.toString().padLeft(4,'0')
                   + time.month.toString().padLeft(2,'0')
                   + time.day.toString().padLeft(2,'0')
                   + time.hour.toString().padLeft(2,'0')
                   + time.minute.toString().padLeft(2,'0');
    return output;
  }
  Random rng(String input){
    return Random(int.parse(input));
  }
  DateTime timeParse(DateTime input) => DateTime(time.year,time.month,time.day,time.hour,(time.minute < 30 ? 00:30),0,0);
}