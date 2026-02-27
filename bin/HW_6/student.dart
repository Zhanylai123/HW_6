import 'person.dart';

enum Subject { math, physics, english, history }

class Student extends Person {
  Map<Subject, double> marks;
  Student(super.fullName, super.age, super.isMarried, this.marks);

  void showMarks() {
    print('Student: $fullName');
    //double sumOfMarks = 0;
    //int counter = 0;
    for (var entry in marks.entries) {
      // var mark = entry.value;
      //counter++;
      //sumOfMarks += mark;
      print('${entry.key}: ${entry.value}');
    }
    //  print('Average mark: ${sumOfMarks / counter}');
  }

  double? calculateAverage() {
    double sumOfMarks = 0;
    int counter = 0;
    for (var entry in marks.entries) {
      var mark = entry.value;
      counter++;
      sumOfMarks += mark;
    }
    print('Average mark: ${sumOfMarks / counter}');
  }

  @override
  String introduce() {
    super.introduce();
    return 'average mark: ${calculateAverage()}';
  }
}
