class QuotesModel {
  int? id;
  String? category, image;
  List<dynamic> qoutesList = [];
  List<dynamic
  > authorList = [];


  QuotesModel({
    this.id,
    this.category,
    this.image,
    required this.qoutesList,
    required this.authorList
  });

  factory QuotesModel.mapToModel(Map m1){
    return QuotesModel(
      id: m1['id'],
      category: m1['category'] ,
      image: m1['image'],
      qoutesList: m1['quotes'],
      authorList: m1['author'],
    );
  }
}

