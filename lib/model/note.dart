class Note {
  int? id, amount;
  String name;
  DateTime dateTime;
  String category;

  Note({
    this.id,
    this.amount,
    required this.name,
    required this.dateTime,
    required this.category,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'name': name,
      'dateTime': dateTime,
      'category': category,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      name: map['name'],
      amount: map['amount'],
      dateTime: map['dateTime'],
      category: map['category'],
    );
  }
}