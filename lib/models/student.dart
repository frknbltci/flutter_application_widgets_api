class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String status;

  Student(this.firstName, this.lastName, this.grade);

  Student.withId(this.id, this.grade, this.lastName, this.firstName);
}
