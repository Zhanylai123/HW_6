import 'person.dart';
import 'student.dart';
import 'teacher.dart';

void main(List<String> args) {
  Person person1 = Person('Johnny Depp', 62, false);
  Person person2 = Person('Bob Marley', 36, true);

  person1.introduce();
  person2.introduce();

  print('');

  Student student1 = Student('Oliver Taylor', 15, false, {
    Subject.math: 85.5,
    Subject.physics: 90.0,
    Subject.english: 78.0,
    Subject.history: 88.5,
  });

  student1.showMarks();
  student1.calculateAverage();
  student1.introduce();

  print('');

  Student student2 = Student('George Williams', 14, false, {
    Subject.math: 63.5,
    Subject.physics: 75.0,
    Subject.english: 62.0,
    Subject.history: 84.5,
  });

  student2.showMarks();
  student2.calculateAverage();
  student2.introduce();

  
  print('');


  Teacher teacher1 = Teacher('Emma Brown', 44, false, 15);

  teacher1.introduce();
  print('Experience: ${teacher1.experience} years');
  print('Salary: ${teacher1.calculateSalary()}');
}