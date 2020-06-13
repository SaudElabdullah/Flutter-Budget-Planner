class Expenses {
  String amount;
  String expenses;
  String date;
  String type;

  Expenses({this.type, this.amount, this.expenses, this.date});

  Expenses.fromJson(Map<String, dynamic> json)
      : amount = json['amount'],
        expenses = json['expenses'],
        date = json['date'],
        type = json['type'];

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'expenses': expenses,
    'date': date,
    'type': type,
  };

  String toString(){
    return type + amount + date;
  }
}