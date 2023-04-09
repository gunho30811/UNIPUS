class ItemResponse
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

  factory ItemResponse.fromMap(Map<String, dynamic> map) {
    return ItemResponse(
      chur: map['chur'],
      fish: map['fish'],
      can: map['can'],
    );
  }

  ItemResponse({required this.chur, required this.fish, required this.can});

}