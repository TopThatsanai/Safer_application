class Task {
  String id;
  final String fname;
  final String lname;
  final String phone;
  final String address;
  final String name_task;
  final String detail_task;

  Task({
    this.id = '',
    required this.fname,
    required this.lname,
    required this.phone,
    required this.address,
    required this.name_task,
    required this.detail_task,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'fname': fname,
        'lname': lname,
        'phone': phone,
        'address': address,
        'name_task': name_task,
        'detail_task': detail_task,
      };

  static fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        fname: json['fname'],
        lname: json['lname'],
        phone: json['phone'],
        address: json['address'],
        name_task: json['name_task'],
        detail_task: json['detail_task'],
      );
}
