class AddNewsModel {
  String label;
  String review;
  String text;

  AddNewsModel({
    this.label,
    this.review,
    this.text,
  });

  AddNewsModel.fromJson(Map<String, dynamic> json){
    label = json['label'];
    review = json['review'];
    text = json['text'];
  }

  Map<String, dynamic> toMap()
  {
    return{
      'label': label,
      'review': review,
      'text': text,
    };
  }

}
