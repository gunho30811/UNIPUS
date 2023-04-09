class Item
{
  int? chur;
  int? fish;
  int? can;

  Map<String, dynamic> toMap() {
    return {
      'chur': chur,
      'fish': fish,
      'can': can,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      chur: map['chur'],
      fish: map['fish'],
      can: map['can'],
    );
  }

  Item({required this.chur, required this.fish, required this.can});

}