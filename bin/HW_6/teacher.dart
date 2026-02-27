import 'person.dart';

class Teacher extends Person {
  int experience;
  static double _baseSalary = 50000;
  Teacher(super.fullName, super.age, super.isMarried, this.experience);

  double calculateSalary() {
    //return _baseSalary + experience; //почему ритерн не работает?
    var salary = _baseSalary;
    if (isMarried == true) {
      salary += 5000;
    }
    for (int i = 3; i < experience; i++) {
      salary *= 1.05;
    }
    return salary;
  }

  @override
  String introduce() {
    super.introduce();
    return 'Experience: $experience, Salary: ${calculateSalary()}';
    //return 'Experience: $experience, Salary: ${calculateSalary()}'; //почему ритерн не работает?
  }
}
